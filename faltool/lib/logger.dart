// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:faltool/lib.dart';
import 'package:flutter/foundation.dart';

class Log {
  static Logger _logger = Logger();

  static final AnsiPen _title = AnsiPen()..white(bold: true);
  static final AnsiPen _error = AnsiPen()..red(bold: true);
  static final AnsiPen _success = AnsiPen()..green(bold: true);

  static void setup({
    LogFilter? filter,
    LogPrinter? printer,
    LogOutput? output,
    Level? level,
  }) {
    _logger = Logger(
      filter: filter,
      printer: printer,
      output: output,
      level: level,
    );
  }

  static void t(Object? message,
      {DateTime? time, Object? error, StackTrace? stackTrace}) {
    if (!kReleaseMode) {
      _logger.t(message?.toString() ?? 'Null',
          time: time, error: error, stackTrace: stackTrace);
    }
  }

  static void d(Object? message,
      {DateTime? time, Object? error, StackTrace? stackTrace}) {
    if (!kReleaseMode) {
      _logger.d(message?.toString() ?? 'Null',
          time: time, error: error, stackTrace: stackTrace);
    }
  }

  static void i(Object? message,
      {DateTime? time, Object? error, StackTrace? stackTrace}) {
    if (!kReleaseMode) {
      _logger.i(message?.toString() ?? 'Null',
          time: time, error: error, stackTrace: stackTrace);
    }
  }

  static void w(Object? message,
      {DateTime? time, Object? error, StackTrace? stackTrace}) {
    if (!kReleaseMode) {
      if (message is Error) {
        _logger.w(
          message.toString(),
          time: time,
          error: error ?? message,
          stackTrace: stackTrace ?? message.stackTrace,
        );
      } else if (message is Exception) {
        _logger.w(
          message.toString(),
          time: time,
          error: error ?? message,
          stackTrace: stackTrace,
        );
      } else {
        _logger.w(
          message.toString(),
          time: time,
          error: error,
          stackTrace: stackTrace,
        );
      }
    }
  }

  static void error(Object error, StackTrace stackTrace, {DateTime? time}) {
    if (!kReleaseMode) {
      _logger.e(
        error.toString(),
        error: error,
        stackTrace: stackTrace,
        time: time,
      );
    }
  }

  static void e(Object? message,
      {DateTime? time, Object? error, StackTrace? stackTrace}) {
    if (!kReleaseMode) {
      if (message is Error) {
        _logger.e(
          message.toString(),
          time: time,
          error: error ?? message,
          stackTrace: stackTrace ?? message.stackTrace,
        );
      } else if (message is Exception) {
        _logger.e(
          message.toString(),
          time: time,
          error: error ?? message,
          stackTrace: stackTrace,
        );
      } else {
        _logger.e(
          message.toString(),
          time: time,
          error: error,
          stackTrace: stackTrace,
        );
      }
    }
  }

  static void title(Object? message) {
    if (!kReleaseMode) {
      JsonEncoder encoder = const JsonEncoder.withIndent('  ');
      String prettyPrint = encoder.convert(
        message?.toString() ?? 'Null',
      );
      _printLong(_title(prettyPrint));
    }
  }

  static void success(Object? message) {
    if (!kReleaseMode) {
      JsonEncoder encoder = const JsonEncoder.withIndent('  ');
      String prettyPrint = encoder.convert(
        message?.toString() ?? 'Null',
      );
      _printLong(_success(prettyPrint));
    }
  }

  static void f(Object? message,
      {DateTime? time, Object? error, StackTrace? stackTrace}) {
    if (!kReleaseMode) {
      _logger.f(message?.toString() ?? 'Null',
          time: time, error: error, stackTrace: stackTrace);
    }
  }

  static void _printLong(Object? object) async {
    if (!kReleaseMode) {
      int defaultPrintLength = 1020;
      if (object == null || object.toString().length <= defaultPrintLength) {
        print(object);
      } else {
        String log = object.toString();
        int start = 0;
        int endIndex = defaultPrintLength;
        int logLength = log.length;
        int tmpLogLength = log.length;
        while (endIndex < logLength) {
          print(log.substring(start, endIndex));
          endIndex += defaultPrintLength;
          start += defaultPrintLength;
          tmpLogLength -= defaultPrintLength;
        }
        if (tmpLogLength > 0) {
          print(log.substring(start, logLength));
        }
      }
    }
  }
}
