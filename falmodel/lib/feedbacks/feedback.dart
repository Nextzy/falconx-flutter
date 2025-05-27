import 'package:falmodel/lib.dart';

abstract class UserFeedback<T> extends Equatable {
  const UserFeedback({
    this.code,
    this.message,
    this.data,
  });

  final Object? code;
  final String? message;
  final T? data;

  String? get successMessage => this is Success ? message : null;

  String? get errorMessage => this is Failure ? message : null;

  String? get warningMessage => this is Warning ? message : null;

  String? get informationMessage => this is Information ? message : null;

  @override
  List<Object?> get props => [
        code,
        message,
        data,
      ];
}

class NegativeFeedback<T> extends UserFeedback<T> {
  const NegativeFeedback({
    super.code,
    super.message,
    super.data,
    this.developerMessage,
    this.exception,
    this.stacktrace,
  });

  final String? developerMessage;
  final Object? exception;
  final StackTrace? stacktrace;

  @override
  List<Object?> get props => [
        ...super.props,
        developerMessage,
        exception,
        stacktrace,
      ];
}

class PositiveFeedback<T> extends UserFeedback<T> {
  const PositiveFeedback({
    super.code,
    super.message,
    super.data,
  });
}
