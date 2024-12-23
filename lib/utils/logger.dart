import 'dart:convert';

import 'package:logger/logger.dart';

class Log {
  static final Logger _logger = Logger(
    filter: null,
    printer: PrettyPrinter(
      colors: true,
      printEmojis: true,
    ),
    output: null,
  );

  static void info(String message, {dynamic data}) {
    if (data != null) {
      String jsonString = jsonEncode(data);
      _logger.i("$message - Data (truncated):");
      _logInChunks(jsonString);
    } else {
      _logger.i(message);
    }
  }

  static void _logInChunks(String data) {
    const chunkSize = 1000; // Adjust size based on your logger's limits
    for (var i = 0; i < data.length; i += chunkSize) {
      _logger.i(data.substring(i, i + chunkSize > data.length ? data.length : i + chunkSize));
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
