import 'package:falconnect/lib.dart';

class NonStandardErrorException extends NetworkException {
  const NonStandardErrorException({
    required super.statusCode,
    super.type,
    super.statusMessage,
    super.errorMessage,
    super.developerMessage,
    super.response,
    super.requestOptions,
    super.stackTrace,
    super.errors,
  }) : assert(statusCode >= 600, 'Error code < 600');
}
