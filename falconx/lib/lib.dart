export 'falconx.dart';

import 'dart:convert';
import 'package:ansicolor/ansicolor.dart';
import 'package:flutter/foundation.dart';

final AnsiPen _normal = AnsiPen()..white(bold: true);
final AnsiPen _error = AnsiPen()..red(bold: true);
final AnsiPen _success = AnsiPen()..green(bold: true);

void printInfo(Object? message) {
  if (kDebugMode) {
    JsonEncoder encoder = const JsonEncoder.withIndent('  ');
    String prettyPrint = encoder.convert(message?.toString());
    print(_normal(prettyPrint));
  }
}

void printError(Object? message, [StackTrace? stacktrace]) {
  if (kDebugMode) {
    JsonEncoder encoder = const JsonEncoder.withIndent('  ');
    String prettyPrint = encoder.convert(message?.toString());
    print(_error(prettyPrint));
    if (stacktrace != null) {
      print(_error(stacktrace.toString().trimRight()));
    }
  }
}

void printSuccess(Object? message) {
  if (kDebugMode) {
    JsonEncoder encoder = const JsonEncoder.withIndent('  ');
    String prettyPrint = encoder.convert(message?.toString());
    print(_success(prettyPrint));
  }
}
