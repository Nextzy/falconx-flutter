import 'package:falconx/lib.dart';

class ContentSafeState<T> extends Cubit<WidgetStateEvent<T>> {
  ContentSafeState.initial(T data)
      : super(WidgetStateEvent(FullWidgetState.initial, data: data));

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

  T get value => state.data;

  void initial([T? data]) {
    emit(WidgetStateEvent(FullWidgetState.initial, data: data ?? state.data));
  }

  void success([T? data]) {
    emit(WidgetStateEvent(FullWidgetState.success, data: data ?? state.data));
  }

  void loading([T? data]) {
    emit(WidgetStateEvent(FullWidgetState.loading, data: data ?? state.data));
  }

  void cancel([T? data]) {
    emit(WidgetStateEvent(FullWidgetState.cancel, data: data ?? state.data));
  }

  void disabled([T? data]) {
    emit(WidgetStateEvent(FullWidgetState.disabled, data: data ?? state.data));
  }

  void warning([T? data]) {
    emit(WidgetStateEvent(FullWidgetState.warning, data: data ?? state.data));
  }

  void selected([T? data]) {
    emit(WidgetStateEvent(FullWidgetState.selected, data: data ?? state.data));
  }

  void fail([T? data]) {
    emit(WidgetStateEvent(FullWidgetState.fail, data: data ?? state.data));
  }
}

class ContentSafeBuilder<T>
    extends BlocBuilder<ContentSafeState<T>, WidgetStateEvent<T>> {
  const ContentSafeBuilder({
    super.key,
    ContentSafeState<T>? content,
    super.buildWhen,
    required super.builder,
  }) : super(bloc: content);
}
