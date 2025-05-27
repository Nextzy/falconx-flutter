import 'package:falconnect/lib.dart';

class NotFoundException extends ClientNetworkException {
  const NotFoundException({
    super.statusCode = 404,
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
