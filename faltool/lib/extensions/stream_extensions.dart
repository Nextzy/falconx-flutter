import 'dart:async';
import 'package:faltool/lib.dart';

extension FalconToolStreamExtension<T> on Stream<T> {
  Stream<S> mapTransform<S>({Function(S data, EventSink<T> sink)? handleData}) {
    return transform(StreamTransformer<T, S>.fromHandlers(
      handleData: (T data, EventSink<S> sink) {},
      handleError: (error, stackTrace, sink) {
        Log.e(error, stackTrace: stackTrace);
      },
    ));
  }
}
