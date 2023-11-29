import 'package:flutter/foundation.dart';
import 'package:loggy/loggy.dart';

class LoggerPrinter extends LoggyPrinter {
  const LoggerPrinter();

  static final Map<LogLevel, String> _levelStrings = <LogLevel, String>{
    LogLevel.debug: 'DEBUG',
    LogLevel.info: 'INFO ',
    LogLevel.warning: 'WARN ',
    LogLevel.error: 'ERROR',
  };

  @override
  void onLog(LogRecord record) {
    if (kDebugMode) {
      final String time = record.time.toIso8601String().split('T')[1];
      final String logLevel = _levelStrings[record.level]!;
      print('$time $logLevel ${record.loggerName} ${record.message}');
    }
  }
}
