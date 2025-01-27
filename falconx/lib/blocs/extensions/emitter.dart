import 'package:falconx/lib.dart';

extension EmitterEvent<STATE extends WidgetStateEvent<DATA>, DATA>
    on Emitter<STATE> {}

extension EmitterExtensions<T> on Emitter<WidgetStateEvent<T>> {
  void emit(WidgetStateEvent<T> state) => call(state);

  void emitInitial(T data) =>
      call(WidgetStateEvent(FullWidgetState.initial, data: data));

  void emitLoading(T data) =>
      call(WidgetStateEvent(FullWidgetState.loading, data: data));

  void emitFail(T data) =>
      call(WidgetStateEvent(FullWidgetState.fail, data: data));

  void emitWarning(T data) =>
      call(WidgetStateEvent(FullWidgetState.warning, data: data));

  void emitSuccess(T data) =>
      call(WidgetStateEvent(FullWidgetState.success, data: data));

  @Deprecated('Please use emitter.emit(state.addEvent(...)')
  void emitEvent(
    WidgetStateEvent<T> currentState,
    Object event, [
    Object? data,
  ]) =>
      call(currentState.addEvent(event, data));

  Future<void> callStream<A>({
    required Stream<WidgetStateEvent<A?>> call,
    required Function(
      Emitter<WidgetStateEvent<T>> emitter,
      WidgetStateEvent<A?> state,
    ) onData,
    Function(
      Emitter<WidgetStateEvent<T>> emitter,
      Failure failure,
    )? onFailure,
  }) =>
      onEach(
        call,
        onData: (WidgetStateEvent<A?> state) {
          onData(this, state);
        },
        onError: (error, stackTrace) {
          if (error is Failure) {
            onFailure?.call(this, error);
          } else {
            printError(error, stackTrace);
            FlutterError.reportError(FlutterErrorDetails(
              exception: error,
              stack: stackTrace,
            ));
          }
        },
      );
}