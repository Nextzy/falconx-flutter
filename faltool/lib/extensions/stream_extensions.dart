import 'dart:async';
import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';
import 'package:faltool/lib.dart';

extension FalconToolStreamExtension<T> on Stream<T> {
  Stream<S> mapTransform<S>({
    required Function(T data, EventSink<S> sink) handleData,
    Function(Object error, StackTrace stackTrace, EventSink<S> sink)?
        handleError,
  }) =>
      transform<S>(StreamTransformer<T, S>.fromHandlers(
        handleData: (T data, EventSink<S> sink) {
          handleData.call(data, sink);
        },
        handleError: handleError,
      ));
}
