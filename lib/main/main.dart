import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pg_slema/main/presentation/controller/main_screen_controller.dart';
import 'package:pg_slema/main/presentation/widget/main_screen.dart';
import 'package:pg_slema/utils/log/logger_printer.dart';
import 'package:provider/provider.dart';
import 'package:pg_slema/features/motivation/controller/motivation_screen_controller.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:loggy/loggy.dart';

void main() {
  Loggy.initLoggy(
    logPrinter: const LoggerPrinter(),
  );

  tz.initializeTimeZones();
  tz.setLocalLocation(tz.getLocation('Poland'));
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MainScreenController()),
        ChangeNotifierProvider(
            create: (context) => MotivationScreenController()),
      ],
      child: const MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('pl', 'PL'),
        ],
        home: MainScreen(),
      ),
    ),
  );
}
