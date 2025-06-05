import 'dart:async';

extension FalconToolStreamExtension<T> on Stream<T> {
  Stream<S> mapTransform<S>({
    required void Function(T data, EventSink<S> sink) handleData,
    void Function(Object error, StackTrace stackTrace, EventSink<S> sink)?
        handleError,
  }) =>
      transform<S>(StreamTransformer<T, S>.fromHandlers(
        handleData: handleData,
        handleError: handleError,
      ));
}
