import 'package:falconx/lib.dart';

abstract class FalconWidgetDataStateBloc<EVENT, DATA>
    extends FalconEventBloc<EVENT, WidgetDataState<DATA>> {
  FalconWidgetDataStateBloc(
    DATA initialData, {
    EventTransformer<BlocEvent<EVENT>>? transformer,
  }) : super(
          WidgetDataState.initial(initialData),
          transformer: transformer,
        );

  DATA get data => state.data;

  void _emit(WidgetDataState<DATA> state) {
    assertEmitter();
    _emitter?.call(state);
  }

  void emitEvent<T>(Object event, [T? data]) =>
      _emit(state.addEvent(event, data));

  void emitInitial({DATA? data, Failure? feedback}) =>
      _emit(WidgetDataState.initial(
        data ?? state.data,
        feedback: feedback,
        build: true,
      ));

  void emitLoading({DATA? data, Failure? feedback}) =>
      _emit(WidgetDataState.loading(
        data ?? state.data,
        feedback: feedback,
        build: true,
      ));

  void emitFail({DATA? data, Failure? feedback}) => _emit(WidgetDataState.fail(
        data ?? state.data,
        feedback: feedback,
        build: true,
      ));

  void emitWarning({DATA? data, Warning? feedback}) =>
      _emit(WidgetDataState.warning(
        data ?? state.data,
        feedback: feedback,
        build: true,
      ));

  void emitSuccess({DATA? data, UserFeedback? feedback}) =>
      _emit(WidgetDataState.success(
        data ?? state.data,
        feedback: feedback,
        build: true,
      ));

  void emitCancel({DATA? data, UserFeedback? feedback}) =>
      _emit(WidgetDataState.cancel(
        data ?? state.data,
        feedback: feedback,
        build: true,
      ));

  void saveInitialState(DATA data, {UserFeedback? feedback}) =>
      _emit(WidgetDataState.initial(
        data,
        feedback: feedback,
        build: false,
      ));

  void saveLoadingState(DATA data, {UserFeedback? feedback}) =>
      _emit(WidgetDataState.loading(
        data,
        feedback: feedback,
        build: false,
      ));

  void saveFailState(DATA data, {Failure? feedback}) =>
      _emit(WidgetDataState.fail(
        data,
        feedback: feedback,
        build: false,
      ));

  void saveWarningState(DATA data, {Warning? feedback}) =>
      _emit(WidgetDataState.warning(
        data,
        feedback: feedback,
        build: false,
      ));

  void saveSuccessState(DATA data, {UserFeedback? feedback}) =>
      _emit(WidgetDataState.success(
        data,
        feedback: feedback,
        build: false,
      ));

  void saveCancelState(DATA data, {UserFeedback? feedback}) =>
      _emit(WidgetDataState.cancel(
        data,
        feedback: feedback,
        build: false,
      ));
}

abstract class FalconNullableWidgetDataStateBloc<EVENT, DATA>
    extends FalconEventBloc<EVENT, WidgetDataState<DATA?>> {
  FalconNullableWidgetDataStateBloc({
    DATA? initialData,
    EventTransformer<BlocEvent<EVENT>>? transformer,
  }) : super(WidgetDataState.initial(initialData), transformer: transformer);

  DATA? get data => state.data;

  void _emit(WidgetDataState<DATA?> state) {
    assertEmitter();
    _emitter?.call(state);
  }

  void emitEvent<T>(Object event, [T? data]) =>
      _emit(state.addEvent(event, data));

  void emitInitial({DATA? data, UserFeedback? feedback}) =>
      _emit(WidgetDataState.initial(
        data ?? state.data,
        feedback: feedback,
        build: true,
      ));

  void emitLoading({DATA? data, UserFeedback? feedback}) =>
      _emit(WidgetDataState.loading(
        data ?? state.data,
        feedback: feedback,
        build: true,
      ));

  void emitFail({DATA? data, Failure? feedback}) => _emit(WidgetDataState.fail(
        data ?? state.data,
        feedback: feedback,
        build: true,
      ));

  void emitWarning({DATA? data, Warning? feedback}) =>
      _emit(WidgetDataState.warning(
        data ?? state.data,
        feedback: feedback,
        build: true,
      ));

  void emitSuccess({DATA? data, UserFeedback? feedback}) =>
      _emit(WidgetDataState.success(
        data ?? state.data,
        feedback: feedback,
        build: true,
      ));

  void emitCancel({DATA? data, UserFeedback? feedback}) =>
      _emit(WidgetDataState.cancel(
        data ?? state.data,
        feedback: feedback,
        build: true,
      ));

  void saveInitialState(DATA? data, {UserFeedback? feedback}) =>
      _emit(WidgetDataState.initial(
        data,
        feedback: feedback,
        build: false,
      ));

  void saveLoadingState(DATA? data, {UserFeedback? feedback}) =>
      _emit(WidgetDataState.loading(
        data,
        feedback: feedback,
        build: false,
      ));

  void saveFailState(DATA? data, {Failure? feedback}) =>
      _emit(WidgetDataState.fail(
        data,
        feedback: feedback,
        build: false,
      ));

  void saveWarningState(DATA? data, {Warning? feedback}) =>
      _emit(WidgetDataState.warning(
        data,
        feedback: feedback,
        build: false,
      ));

  void saveSuccessState(DATA? data, {UserFeedback? feedback}) =>
      _emit(WidgetDataState.success(
        data,
        feedback: feedback,
        build: false,
      ));

  void saveCancelState(DATA? data, {UserFeedback? feedback}) =>
      _emit(WidgetDataState.cancel(
        data,
        feedback: feedback,
        build: false,
      ));
}

