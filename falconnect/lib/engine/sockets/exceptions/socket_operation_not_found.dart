import 'package:falconnect/lib.dart';

class SocketOperationNotFound extends SocketException {
  const SocketOperationNotFound({
    super.response,
    String? message,
    super.exception,
    super.stackTrace,
  }) : super(
          message: message ?? 'Operation not match',
        );
}
