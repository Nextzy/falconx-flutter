import 'package:falmodel/lib.dart';
import 'package:flutter/widgets.dart';

enum FullWidgetState {
  initial,
  normal,
  empty,
  hovered,
  focused,
  pressed,
  dragged,
  selected,
  scrolledUnder,
  disabled,
  loading,
  success,
  cancel,
  warning,
  fail;

  bool get isInitial => this == FullWidgetState.initial;
  bool get isNormal => this == FullWidgetState.normal;
  bool get isEmpty => this == FullWidgetState.empty;
  bool get isHovered => this == FullWidgetState.hovered;
  bool get isFocused => this == FullWidgetState.focused;
  bool get isPressed => this == FullWidgetState.pressed;
  bool get isDragged => this == FullWidgetState.dragged;
  bool get isSelected => this == FullWidgetState.selected;
  bool get isScrolledUnder => this == FullWidgetState.scrolledUnder;
  bool get isDisabled => this == FullWidgetState.disabled;
  bool get isLoading => this == FullWidgetState.loading;
  bool get isSuccess => this == FullWidgetState.success;
  bool get isFail => this == FullWidgetState.fail;
  bool get isWarning => this == FullWidgetState.warning;
  bool get isCancel => this == FullWidgetState.cancel;

  bool get isNotInitial => !isInitial;
  bool get isNotNormal => !isNormal;
  bool get isNotEmpty => !isEmpty;
  bool get isNotHovered => !isHovered;
  bool get isNotFocused => !isFocused;
  bool get isNotPressed => !isPressed;
  bool get isNotDragged => !isDragged;
  bool get isNotSelected => !isSelected;
  bool get isNotScrolledUnder => !isScrolledUnder;
  bool get isNotDisabled => !isDisabled;
  bool get isNotLoading => !isLoading;
  bool get isNotSuccess => !isSuccess;
  bool get isNotFail => !isFail;
  bool get isNotWarning => !isWarning;
  bool get isNotCancel => !isCancel;

  WidgetState? get toWidgetState => switch (this) {
        FullWidgetState.hovered => WidgetState.hovered,
        FullWidgetState.focused => WidgetState.focused,
        FullWidgetState.pressed => WidgetState.pressed,
        FullWidgetState.dragged => WidgetState.dragged,
        FullWidgetState.selected => WidgetState.selected,
        FullWidgetState.scrolledUnder => WidgetState.scrolledUnder,
        FullWidgetState.disabled => WidgetState.disabled,
        FullWidgetState.fail => WidgetState.error,
        _ => null,
      };
}

@immutable
class WidgetStateEvent<DATA> {
  const WidgetStateEvent._(
    this.state, {
    required this.data,
    this.event,
    this.build = true,
  });

  factory WidgetStateEvent.initial(
    DATA data, {
    bool build = true,
  }) =>
      WidgetStateEvent._(FullWidgetState.initial, data: data, build: build);

  factory WidgetStateEvent.normal(
    DATA data, {
    bool build = true,
  }) =>
      WidgetStateEvent._(FullWidgetState.normal, data: data, build: build);

  factory WidgetStateEvent.empty(
    DATA data, {
    bool build = true,
  }) =>
      WidgetStateEvent._(FullWidgetState.empty, data: data, build: build);

  factory WidgetStateEvent.hovered(
    DATA data, {
    bool build = true,
  }) =>
      WidgetStateEvent._(FullWidgetState.hovered, data: data, build: build);

  factory WidgetStateEvent.focused(
    DATA data, {
    bool build = true,
  }) =>
      WidgetStateEvent._(FullWidgetState.focused, data: data, build: build);

  factory WidgetStateEvent.pressed(
    DATA data, {
    bool build = true,
  }) =>
      WidgetStateEvent._(FullWidgetState.pressed, data: data, build: build);

  factory WidgetStateEvent.dragged(
    DATA data, {
    bool build = true,
  }) =>
      WidgetStateEvent._(FullWidgetState.dragged, data: data, build: build);

  factory WidgetStateEvent.selected(
    DATA data, {
    bool build = true,
  }) =>
      WidgetStateEvent._(FullWidgetState.selected, data: data, build: build);

  factory WidgetStateEvent.scrolledUnder(
    DATA data, {
    bool build = true,
  }) =>
      WidgetStateEvent._(FullWidgetState.scrolledUnder,
          data: data, build: build);

  factory WidgetStateEvent.disabled(
    DATA data, {
    bool build = true,
  }) =>
      WidgetStateEvent._(FullWidgetState.disabled, data: data, build: build);

  factory WidgetStateEvent.loading(
    DATA data, {
    bool build = true,
  }) =>
      WidgetStateEvent._(FullWidgetState.loading, data: data, build: build);

  factory WidgetStateEvent.success(
    DATA data, {
    bool build = true,
  }) =>
      WidgetStateEvent._(FullWidgetState.success, data: data, build: build);

  factory WidgetStateEvent.cancel(
    DATA data, {
    bool build = true,
  }) =>
      WidgetStateEvent._(FullWidgetState.cancel, data: data, build: build);

  factory WidgetStateEvent.warning(
    DATA data, {
    bool build = true,
  }) =>
      WidgetStateEvent._(FullWidgetState.warning, data: data, build: build);

  factory WidgetStateEvent.fail(
    DATA data, {
    bool build = true,
  }) =>
      WidgetStateEvent._(FullWidgetState.fail, data: data, build: build);

  final FullWidgetState state;

  /// Purpose to [WidgetEvent] for communicate BLoC --> Widget
  /// Important: [event] not copy because event must use for one time.
  /// if you want to send [event] to view, please use [addEvent]
  final WidgetEvent? event;
  final DATA data;
  final bool build;

