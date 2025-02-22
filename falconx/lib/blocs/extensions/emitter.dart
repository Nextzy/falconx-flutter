import 'package:falconx/lib.dart';

extension EmitterEvent<STATE extends WidgetStateEvent<DATA>, DATA>
    on Emitter<STATE> {}

extension EmitterExtensions<T> on Emitter<WidgetStateEvent<T>> {
  void emit(WidgetStateEvent<T> state) => call(state);

  void emitInitial(T data) => call(WidgetStateEvent.initial(data));

  void emitLoading(T data) => call(WidgetStateEvent.loading(data));

  void emitFail(T data) => call(WidgetStateEvent.fail(data));

  void emitWarning(T data) => call(WidgetStateEvent.warning(data));

  void emitSuccess(T data) => call(WidgetStateEvent.success(data));

  void emitCancel(T data) => call(WidgetStateEvent.cancel(data));

  void saveInitialState(T data) =>
      call(WidgetStateEvent.initial(data, build: false));

  void saveLoadingState(T data) =>
      call(WidgetStateEvent.loading(data, build: false));

  void saveFailState(T data) => call(WidgetStateEvent.fail(data, build: false));

  void saveWarningState(T data) =>
      call(WidgetStateEvent.warning(data, build: false));

  void saveSuccessState(T data) =>
      call(WidgetStateEvent.success(data, build: false));

  void saveCancelState(T data) =>
      call(WidgetStateEvent.cancel(data, build: false));

  /// Or use:
  /// emitter.emit(state.addEvent(...))
  void emitEvent(
    WidgetStateEvent<T> currentState, {
    required Object event,
    Object? data,
  }) =>
      call(currentState.addEvent(event, data));

  Future<void> callStream<A>({
    required Stream<WidgetStateEvent<A?>> call,
    required Function(
      WidgetStateEvent<A?> state,
    ) onData,
    Function(
      Failure failure,
    )? onFailure,
  }) =>
      onEach(
        call,
        onData: (state) {
          onData(state);
        },
        onError: (error, stackTrace) {
          if (error is Failure) {
            onFailure?.call(error);
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
