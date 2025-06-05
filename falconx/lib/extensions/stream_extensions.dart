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
          Right.new,
          (fail) => Left(mapFailure(fail)),
        ),
      );
}

extension FalconStreamDataAndExceptionExtensions<E extends Exception, DATA>
    on Stream<Either<E, DATA>> {
  Stream<Either<E, S>> mapEitherData<S>(
    S Function(DATA data) mapData,
  ) =>
      map(
        (event) => event.resolve(
          (data) => Right(mapData(data)),
          Left.new,
        ),
      );

  Stream<Either<Failure, DATA>> mapEitherFailure(
    Failure Function(E exception) mapException,
  ) =>
      map(
        (event) => event.resolve(
          Right.new,
          (exception) => Left(mapException(exception)),
        ),
      );

  Stream<Either<Failure, DATA>> mapEitherExceptionToFailure() => map(
        (event) => event.resolve(
          Right.new,
          (exception) => Left(Failure.fromException(exception.toString())),
        ),
      );

  Stream<Either<Failure, S>> mapEitherWithFailure<S>(
    S Function(DATA data) mapData, [
    Failure Function(E exception)? mapException,
  ]) =>
      map(
        (event) => event.resolve(
          (data) => Right(mapData(data)),
          (exception) => Left(
            mapException?.call(exception) ??
                Failure.fromException(exception.toString()),
          ),
        ),
      );
}
