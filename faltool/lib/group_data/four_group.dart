import 'package:faltool/lib.dart';

class Four<A, B, C, D> with EquatableMixin {
  const Four({
    required this.first,
    required this.second,
    required this.third,
    required this.fourth,
  });

  final A first;
  final B second;
  final C third;
  final D fourth;

  Four<A, B, C, D> copy({
    A? first,
    B? second,
    C? third,
    D? fourth,
  }) =>
      Four(
        first: first ?? this.first,
        second: second ?? this.second,
        third: third ?? this.third,
        fourth: fourth ?? this.fourth,
      );

  @override
  List<Object?> get props => [first, second, third, fourth];

  @override
  bool? get stringify => true;
}
