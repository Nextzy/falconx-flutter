import 'package:falconx/lib.dart';

class ContentSafeState<T> extends Cubit<WidgetStateEvent<T>> {
  ContentSafeState.initial(T data) : super(WidgetStateEvent.initial(data));

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
    emit(WidgetStateEvent.initial(data ?? state.data));
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

class ContentSafeBuilder<T>
    extends BlocBuilder<ContentSafeState<T>, WidgetStateEvent<T>> {
  const ContentSafeBuilder({
    super.key,
    required ContentSafeState<T> content,
    super.buildWhen,
    required super.builder,
  }) : super(bloc: content);
}