abstract class FalconEventBloc<EVENT, STATE>
    extends FalconBloc<BlocEvent<EVENT>, STATE> {
  FalconEventBloc(
    super.initialState, {
    EventTransformer<BlocEvent<EVENT>>? transformer,
  }) {
    on<BlocEvent<EVENT>>(
        (BlocEvent<EVENT> event, Emitter<STATE> emitter) async {
      _emitter = emitter;
      await onBlocEvent(event);
      _emitter = null;
    }, transformer: transformer);
  }

  Emitter<STATE> get emitter {
    assertEmitter();
    return _emitter!;
  }

  Emitter<STATE>? _emitter;

  Future<void> onBlocEvent(BlocEvent<EVENT> event);

  void assertEmitter() {
    assert(
      _emitter != null,
      '''
emit was called after an event handler completed normally.
This is usually due to an unawaited future in an event handler.
Please make sure to await all asynchronous operations with event handlers
and use emit.isDone after asynchronous operations before calling emit() to
ensure the event handler has not completed.

  **❌BAD**
  on<Event>((event, emit) {
    future.whenComplete(() => emitSuccess(...));
  });

  **✅GOOD**
  on<Event>((event, emit) async {
    await future.whenComplete(() => emitSuccess(...));
  });
''',
    );
  }

  void addEvent<T>(EVENT event, {T? data}) {
    add(BlocEvent(event, data: data));
  }

  Future<void> callStream<A>({
    required Stream<WidgetDataState<A?>> call,
    required Function(WidgetDataState<A?> state) onData,
    Function(Failure failure)? onFailure,
  }) {
    assertEmitter();
    return _emitter!.onEach(
      call,
      onData: (WidgetDataState<A?> state) {
        onData(state);
      },
      onError: (error, stackTrace) {
        if (error is Failure) {
          onFailure?.call(error);
        } else {
          FlutterError.reportError(FlutterErrorDetails(
            exception: error,
            stack: stackTrace,
          ));
        }
      },
    );
  }

  Future<void> callEitherFuture<A>({
    required Object key,
    required Future<Either<Failure, A>> call,
    required Function(WidgetDataState<A?> state) onData,
    Function(Failure failure)? onFailure,
    bool debounceCall = true,
  }) =>
      callStream<A>(
        call: fetchEitherFuture<A>(
          key: key,
          call: call,
          debounceFetch: debounceCall,
        ),
        onData: onData,
        onFailure: onFailure,
      );

  Future<void> callEitherStream<A>({
    required Object key,
    required Stream<Either<Failure, A>> call,
    required Function(WidgetDataState<A?> state) onData,
    Function(Failure failure)? onFailure,
    bool debounceCall = true,
  }) =>
      callStream<A>(
        call: fetchEitherStream<A>(
          key: key,
          call: call,
          debounceFetch: debounceCall,
        ),
        onData: onData,
        onFailure: onFailure,
      );

  @override
  Future<void> close() async {
    _emitter = null;
    return super.close();
  }
}

abstract class FalconBloc<EVENT, STATE> extends Bloc<EVENT, STATE> {
  FalconBloc(
    super.initialState, {
    EventTransformer<EVENT>? transformer,
  }) : _fetcher = EitherStreamFetcherList();

  final EitherStreamFetcherList _fetcher;

  Stream<WidgetDataState<T?>> fetchEitherStream<T>({
    required Object key,
    required Stream<Either<Failure, T>> call,
    bool debounceFetch = true,
  }) =>
      _fetcher.fetchStream(
        key: key,
        call: call,
        debounceFetch: debounceFetch,
      );

  Stream<WidgetDataState<T>> fetchEitherStreamSafe<T>({
    required Object key,
    required Stream<Either<Failure, T>> call,
    required T defaultData,
    bool debounceFetch = true,
  }) =>
      fetchEitherStream(
        key: key,
        call: call,
        debounceFetch: debounceFetch,
      ).map(
        (WidgetDataState<T?> event) => event.mapData(
          (T? a) => a ?? defaultData,
        ),
      );

  Stream<WidgetDataState<T?>> fetchEitherFuture<T>({
    required Object key,
    required Future<Either<Failure, T>> call,
    bool debounceFetch = true,
  }) =>
      _fetcher.fetchFuture(
        key: key,
        call: call,
        debounceFetch: debounceFetch,
      );

  Stream<WidgetDataState<T>> fetchEitherFutureSafe<T>({
    required Object key,
    required Future<Either<Failure, T>> call,
    required T defaultData,
    bool debounceFetch = true,
  }) =>
      fetchEitherFuture(
        key: key,
        call: call,
        debounceFetch: debounceFetch,
      ).map(
        (WidgetDataState<T?> event) => event.mapData(
          (T? a) => a ?? defaultData,
        ),
      );

  @override
  Future<void> close() async {
    await _fetcher.closeAsync();
    return super.close();
  }
}
