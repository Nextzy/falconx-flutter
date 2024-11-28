import 'package:faltool/lib.dart';

class Six<A, B, C, D, E, F> with EquatableMixin {
  const Six({
    required this.first,
    required this.second,
    required this.third,
    required this.fourth,
    required this.fifth,
    required this.sixth,
  });

  final A first;
  final B second;
  final C third;
  final D fourth;
  final E fifth;
  final F sixth;

  Six<A, B, C, D, E, F> copy({
    A? first,
    B? second,
    C? third,
    D? fourth,
    E? fifth,
    F? sixth,
  }) =>
      Six(
        first: first ?? this.first,
        second: second ?? this.second,
        third: third ?? this.third,
        fourth: fourth ?? this.fourth,
        fifth: fifth ?? this.fifth,
        sixth: sixth ?? this.sixth,
      );

  @override
  List<Object?> get props => [first, second, third, fourth, fifth, sixth];

  @override
  bool? get stringify => true;
}
