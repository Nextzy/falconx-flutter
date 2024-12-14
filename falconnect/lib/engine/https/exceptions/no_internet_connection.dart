import 'package:falconnect/lib.dart';

class NoInternetConnectionException extends NetworkException {
  const NoInternetConnectionException({
    super.code,
    super.message = 'No internet connection.',
    super.response,
    super.requestOptions,
    super.developerMessage,
    super.stackTrace,
    super.errors,
  });
}
