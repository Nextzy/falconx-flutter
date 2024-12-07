// ignore_for_file: constant_identifier_names
import 'package:falmodel/lib.dart';

class Failure<T> extends Equatable {
  const Failure({
    this.code,
    this.message,
    this.developerMessage,
    this.exception,
    this.stacktrace,
    this.failureList,
    this.data,
  });

  final String? code;
  final String? message;
  final String? developerMessage;
  final Object? exception;
  final StackTrace? stacktrace;
  final List<Failure>? failureList;
  final T? data;

  factory Failure.fromError(
    Error error, {
    String? code,
    StackTrace? stacktrace,
    List<Failure>? failureList,
    T? data,
  }) {
    return Failure(
      code: code,
      message: error.toString(),
      developerMessage: error.toString(),
      exception: error,
      stacktrace: stacktrace ?? error.stackTrace ?? StackTrace.current,
      failureList: failureList,
      data: data,
    );
  }

  factory Failure.fromException(
    Object exception, {
    String? code,
    StackTrace? stacktrace,
    List<Failure>? failureList,
    T? data,
  }) {
    return Failure(
      code: code,
      message: exception.toString(),
      developerMessage: exception.toString(),
      exception: exception,
      stacktrace: stacktrace ?? StackTrace.current,
      failureList: failureList,
      data: data,
    );
  }

  Failure copy(
    String? code,
    String? message,
    String? developerMessage,
    Object? exception,
    StackTrace? stacktrace,
    List<Failure>? failureList,
    T? data,
  ) {
    return Failure(
      code: code ?? this.code,
      message: message ?? this.message,
      developerMessage: developerMessage ?? this.developerMessage,
      exception: exception ?? this.exception,
      stacktrace: stacktrace ?? this.stacktrace,
      failureList: failureList ?? this.failureList,
      data: data ?? this.data,
    );
  }

  @override
  List<Object?> get props => [
        code,
        message,
        developerMessage,
        exception,
        stacktrace,
        failureList,
        data,
      ];
}
