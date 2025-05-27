// ignore_for_file: constant_identifier_names
import 'package:falmodel/lib.dart';

class Failure<T> extends NegativeFeedback<T> {
  const Failure({
    super.code,
    super.message,
    super.data,
    super.developerMessage,
    super.exception,
    super.stacktrace,
    this.failureList,
  });

  final List<Failure>? failureList;

  factory Failure.fromError(
    Error? error, {
    String? code,
    String? message,
    String? developMessage,
    StackTrace? stacktrace,
    List<Failure>? failureList,
    T? data,
  }) =>
      Failure(
        code: code,
        message: message,
        developerMessage: developMessage ?? error.toString(),
        exception: error,
        stacktrace: stacktrace ?? error?.stackTrace ?? StackTrace.current,
        failureList: failureList,
        data: data,
      );

  factory Failure.fromException(
    Object? exception, {
    String? code,
    String? message,
    String? developMessage,
    StackTrace? stacktrace,
    List<Failure>? failureList,
    T? data,
  }) =>
      Failure(
        code: code,
        message: message,
        developerMessage: developMessage ?? exception.toString(),
        exception: exception,
        stacktrace: stacktrace ?? StackTrace.current,
        failureList: failureList,
        data: data,
      );

  Failure copy({
    String? code,
    String? message,
    String? developerMessage,
    Object? exception,
    StackTrace? stacktrace,
    List<Failure>? failureList,
    T? data,
  }) =>
      Failure(
        code: code ?? this.code,
        message: message ?? this.message,
        developerMessage: developerMessage ?? this.developerMessage,
        exception: exception ?? this.exception,
        stacktrace: stacktrace ?? this.stacktrace,
        failureList: failureList ?? this.failureList,
        data: data ?? this.data,
      );

  @override
  List<Object?> get props => [
        ...super.props,
        failureList,
      ];
}
