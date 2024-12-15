import 'package:falconx/lib.dart';

extension FalconPairDataAndFailureExtensions<F extends Failure?, DATA>
    on Pair<F, DATA> {
  bool get isEmpty => first == null && second == null;

  bool get isNotEmpty => !isEmpty;

  bool get hasFailure => first != null;

  bool get hasData => second != null;

  DATA get data => second;

  Failure? get failure => first;
}

extension FalconPairDataAndExceptionExtensions<E extends Exception?, DATA>
    on Pair<E, DATA> {
  bool get isEmpty => first == null && second == null;

  bool get isNotEmpty => !isEmpty;

  bool get hasException => first != null;

  bool get hasData => second != null;

  DATA get data => second;

  Exception? get exception => first;
}
