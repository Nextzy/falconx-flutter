extension FalconToolDateTimeExtensions on int {
  DateTime get fromUnixToDateTime {
    var data = DateTime.fromMillisecondsSinceEpoch((this * 1000)).toUtc();
    return data;
  }
}
