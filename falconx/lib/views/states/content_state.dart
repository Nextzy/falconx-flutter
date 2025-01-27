import 'package:falconx/lib.dart';

class ContentState<T> extends Cubit<WidgetStateEvent<T?>> {
  ContentState.initial([T? data])
      : super(WidgetStateEvent(FullWidgetState.initial, data: data));

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

  T? get value => state.data;

  void initial([T? data]) {
    emit(WidgetStateEvent(FullWidgetState.initial, data: data ?? state.data));
  }

  void empty() {
    emit(WidgetStateEvent(FullWidgetState.empty, data: null));
  }

  void success([T? data]) {
    emit(WidgetStateEvent(FullWidgetState.success, data: data ?? state.data));
  }

  void loading([T? data]) {
    emit(WidgetStateEvent(FullWidgetState.loading, data: data ?? state.data));
  }

  void warning([T? data]) {
    emit(WidgetStateEvent(FullWidgetState.warning, data: data ?? state.data));
  }

  void disabled([T? data]) {
    emit(WidgetStateEvent(FullWidgetState.disabled, data: data ?? state.data));
  }

  void cancel([T? data]) {
    emit(WidgetStateEvent(FullWidgetState.cancel, data: data ?? state.data));
  }

  void selected([T? data]) {
    emit(WidgetStateEvent(FullWidgetState.selected, data: data ?? state.data));
  }

  void fail([T? data]) {
    emit(WidgetStateEvent(FullWidgetState.fail, data: data ?? state.data));
  }
}

class ContentBuilder<T>
    extends BlocBuilder<ContentState<T>, WidgetStateEvent<T?>> {
  const ContentBuilder({
    super.key,
    ContentState<T>? content,
    super.buildWhen,
    required super.builder,
  }) : super(bloc: content);
}
