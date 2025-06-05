extension FalconToolDateTimeExtensions on int {
  DateTime get fromUnixToDateTime {
    final data = DateTime.fromMillisecondsSinceEpoch(this * 1000).toUtc();
    return data;
  }
}
