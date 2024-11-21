import 'dart:convert';

import 'package:logger/logger.dart';

class Log {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 2, // Number of stack frames to display
      errorMethodCount: 8, // Number of stack frames for errors
      lineLength: 120, // Log line length
      colors: true, // Colorful logs
      printEmojis: true, // Include emojis
      dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
    ),
  );

  static void info(String message, {dynamic data}) {
    if (data != null) {
      // Convert the data to JSON format (string) if it's not already a string
      String jsonString = jsonEncode(data);
      _logger.i("$message - Data: $jsonString");
    } else {
      _logger.i(message);
    }
  }
  static void error(String message, {dynamic error}) {
    _logger.e(message, error: error);
  }

  /// Logs a fatal error with stack trace details
  static void fatal(String message, {dynamic error, StackTrace? stackTrace}) {
    _logger.f(message, error: error, stackTrace: stackTrace);
  }

  static void debug(String message) {
    _logger.d(message);
  }

  static void warning(String message) {
    _logger.w(message);
  }
}
