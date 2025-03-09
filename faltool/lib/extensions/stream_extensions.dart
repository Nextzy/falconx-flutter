import 'dart:async';

extension FalconToolStreamExtension<T> on Stream<T> {
  Stream<S> mapTransform<S>({
    required Function(T data, EventSink<S> sink) handleData,
    Function(Object error, StackTrace stackTrace, EventSink<S> sink)?
        handleError,
  }) =>
      transform<S>(StreamTransformer<T, S>.fromHandlers(
        handleData: handleData,
        handleError: handleError,
      ));
}
