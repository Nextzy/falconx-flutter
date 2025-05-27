import 'package:falconnect/lib.dart';

class MethodNotAllowedException extends ClientNetworkException {
  const MethodNotAllowedException({
    super.statusCode = 405,
    super.type,
    super.statusMessage,
    super.errorMessage,
    super.developerMessage,
    super.response,
    super.requestOptions,
    super.stackTrace,
    super.errors,
  });
}
