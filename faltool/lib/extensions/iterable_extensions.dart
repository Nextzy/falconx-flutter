extension FalconToolIterableExtensions<T> on Iterable<T> {
  T? reduceOrNull(T Function(T value, T element) combine) {
    if (isEmpty) return null;
    if (length == 1) return first;
    return reduce(combine);
  }

  T reduceSafe(T Function(T value, T element) combine, T defaultValue) {
    if (isEmpty) return defaultValue;
    if (length == 1) return first;
    return reduce(combine);
  }
}

extension FalconToolNullIterableExtensions<T> on Iterable<T>? {
  T? reduceOrNull(T Function(T value, T element) combine) {
    if (this == null || this?.isEmpty == true) return null;
    if (this?.length == 1) return this?.first;
    return this?.reduce(combine);
  }

  T reduceSafe(T Function(T value, T element) combine, T defaultValue) {
    if (this == null || this?.isEmpty == true) return defaultValue;
    if (this?.length == 1) return this?.first ?? defaultValue;
    return this?.reduce(combine) ?? defaultValue;
  }
}
