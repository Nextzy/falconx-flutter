import 'package:faltool/lib.dart';

class Two<A, B> with EquatableMixin {
  const Two({
    required this.first,
    required this.second,
  });

  final A first;
  final B second;

  Two<A, B> copy({
    A? first,
    B? second,
  }) =>
      Two(
        first: first ?? this.first,
        second: second ?? this.second,
      );

  @override
  List<Object?> get props => [first, second];

  @override
  bool? get stringify => true;
}
