import 'dart:async';

import 'package:faltool/lib.dart';

extension FalconToolIterableExtensions<T> on Iterable<T> {
  T? reduceOrNull(T Function(T value, T element) combine) {
    if (isEmpty) return null;
    if (length == 1) {
      return iterator.current;
    }

    return reduce(combine);
  }
}
