import 'package:falconnect/lib.dart';

class SocketRetryException extends SocketException {
  const SocketRetryException({
    required this.retryCount,
    super.response,
    String? message,
    super.exception,
    super.stackTrace,
  }) : super(
          message: message ?? 'Retry request at $retryCount',
        );

  final int retryCount;
}
