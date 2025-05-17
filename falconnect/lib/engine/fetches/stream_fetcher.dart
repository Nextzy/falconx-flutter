import 'package:falconnect/lib.dart';

class EitherStreamFetcher<T> {
  EitherStreamFetcher([StreamController<WidgetDataState<T?>>? controller])
      : _streamController =
            controller ?? StreamController<WidgetDataState<T?>>();

  final StreamController<WidgetDataState<T?>> _streamController;
  StreamSubscription? _streamSubscription;

  Stream<WidgetDataState<T?>> get stream => _streamController.stream;

  bool get isClose => _streamController.isClosed;

  T? _data;

  Stream<WidgetDataState<T?>> fetch(
    Stream<Either<Failure, T>> call,
  ) {
    _streamController.add(WidgetDataState.loading(_data));
    _streamSubscription = call.listen(
      (data) {
        data.fold(
          (failure) {
            _streamController.addError(failure);
            close();
          },
          (T data) {
            _data = data;
            _streamController.add(WidgetDataState.success(_data));
          },
        );
      },
      onDone: () {
        printSuccess('Fetch: onDone called');
        close();
      },
      onError: (error, stackTrace) {
        _streamController.addError(error, stackTrace);
        close();
      },
    );
    return _streamController.stream;
  }

  Future<void> close() async {
    _data = null;
    await _streamSubscription?.cancel();
    await _streamController.close();
  }
}
