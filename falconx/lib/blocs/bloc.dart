import 'package:falconx/lib.dart';

abstract class FalconWidgetStateEventSafeBloc<EVENT, DATA>
    extends FalconBloc<EVENT, WidgetStateEvent<DATA>> {
  FalconWidgetStateEventSafeBloc(DATA data)
      : super(WidgetStateEvent(FullWidgetState.initial, data: data));

  DATA get data => state.data;

  void _assertEmitter() {
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

  void _emit(WidgetStateEvent<DATA> state) {
    _assertEmitter();
    _emitter?.call(state);
  }

  void emitEvent<T>(Object event, [T? data]) =>
      _emit(state.addEvent(event, data));

  void emitInitial([DATA? data]) => _emit(
      WidgetStateEvent(FullWidgetState.initial, data: data ?? state.data));

  void emitLoading([DATA? data]) => _emit(
      WidgetStateEvent(FullWidgetState.loading, data: data ?? state.data));

  void emitFail([DATA? data]) =>
      _emit(WidgetStateEvent(FullWidgetState.fail, data: data ?? state.data));

  void emitWarning([DATA? data]) => _emit(
      WidgetStateEvent(FullWidgetState.warning, data: data ?? state.data));

  void emitSuccess([DATA? data]) => _emit(
      WidgetStateEvent(FullWidgetState.success, data: data ?? state.data));

  Future<void> callStream<A>({
    required Stream<WidgetStateEvent<A?>> call,
    required Function(
      Emitter<WidgetStateEvent<DATA>> emitter,
      WidgetStateEvent<A?> state,
    ) onData,
    Function(
      Emitter<WidgetStateEvent<DATA>> emitter,
      Failure failure,
    )? onFailure,
  }) {
    _assertEmitter();
    return _emitter!.onEach(
      call,
      onData: (WidgetStateEvent<A?> state) {
        onData(_emitter!, state);
      },
      onError: (error, stackTrace) {
        if (error is Failure) {
          onFailure?.call(_emitter!, error);
        } else {
          FlutterError.reportError(FlutterErrorDetails(
            exception: error,
            stack: stackTrace,
          ));
        }
      },
    );
  }

  Future<void> callEitherFutureDebounce<A>({
    required Object key,
    required Future<Either<Failure, A>> call,
    required Function(
      Emitter<WidgetStateEvent<DATA>> emitter,
      WidgetStateEvent<A?> state,
    ) onData,
    Function(
      Emitter<WidgetStateEvent<DATA>> emitter,
      Failure failure,
    )? onFailure,
    bool debounceFetch = true,
  }) =>
      callStream<A>(
        call: fetchWidgetStateEitherFuture<A>(
          key: key,
          call: call,
          debounceFetch: debounceFetch,
        ),
        onData: onData,
        onFailure: onFailure,
      );

  Future<void> callEitherStreamDebounce<A>({
    required Object key,
    required Stream<Either<Failure, A>> call,
    required Function(
      Emitter<WidgetStateEvent<DATA>> emitter,
      WidgetStateEvent<A?> state,
    ) onData,
    Function(
      Emitter<WidgetStateEvent<DATA>> emitter,
      Failure failure,
    )? onFailure,
    bool debounceFetch = true,
  }) =>
      callStream<A>(
        call: fetchWidgetStateEitherStream<A>(
          key: key,
          call: call,
          debounceFetch: debounceFetch,
          // defaultData: state.data,
        ),
        onData: onData,
        onFailure: onFailure,
      );
}

abstract class FalconWidgetStateEventBloc<EVENT, DATA>
    extends FalconBloc<EVENT, WidgetStateEvent<DATA?>> {
  FalconWidgetStateEventBloc([DATA? data])
      : super(WidgetStateEvent(FullWidgetState.initial, data: data));

  DATA? get data => state.data;

  void _assertEmitter() {
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

  void _emit(WidgetStateEvent<DATA?> state) {
    _assertEmitter();
    _emitter?.call(state);
  }

  void emitEvent<T>(Object event, [T? data]) =>
      _emit(state.addEvent(event, data));

  void emitInitial([DATA? data]) => _emit(
      WidgetStateEvent(FullWidgetState.initial, data: data ?? state.data));

  void emitLoading([DATA? data]) => _emit(
      WidgetStateEvent(FullWidgetState.loading, data: data ?? state.data));

  void emitFail([DATA? data]) =>
      _emit(WidgetStateEvent(FullWidgetState.fail, data: data ?? state.data));

  void emitWarning([DATA? data]) => _emit(
      WidgetStateEvent(FullWidgetState.warning, data: data ?? state.data));

  void emitSuccess([DATA? data]) => _emit(
      WidgetStateEvent(FullWidgetState.success, data: data ?? state.data));

  Future<void> callStream<A>({
    required Stream<WidgetStateEvent<A?>> call,
    required Function(
      Emitter<WidgetStateEvent<DATA?>> emitter,
      WidgetStateEvent<A?> state,
    ) onData,
    Function(
      Emitter<WidgetStateEvent<DATA?>> emitter,
      Failure failure,
    )? onFailure,
  }) {
    _assertEmitter();
    return _emitter!.onEach(
      call,
      onData: (WidgetStateEvent<A?> state) {
        onData(_emitter!, state);
      },
      onError: (error, stackTrace) {
        if (error is Failure) {
          onFailure?.call(_emitter!, error);
        } else {
          FlutterError.reportError(FlutterErrorDetails(
            exception: error,
            stack: stackTrace,
          ));
        }
      },
    );
  }

  Future<void> callEitherFutureDebounce<A>({
    required Object key,
    required Future<Either<Failure, A>> call,
    required Function(
      Emitter<WidgetStateEvent<DATA?>> emitter,
      WidgetStateEvent<A?> state,
    ) onData,
    Function(
      Emitter<WidgetStateEvent<DATA?>> emitter,
      Failure failure,
    )? onFailure,
    bool debounceFetch = true,
  }) =>
      callStream<A>(
        call: fetchWidgetStateEitherFuture<A>(
          key: key,
          call: call,
          debounceFetch: debounceFetch,
        ),
        onData: onData,
        onFailure: onFailure,
      );

  Future<void> callEitherStreamDebounce<A>({
    required Object key,
    required Stream<Either<Failure, A>> call,
    required Function(
      Emitter<WidgetStateEvent<DATA?>> emitter,
      WidgetStateEvent<A?> state,
    ) onData,
    Function(
      Emitter<WidgetStateEvent<DATA?>> emitter,
      Failure failure,
    )? onFailure,
    bool debounceFetch = true,
  }) =>
      callStream<A>(
        call: fetchWidgetStateEitherStream<A>(
          key: key,
          call: call,
          debounceFetch: debounceFetch,
        ),
        onData: onData,
        onFailure: onFailure,
      );
}

abstract class FalconBloc<EVENT, STATE> extends Bloc<BlocEvent<EVENT>, STATE> {
  FalconBloc(super.initialState) : _fetcher = EitherStreamFetcherList() {
    on<BlocEvent<EVENT>>(
        (BlocEvent<EVENT> event, Emitter<STATE> emitter) async {
      _emitter = emitter;
      await onListenEvent(event, emitter);
      _emitter = null;
    });
  }

  Emitter<STATE>? _emitter;
  final EitherStreamFetcherList _fetcher;

  Future<void> onListenEvent(BlocEvent<EVENT> event, Emitter<STATE> emitter);

  Stream<WidgetStateEvent<T?>> fetchWidgetStateEitherStream<T>({
    required Object key,
    required Stream<Either<Failure, T>> call,
    bool debounceFetch = true,
  }) =>
      _fetcher.fetchStream(
        key: key,
        call: call,
        debounceFetch: debounceFetch,
      );

  Stream<WidgetStateEvent<T>> fetchWidgetStateEitherStreamSafe<T>({
    required Object key,
    required Stream<Either<Failure, T>> call,
    required T defaultData,
    bool debounceFetch = true,
  }) =>
      fetchWidgetStateEitherStream(
        key: key,
        call: call,
        debounceFetch: debounceFetch,
      ).map(
        (WidgetStateEvent<T?> event) => event.mapData(
          (T? a) => a ?? defaultData,
        ),
      );

  Stream<WidgetStateEvent<T?>> fetchWidgetStateEitherFuture<T>({
    required Object key,
    required Future<Either<Failure, T>> call,
    bool debounceFetch = true,
  }) =>
      _fetcher.fetchFuture(
        key: key,
        call: call,
        debounceFetch: debounceFetch,
      );

  Stream<WidgetStateEvent<T>> fetchWidgetStateEitherFutureSafe<T>({
    required Object key,
    required Future<Either<Failure, T>> call,
    required T defaultData,
    bool debounceFetch = true,
  }) =>
      fetchWidgetStateEitherFuture(
        key: key,
        call: call,
        debounceFetch: debounceFetch,
      ).map(
        (WidgetStateEvent<T?> event) => event.mapData(
          (T? a) => a ?? defaultData,
        ),
      );

  @override
  Future<void> close() async {
    await _fetcher.closeAsync();
    return super.close();
  }

  void addEvent<T>(EVENT event, {T? data}) {
    add(BlocEvent(event, data: data));
  }
}
