
extension FalconToolIntExtensions on int? {
  double toDoubleOrZero() {
    return this?.toDouble() ?? 0.0;
  }
}

extension FalconToolNumExtensions on num? {
  double toDoubleOrZero() {
    return this?.toDouble() ?? 0.0;
  }
}
