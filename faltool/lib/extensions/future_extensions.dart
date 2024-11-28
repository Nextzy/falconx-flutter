import 'package:faltool/lib.dart';

extension FalconToolFutureExtensions<T> on Future<T> {}

extension FalconToolEitherFutureExtensions<L, R> on Future<R> {
  Future<Either<L, R>> get right => then((value) => Right(value));
}
