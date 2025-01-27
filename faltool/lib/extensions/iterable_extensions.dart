import 'dart:async';

import 'package:faltool/lib.dart';

extension FalconToolIterableExtensions<T> on Iterable<T> {
  T? reduceOrNull(T Function(T value, T element) combine) {
    if (isEmpty) return null;
    return reduce(combine);
  }
}
