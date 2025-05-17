import 'package:falconx/lib.dart';

class ContentState<T> extends Cubit<WidgetDataState<T>> {
  ContentState.initial(T data) : super(WidgetDataState.initial(data));

  bool get isInitial => state.isInitial;
  bool get isSelected => state.isSelected;
  bool get isDisabled => state.isDisabled;
  bool get isLoading => state.isLoading;
  bool get isSuccess => state.isSuccess;
  bool get isFail => state.isFail;
  bool get isWarning => state.isWarning;
  bool get isCancel => state.isCancel;

  bool get isNotInitial => !isInitial;
  bool get isNotSelected => !isSelected;
  bool get isNotDisabled => !isDisabled;
  bool get isNotLoading => !isLoading;
  bool get isNotSuccess => !isSuccess;
  bool get isNotFail => !isFail;
  bool get isNotWarning => !isWarning;
  bool get isNotCancel => !isCancel;

  FullWidgetState get status => state.state;

  T get data => state.data;

  set data(T data) => success(data);

  void initial([T? data]) {
    emit(WidgetDataState.initial(data ?? state.data));
  }

  void success([T? data]) {
    emit(WidgetDataState.success(data ?? state.data));
  }

  void loading([T? data]) {
    emit(WidgetDataState.loading(data ?? state.data));
  }

  void cancel([T? data]) {
    emit(WidgetDataState.cancel(data ?? state.data));
  }

  void disabled([T? data]) {
    emit(WidgetDataState.disabled(data ?? state.data));
  }

  void warning([T? data]) {
    emit(WidgetDataState.warning(data ?? state.data));
  }

  void selected([T? data]) {
    emit(WidgetDataState.selected(data ?? state.data));
  }

  void fail([T? data]) {
    emit(WidgetDataState.fail(data ?? state.data));
  }
}

class ContentBuilder<T>
    extends BlocBuilder<ContentState<T>, WidgetDataState<T>> {
  const ContentBuilder({
    super.key,
    required ContentState<T> content,
    super.buildWhen,
    required super.builder,
  }) : super(bloc: content);
}
