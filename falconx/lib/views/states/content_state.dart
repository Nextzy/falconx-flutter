import 'package:falconx/lib.dart';

class ContentState<T> extends Cubit<WidgetStateEvent<T?>> {
  ContentState.initial([T? data]) : super(WidgetStateEvent.initial(data));

  bool get isInitial => state.isInitial;
  bool get isEmpty => state.isEmpty;
  bool get isSelected => state.isSelected;
  bool get isDisabled => state.isDisabled;
  bool get isLoading => state.isLoading;
  bool get isSuccess => state.isSuccess;
  bool get isFail => state.isFail;
  bool get isWarning => state.isWarning;
  bool get isCancel => state.isCancel;

  bool get isNotInitial => !isInitial;
  bool get isNotEmpty => !isEmpty;
  bool get isNotSelected => !isSelected;
  bool get isNotDisabled => !isDisabled;
  bool get isNotLoading => !isLoading;
  bool get isNotSuccess => !isSuccess;
  bool get isNotFail => !isFail;
  bool get isNotWarning => !isWarning;
  bool get isNotCancel => !isCancel;

  FullWidgetState get status => state.state;

  T? get data => state.data;

  set data(T? data) => success(data);

  void initial([T? data]) {
    emit(WidgetStateEvent.initial(data ?? state.data));
  }

  void empty() {
    emit(WidgetStateEvent.empty(null));
  }

  void success([T? data]) {
    emit(WidgetStateEvent.success(data ?? state.data));
  }

  void loading([T? data]) {
    emit(WidgetStateEvent.loading(data ?? state.data));
  }

  void cancel([T? data]) {
    emit(WidgetStateEvent.cancel(data ?? state.data));
  }

  void disabled([T? data]) {
    emit(WidgetStateEvent.disabled(data ?? state.data));
  }

  void warning([T? data]) {
    emit(WidgetStateEvent.warning(data ?? state.data));
  }

  void selected([T? data]) {
    emit(WidgetStateEvent.selected(data ?? state.data));
  }

  void fail([T? data]) {
    emit(WidgetStateEvent.fail(data ?? state.data));
  }
}

class ContentBuilder<T>
    extends BlocBuilder<ContentState<T>, WidgetStateEvent<T?>> {
  const ContentBuilder({
    super.key,
    required ContentState<T> content,
    super.buildWhen,
    required super.builder,
  }) : super(bloc: content);
}
