// ignore_for_file: constant_identifier_names
import 'package:falmodel/lib.dart';

class Warning<T> extends NegativeFeedback<T> {
  const Warning({
    super.code,
    super.message,
    super.data,
    super.developerMessage,
    super.exception,
    super.stacktrace,
    this.warningList,
  });

  final List<Warning>? warningList;

  factory Warning.fromError(
    Error? error, {
    String? code,
    String? message,
    String? developMessage,
    StackTrace? stacktrace,
    List<Warning>? warningList,
    T? data,
  }) =>
      Warning(
        code: code,
        message: message,
        developerMessage: developMessage ?? error.toString(),
        exception: error,
        stacktrace: stacktrace ?? error?.stackTrace ?? StackTrace.current,
        warningList: warningList,
        data: data,
      );

  factory Warning.fromException(
    Object? exception, {
    String? code,
    String? message,
    String? developMessage,
    StackTrace? stacktrace,
    List<Warning>? failureList,
    T? data,
  }) =>
      Warning(
        code: code,
        message: message,
        developerMessage: developMessage ?? exception.toString(),
        exception: exception,
        stacktrace: stacktrace ?? StackTrace.current,
        warningList: failureList,
        data: data,
      );

  Warning copy({
    String? code,
    String? message,
    String? developerMessage,
    Object? exception,
    StackTrace? stacktrace,
    List<Warning>? warning,
    T? data,
  }) =>
      Warning(
        code: code ?? this.code,
        message: message ?? this.message,
        developerMessage: developerMessage ?? this.developerMessage,
        exception: exception ?? this.exception,
        stacktrace: stacktrace ?? this.stacktrace,
        warningList: warning ?? this.warningList,
        data: data ?? this.data,
      );

  @override
  List<Object?> get props => [
        ...super.props,
        warningList,
      ];
}
