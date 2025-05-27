import 'package:falmodel/lib.dart';

abstract class UserFeedback<T> extends Equatable {
  const UserFeedback({
    this.code,
    this.message,
    this.data,
  });

  final String? code;
  final String? message;
  final T? data;

  @override
  List<Object?> get props => [
        code,
        message,
        data,
      ];
}
