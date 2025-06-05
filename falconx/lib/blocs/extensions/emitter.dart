import 'package:falconx/lib.dart';

extension EmitterEvent<STATE extends WidgetDataState<DATA>, DATA>
    on Emitter<STATE> {}

extension EmitterExtensions<T> on Emitter<WidgetDataState<T>> {
  void emit(WidgetDataState<T> state) => call(state);

  void emitInitial(T data) => call(WidgetDataState.initial(data));

  void emitLoading(T data) => call(WidgetDataState.loading(data));

  void emitFail(T data) => call(WidgetDataState.fail(data));

  void emitWarning(T data) => call(WidgetDataState.warning(data));

  void emitSuccess(T data) => call(WidgetDataState.success(data));

  void emitCancel(T data) => call(WidgetDataState.cancel(data));

  void saveInitialState(T data) =>
      call(WidgetDataState.initial(data, build: false));

  void saveLoadingState(T data) =>
      call(WidgetDataState.loading(data, build: false));

  void saveFailState(T data) => call(WidgetDataState.fail(data, build: false));

  void saveWarningState(T data) =>
      call(WidgetDataState.warning(data, build: false));

  void saveSuccessState(T data) =>
      call(WidgetDataState.success(data, build: false));

  void saveCancelState(T data) =>
      call(WidgetDataState.cancel(data, build: false));

  /// Or use:
  /// emitter.emit(state.addEvent(...))
  void emitEvent(
    WidgetDataState<T> currentState, {
    required Object event,
    Object? data,
  }) =>
      call(currentState.addEvent(event, data));

  Future<void> callStream<A>({
    required Stream<WidgetDataState<A?>> call,
    required void Function(
      WidgetDataState<A?> state,
    ) onData,
    VoidFailureCallback? onFailure,
  }) =>
      onEach(
        call,
        onData: (state) {
          onData(state);
        },
        onError: (Object error, StackTrace stackTrace) {
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
