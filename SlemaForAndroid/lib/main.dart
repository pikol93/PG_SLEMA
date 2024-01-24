import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pg_slema/initializers/global_initializer.dart';
import 'package:pg_slema/main/presentation/controller/main_screen_controller.dart';
import 'package:pg_slema/main/presentation/widget/main_screen.dart';
import 'package:pg_slema/theme/theme_constants.dart';
import 'package:pg_slema/utils/log/logger_printer.dart';
import 'package:provider/provider.dart';
import 'package:pg_slema/features/motivation/controller/motivation_screen_controller.dart';
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

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MainScreenController()),
        ChangeNotifierProvider(
            create: (context) => MotivationScreenController()),
      ],
      child: MaterialApp(
        theme: lightTheme,
        darkTheme: darkTheme,
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
