abstract class DataException<T> implements Exception {
  final T type;
  final String? message;

  const DataException({
    required this.type,
    this.message,
  });

  @override
  String toString() {
    String msg = '[$type]\n';
    if (message != null && message!.isNotEmpty) {
      msg += ' | Exception: $message';
    }
    return msg;
  }
}

