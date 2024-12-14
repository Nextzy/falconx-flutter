import 'package:falconx/lib.dart';

extension FalconStreamDataAndFailureExtensions<F extends Failure, DATA>
    on Stream<Either<F, DATA>> {
  Stream<Either<F, S>> mapEither<S>(
    S Function(DATA data) mapData, [
    F Function(F failue)? mapFailure,
  ]) =>
      map(
        (event) => event.resolve(
          (data) => Right(mapData(data)),
          (fail) => Left(mapFailure?.call(fail) ?? fail),
        ),
      );

  Stream<Either<F, DATA>> mapEitherFailure<S>(
    F Function(F failue) mapFailure,
  ) =>
      map(
        (event) => event.resolve(
          (data) => Right(data),
          (fail) => Left(mapFailure(fail)),
        ),
      );
}

extension FalconStreamDataAndExceptionExtensions<F extends Failure,
    E extends Exception, DATA> on Stream<Either<E, DATA>> {
  Stream<Either<E, S>> mapEitherData<S>(
    S Function(DATA data) mapData,
  ) =>
      map(
        (event) => event.resolve(
          (data) => Right(mapData(data)),
          (exception) => Left(exception),
        ),
      );

  Stream<Either<F, DATA>> mapEitherException(
    F Function(E exception) mapException,
  ) =>
      map(
        (event) => event.resolve(
          (data) => Right(data),
          (exception) => Left(mapException(exception)),
        ),
      );

  Stream<Either<F, S>> mapEitherWithFailure<S>(
    S Function(DATA data) mapData,
    F Function(E exception) mapException,
  ) =>
      map(
        (event) => event.resolve(
          (data) => Right(mapData(data)),
          (exception) => Left(mapException(exception)),
        ),
      );
}
