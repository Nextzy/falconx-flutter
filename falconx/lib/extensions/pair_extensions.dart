import 'package:falconx/lib.dart';

extension FalconPairExtensions<F extends Failure?, DATA> on Pair<F, DATA> {
  bool get isEmpty => first == null && second == null;

  bool get isNotEmpty => !isEmpty;

  bool get isFail => first != null;

  bool get isNotFail => !isFail;

  DATA get data => second;

  Failure? get failure => first;
}
