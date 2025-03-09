export 'falconnect.dart';

export 'dart:async';
export 'dart:convert';
export 'dart:io' hide SocketException, HttpResponse;
export 'package:ansicolor/ansicolor.dart';
export 'package:falconnect/utils/nlog.dart';
export 'package:falmodel/falmodel.dart';
export 'package:faltool/faltool.dart';
export 'package:freezed_annotation/freezed_annotation.dart';

import 'dart:convert';
import 'package:ansicolor/ansicolor.dart';
import 'package:flutter/foundation.dart';

final AnsiPen _normal = AnsiPen()..white(bold: true);
final AnsiPen _error = AnsiPen()..red(bold: true);
final AnsiPen _success = AnsiPen()..green(bold: true);

void printInfo(Object? message) {
  if (kDebugMode) {
    try {
      JsonEncoder encoder = const JsonEncoder.withIndent('  ');
      String prettyPrint = encoder.convert(message?.toString());
      print(_normal(prettyPrint));
    } catch (error) {
      print(error);
    }
  }
}

void printError(Object? message, [StackTrace? stacktrace]) {
  if (kDebugMode) {
    try {
      JsonEncoder encoder = const JsonEncoder.withIndent('  ');
      String prettyPrint = encoder.convert(message?.toString());
      print(_error(prettyPrint));
      if (stacktrace != null) {
        print(_error(stacktrace.toString().trimRight()));
      }
    } catch (error) {
      print(error);
    }
  }
}

void printSuccess(Object? message) {
  if (kDebugMode) {
    try {
      JsonEncoder encoder = const JsonEncoder.withIndent('  ');
      String prettyPrint = encoder.convert(message?.toString());
      print(_success(prettyPrint));
    } catch (error) {
      print(error);
    }
  }
}
