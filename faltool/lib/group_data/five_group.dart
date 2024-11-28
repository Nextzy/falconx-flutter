import 'package:faltool/lib.dart';

class Five<A, B, C, D, E> with EquatableMixin {
  const Five({
    required this.first,
    required this.second,
    required this.third,
    required this.fourth,
    required this.fifth,
  });

  final A first;
  final B second;
  final C third;
  final D fourth;
  final E fifth;

  Five<A, B, C, D, E> copy({
    A? first,
    B? second,
    C? third,
    D? fourth,
    E? fifth,
  }) =>
      Five(
        first: first ?? this.first,
        second: second ?? this.second,
        third: third ?? this.third,
        fourth: fourth ?? this.fourth,
        fifth: fifth ?? this.fifth,
      );

  @override
  List<Object?> get props => [first, second, third, fourth, fifth];

  @override
  bool? get stringify => true;
}
