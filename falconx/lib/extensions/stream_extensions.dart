import 'package:falconx/lib.dart';

extension FalconStreamExtensions<F extends Failure, DATA>
    on Stream<Either<F, DATA>> {
  Stream<Either<F, S>> mapEitherData<S>(S Function(DATA data) convert) => map(
        (event) => event.resolve(
          (data) => Right(convert(data)),
          (fail) => Left(fail),
        ),
      );
}
