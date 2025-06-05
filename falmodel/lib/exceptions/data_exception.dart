abstract class DataException<T> implements Exception {
  const DataException({
    required this.type,
    this.message,
  });

  final T type;
  final String? message;

  @override
  String toString() {
    var msg = '[$type]\n';
    if (message != null && message!.isNotEmpty) {
      msg += ' | Exception: $message';
    }
    return msg;
  }
}
