import 'package:falconnect/lib.dart';

class AuthenticationException extends ClientNetworkException {
  const AuthenticationException({
    super.statusCode = 401,
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
