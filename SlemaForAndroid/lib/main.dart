import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pg_slema/features/chat/logic/repository/threads/threads_repository_impl.dart';
import 'package:pg_slema/features/chat/logic/service/threads/threads_service.dart';
import 'package:pg_slema/features/chat/logic/service/threads/threads_service_impl.dart';
import 'package:pg_slema/features/exercises/logic/converter/exercise_to_dto_converter.dart';
import 'package:pg_slema/features/exercises/logic/repository/shared_preferences_exercise_repository.dart';
import 'package:pg_slema/features/exercises/logic/service/exercise_service.dart';
import 'package:pg_slema/features/motivation/presentation/controller/motivation_screen_controller.dart';
import 'package:pg_slema/features/settings/logic/application_info_repository.dart';
import 'package:pg_slema/features/settings/logic/application_info_repository_impl.dart';
import 'package:pg_slema/features/well_being/logic/entity/assessment_factory.dart';
import 'package:pg_slema/features/well_being/logic/entity/enum/assessment_factory_impl.dart';
import 'package:pg_slema/features/well_being/logic/repository/assessments_repository.dart';
import 'package:pg_slema/features/well_being/logic/repository/shared_preferences_assessments_repository.dart';
import 'package:pg_slema/features/well_being/logic/service/assessments_service.dart';
import 'package:pg_slema/features/well_being/logic/service/assessments_service_impl.dart';
import 'package:pg_slema/initializers/global_initializer.dart';
import 'package:pg_slema/main/presentation/controller/main_screen_controller.dart';
import 'package:pg_slema/main/presentation/screen/main_screen.dart';
import 'package:pg_slema/theme/theme_constants.dart';
import 'package:pg_slema/utils/log/logger_mixin.dart';
import 'package:pg_slema/utils/log/logger_printer.dart';
import 'package:provider/provider.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:loggy/loggy.dart';

Future<void> main() async {
  Loggy.initLoggy(
    logPrinter: const LoggerPrinter(),
  );
  tz.initializeTimeZones();
  tz.setLocalLocation(tz.getLocation('Poland'));
  WidgetsFlutterBinding.ensureInitialized();
  GlobalInitializer().initialize();

  final assessmentsRepository =
      await SharedPreferencesAssessmentsRepository.create();
  final assessmentsService =
      AssessmentsServiceImpl(repository: assessmentsRepository);
  final assessmentFactory =
      AssessmentFactoryImpl(repository: assessmentsRepository);

  var exercisesConverter = ExerciseToDtoConverter();
  final exerciseRepository =
      SharedPreferencesExerciseRepository(exercisesConverter);
  final exerciseService = ExerciseService(exerciseRepository);

  final applicationInfoRepository =
      await ApplicationInfoRepositoryImpl.create();

  // TODO: The address is only set at the start...

  final logger = Loggy<Logger>("main");
  final dio = Dio();
  try {
    dio.options.baseUrl = applicationInfoRepository.getServerAddress();
    logger.debug(
        "Correctly set base URL to ${applicationInfoRepository.getServerAddress()}");
  } catch (ex) {
    logger.error(
        "Invalid base URL: \"${applicationInfoRepository.getServerAddress()}\"\n$ex}");
  }
  dio.options.connectTimeout = const Duration(seconds: 5);
  dio.options.receiveTimeout = const Duration(seconds: 3);

  final threadsRepository = ThreadsRepositoryImpl(dio: dio);
  final threadsService = ThreadsServiceImpl(threadsRepository);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MainScreenController()),
        ChangeNotifierProvider(
          create: (context) => MotivationScreenController(),
        ),
        Provider<AssessmentsRepository>(create: (_) => assessmentsRepository),
        Provider<AssessmentsService>(create: (_) => assessmentsService),
        Provider<AssessmentFactory>(create: (_) => assessmentFactory),
        Provider<ExerciseService>(create: (_) => exerciseService),
        Provider<ApplicationInfoRepository>(
            create: (_) => applicationInfoRepository),
        Provider<ThreadsService>(create: (_) => threadsService),
      ],
      child: MaterialApp(
        theme: lightTheme,
        // TODO: Dark theme has been disabled as of SLEMA-172. It is to be enabled once dark theme is ready to be used.
        darkTheme: lightTheme,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('pl', 'PL'),
        ],
        home: const MainScreen(),
      ),
    ),
  );
}
