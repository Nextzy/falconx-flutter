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
}

extension FalconStreamDataAndExceptionExtensions<F extends Failure,
    E extends Exception, DATA> on Stream<Either<E, DATA>> {
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
