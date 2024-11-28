import 'package:faltool/lib.dart';

class Three<A, B, C> with EquatableMixin {
  const Three({
    required this.first,
    required this.second,
    required this.third,
  });

  final A first;
  final B second;
  final C third;

  Three<A, B, C> copy({
    A? first,
    B? second,
    C? third,
  }) =>
      Three(
        first: first ?? this.first,
        second: second ?? this.second,
        third: third ?? this.third,
      );

  @override
  List<Object?> get props => [first, second, third];

  @override
  bool? get stringify => true;
}
