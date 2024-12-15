import 'package:falconx/lib.dart';

extension FalconFutureExtensions<T> on Future<T> {
  Future<Either<Failure, T>> toEitherFailure({
    Failure Function(Object? error, StackTrace stacktrace)? handleError,
  }) =>
      then<Either<Failure, T>>(
        (T value) => Right(value),
      ).onError(
        (error, stackTrace) {
          if (handleError != null) return Left(handleError(error, stackTrace));

          if (error is NetworkException) {
            return Left(
              Failure(
                code: error.code.toString(),
                message: error.message,
                developerMessage: error.developerMessage,
                exception: error,
                stacktrace: stackTrace,
                failureList: error.errors
                    ?.whereType<NetworkException>()
                    .map(
                      (e) => Failure(
                        code: e.code.toString(),
                        message: e.message,
                        developerMessage: e.developerMessage,
                        exception: e,
                        stacktrace: stackTrace,
                      ),
                    )
                    .toList(),
              ),
            );
          } else {
            return Left(Failure.fromException(error));
          }
        },
      );

  Future<Either<Exception, T>> toEitherException({
    Exception Function(Object? error, StackTrace stacktrace)? handleError,
  }) =>
      then<Either<Exception, T>>(
        (T value) => Right(value),
      ).onError(
        (error, stackTrace) {
          if (handleError != null) return Left(handleError(error, stackTrace));
          if (error is Exception) {
            return Left(error);
          } else {
            return Left(Exception(error.toString()));
          }
        },
      );
}
