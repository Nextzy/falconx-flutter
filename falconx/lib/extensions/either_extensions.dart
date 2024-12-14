import 'package:falconx/lib.dart';

extension FalconEitherDataAndFailueExtensions<F extends Failure, DATA>
    on Either<F, DATA> {
  B resolve<B>(B Function(DATA data) data, B Function(F fail) fail) =>
      fold(fail, data);

  bool get hasFailure => this is Left;

  bool get hasData => this is Right;

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

extension FalconEitherDataAndExceptionExtensions<E extends Exception, DATA>
    on Either<E, DATA> {
  B resolve<B>(B Function(DATA data) data, B Function(E exception) exception) =>
      fold(exception, data);

  bool get hasException => this is Left;

  bool get hasData => this is Right;

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

  E get exception => fold(
        (l) => l,
        (r) {
          throw Exception('Either has data not exception.');
        },
      );

  E? get exceptionOrNull => fold(
        (l) => l,
        (r) => null,
      );
}

extension FalconEitherDataAndFailurFutureExtensions<F extends Failure, DATA>
    on Future<Either<F, DATA>> {
  Future<B> resolve<B>(
          B Function(DATA data) data, B Function(F fail) fail) async =>
      (await this).fold(fail, data);
}

extension FalconEitherDataAndExceptionFutureExtensions<E extends Exception,
    DATA> on Future<Either<E, DATA>> {
  Future<B> resolve<B>(B Function(DATA data) data,
          B Function(E exception) exception) async =>
      (await this).fold(exception, data);
}
