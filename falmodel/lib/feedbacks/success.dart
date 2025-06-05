import 'package:falmodel/lib.dart';

class Success<T> extends PositiveFeedback<T> {
  const Success({
    super.code,
    super.message,
    super.data,
  });

  Success copy({
    String? code,
    String? message,
    T? data,
  }) =>
      Success(
        code: code ?? this.code,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  @override
  List<Object?> get props => [
        ...super.props,
      ];
}
