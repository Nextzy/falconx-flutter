import 'package:falconx/lib.dart';

extension FalconEitherExtensions<F extends Failure, DATA> on Either<F, DATA> {
  B resolve<B>(B Function(DATA data) data, B Function(F fail) fail) =>
      fold(fail, data);

  bool get isFail => this is Left;

  bool get isNotFail => !isFail;

  bool get isData => this is Right;

  DATA get data => fold(
        (l) {
          throw Exception('Either is fail.');
        },
        (r) => r,
      );

  DATA? get dataOrNull => fold(
        (l) => null,
        (r) => r,
      );

  F get failure => fold(
        (l) => l,
        (r) {
          throw Exception('Either has data not fail.');
        },
      );

  F? get failureOrNull => fold(
        (l) => l,
        (r) => null,
      );
}

extension FalconEitherFutureExtensions<F extends Failure, DATA>
    on Future<Either<F, DATA>> {
  Future<B> resolve<B>(
          B Function(DATA data) data, B Function(F fail) fail) async =>
      (await this).fold(fail, data);
}
