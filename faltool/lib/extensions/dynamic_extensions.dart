
extension FalconToolDynamicExtensions on dynamic {

  double toDoubleOrZero() {
    if(this == null) return 0.0;
    if(this is int) return (this as int).toDouble();
    if(this is num) return (this as num).toDouble();
    return this as double;
  }

}
