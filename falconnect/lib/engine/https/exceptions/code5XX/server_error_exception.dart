import 'package:falconnect/lib.dart';

/// Ref: https://en.wikipedia.org/wiki/List_of_HTTP_status_codes
class ServerErrorException extends NetworkException {
  const ServerErrorException({
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
            statusCode >= 500 && statusCode < 600, 'Error code not 500 to 600');
}
