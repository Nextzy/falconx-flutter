import 'package:falmodel/lib.dart';

class Information<T> extends PositiveFeedback<T> {
  const Information({
    super.code,
    super.message,
    super.data,
  });

  Information copy({
    String? code,
    String? message,
    T? data,
  }) =>
      Information(
        code: code ?? this.code,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  @override
  List<Object?> get props => [
        ...super.props,
      ];
}
