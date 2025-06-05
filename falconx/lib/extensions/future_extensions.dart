import 'package:falconx/lib.dart';

extension FalconFutureExtensions<T> on Future<T> {
  Future<Either<Failure, T>> toEitherFailure({
    Failure Function(Object? error, StackTrace stacktrace)? handleError,
  }) =>
      then<Either<Failure, T>>(
        Right.new,
      ).onError(
        (exception, stackTrace) {
          if (exception is DioException) {
            final tmpError = exception.error;
            if (tmpError case final NetworkException networkException) {
              Log.e(networkException, stackTrace: networkException.stackTrace);
              return Left(
                handleError?.call(exception, stackTrace) ??
                    Failure(
                      code: networkException.statusCode.toString(),
                      message: networkException.errorMessage ??
                          networkException.statusMessage,
                      developerMessage: networkException.developerMessage,
                      exception: networkException,
                      stacktrace: stackTrace,
                      failureList: networkException.errors
                          ?.whereType<NetworkException>()
                          .map(
                            (e) => Failure(
                              code: e.statusCode.toString(),
                              message: networkException.errorMessage ??
                                  networkException.statusMessage,
                              developerMessage:
                                  networkException.developerMessage,
                              exception: e,
                              stacktrace: stackTrace,
                            ),
                          )
                          .toList(),
                    ),
              );
            } else if (tmpError != null) {
              Log.e(tmpError, stackTrace: exception.stackTrace);
              return Left(
                handleError?.call(exception, stackTrace) ??
                    Failure.fromException(
                      tmpError,
                      stacktrace: exception.stackTrace,
                    ),
              );
            } else {
              Log.e(exception, stackTrace: exception.stackTrace);
              return Left(
                handleError?.call(exception, stackTrace) ??
                    Failure.fromException(
                      exception,
                      stacktrace: exception.stackTrace,
                    ),
              );
            }
          } else if (exception is Exception) {
            Log.e(exception);
            return Left(
              handleError?.call(exception, stackTrace) ??
                  Failure.fromException(
                    exception,
                    stacktrace: stackTrace,
                  ),
            );
          } else {
            Log.e(exception);
            return Left(
              handleError?.call(exception, stackTrace) ??
                  Failure.fromException(
                    exception,
                    stacktrace: stackTrace,
                  ),
            );
          }
        },
      );

  Future<Either<Exception, T>> toEitherException({
    Exception Function(Object? error, StackTrace stacktrace)? handleError,
  }) =>
      then<Either<Exception, T>>(
        Right.new,
      ).onError(
        (exception, stackTrace) {
          if (exception is DioException) {
            final tmpError = exception.error;
            if (tmpError case final NetworkException networkException) {
              Log.e(networkException, stackTrace: networkException.stackTrace);
              return Left(
                handleError?.call(exception, stackTrace) ?? networkException,
              );
            } else {
              Log.e(exception, stackTrace: exception.stackTrace);
              return Left(
                handleError?.call(exception, stackTrace) ?? exception,
              );
            }
          } else if (exception is Exception) {
            Log.e(exception);
            return Left(
              handleError?.call(exception, stackTrace) ?? exception,
            );
          } else {
            Log.e(exception);
            return Left(
              handleError?.call(exception, stackTrace) ??
                  Exception(exception.toString()),
            );
          }
        },
      );
}