  bool get isInitial => state.isInitial;
  bool get isNormal => state.isNormal;
  bool get isEmpty => state.isEmpty;
  bool get isHovered => state.isHovered;
  bool get isFocused => state.isFocused;
  bool get isPressed => state.isPressed;
  bool get isDragged => state.isDragged;
  bool get isSelected => state.isSelected;
  bool get isScrolledUnder => state.isScrolledUnder;
  bool get isDisabled => state.isDisabled;
  bool get isLoading => state.isLoading;
  bool get isSuccess => state.isSuccess;
  bool get isFail => state.isFail;
  bool get isWarning => state.isWarning;
  bool get isCancel => state.isCancel;

  bool get isNotInitial => !isInitial;
  bool get isNotNormal => !isNormal;
  bool get isNotEmpty => !isEmpty;
  bool get isNotHovered => !isHovered;
  bool get isNotFocused => !isFocused;
  bool get isNotPressed => !isPressed;
  bool get isNotDragged => !isDragged;
  bool get isNotSelected => !isSelected;
  bool get isNotScrolledUnder => !isScrolledUnder;
  bool get isNotDisabled => !isDisabled;
  bool get isNotLoading => !isLoading;
  bool get isNotSuccess => !isSuccess;
  bool get isNotFail => !isFail;
  bool get isNotWarning => !isWarning;
  bool get isNotCancel => !isCancel;

  bool get hasData => data != null;
  bool get noData => data == null;

  R apply<R>(Function2<FullWidgetState, DATA, R> f) => f(state, data);

  WidgetStateEvent<NT2> mapData<NT2>(Function1<DATA, NT2> f, {bool? build}) =>
      WidgetStateEvent._(state, data: f(data), build: build ?? true);

  WidgetStateEvent<DATA> mapState(Function1<FullWidgetState, FullWidgetState> f,
          {bool? build}) =>
      WidgetStateEvent._(f(state), data: data, build: build ?? true);

  WidgetStateEvent<DATA> toState(FullWidgetState state,
          {DATA? data, bool? build}) =>
      copy(state: state, data: data, build: build);

  WidgetStateEvent<DATA> toInitial({DATA? data, bool? build}) =>
      copy(state: FullWidgetState.initial, data: data, build: build);

  WidgetStateEvent<DATA> toNormal({DATA? data, bool? build}) =>
      copy(state: FullWidgetState.normal, data: data, build: build);

  WidgetStateEvent<DATA> toEmpty({DATA? data, bool? build}) =>
      copy(state: FullWidgetState.empty, data: data, build: build);

  WidgetStateEvent<DATA> toHovered({DATA? data, bool? build}) =>
      copy(state: FullWidgetState.hovered, data: data, build: build);

  WidgetStateEvent<DATA> toFocused({DATA? data, bool? build}) =>
      copy(state: FullWidgetState.focused, data: data, build: build);

  WidgetStateEvent<DATA> toPressed({DATA? data, bool? build}) =>
      copy(state: FullWidgetState.pressed, data: data, build: build);

  WidgetStateEvent<DATA> toDragged({DATA? data, bool? build}) =>
      copy(state: FullWidgetState.dragged, data: data, build: build);

  WidgetStateEvent<DATA> toSelected({DATA? data, bool? build}) =>
      copy(state: FullWidgetState.selected, data: data, build: build);

  WidgetStateEvent<DATA> toScrolledUnder({DATA? data, bool? build}) =>
      copy(state: FullWidgetState.scrolledUnder, data: data, build: build);

  WidgetStateEvent<DATA> toDisabled({DATA? data, bool? build}) =>
      copy(state: FullWidgetState.disabled, data: data, build: build);

  WidgetStateEvent<DATA> toLoading({DATA? data, bool? build}) =>
      copy(state: FullWidgetState.loading, data: data, build: build);

  WidgetStateEvent<DATA> toSuccess({DATA? data, bool? build}) =>
      copy(state: FullWidgetState.success, data: data, build: build);

  WidgetStateEvent<DATA> toCancel({DATA? data, bool? build}) =>
      copy(state: FullWidgetState.cancel, data: data, build: build);

  WidgetStateEvent<DATA> toWarning({DATA? data, bool? build}) =>
      copy(state: FullWidgetState.warning, data: data, build: build);

  WidgetStateEvent<DATA> toFail({DATA? data, bool? build}) =>
      copy(state: FullWidgetState.fail, data: data, build: build);

  /// Important: Do not copy [event] because event must use that one time.
  /// [event] if you want to send event to view, please use [addEvent]
  /// [build] this flag use in view layer.
  WidgetStateEvent<DATA> copy({
    FullWidgetState? state,
    DATA? data,
    bool? build,
  }) =>
      WidgetStateEvent<DATA>._(
        state ?? this.state,
        data: data ?? this.data,
        build: build ?? true,
      );

  /// In your [buildWhen] in BLoC
  /// Recommend:
  /// ```
  /// if (current is FullWidgetState && current.event != null) {
  ///   return false;
  /// } else if (current is FullWidgetState && current.event == null) {
  ///   return current.build;
  /// } else {
  ///   return true;
  /// }
  /// ```
  WidgetStateEvent<DATA> addEvent(
    Object event, [
    Object? data,
  ]) =>
      WidgetStateEvent<DATA>._(
        this.state,
        event: WidgetEvent(event, data),
        data: this.data,
        build: this.build,
      );

  @override
  String toString() {
    return 'WidgetStateEvent{state: $state, data: $data, event: $event, build: $build}';
  }
}

class WidgetEvent {
  WidgetEvent(
    this.name, [
    this.data,
  ]);

  final Object name;
  final Object? data;

  @override
  String toString() {
    return 'WidgetEvent{event: $name, data: $data}';
  }
}
