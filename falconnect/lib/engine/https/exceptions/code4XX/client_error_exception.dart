import 'package:falconnect/lib.dart';

/// Ref: https://en.wikipedia.org/wiki/List_of_HTTP_status_codes
class ClientErrorException extends NetworkException {
  const ClientErrorException({
    required super.statusCode,
    super.type,
    super.statusMessage,
    super.errorMessage,
    super.developerMessage,
    super.response,
    super.requestOptions,
    super.stackTrace,
    super.errors,
  }) : assert(
            statusCode >= 400 && statusCode < 500, 'Error code not 400 to 500');
}
