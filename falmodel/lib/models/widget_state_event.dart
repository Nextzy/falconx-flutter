// Created by Nonthawit on 4/7/2023 AD Lead Flutter at NEXTZY and EXISTING
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
  fail,
}

@immutable
class WidgetStateEvent<DATA> {
  const WidgetStateEvent(
    this.state, {
    this.event,
    required this.data,
    this.build = true,
  });

  final FullWidgetState state;

  /// Purpose to [WidgetEvent] for communicate BLoC --> Widget
  /// Important: [event] not copy because event must use for one time.
  /// if you want to send [event] to view, please use [addEvent]
  final WidgetEvent? event;
  final DATA data;
  final bool build;

  bool get isInitial => state == FullWidgetState.initial;
  bool get isNormal => state == FullWidgetState.normal;
  bool get isEmpty => state == FullWidgetState.empty;
  bool get isHovered => state == FullWidgetState.hovered;
  bool get isFocused => state == FullWidgetState.focused;
  bool get isPressed => state == FullWidgetState.pressed;
  bool get isDragged => state == FullWidgetState.dragged;
  bool get isSelected => state == FullWidgetState.selected;
  bool get isScrolledUnder => state == FullWidgetState.scrolledUnder;
  bool get isDisabled => state == FullWidgetState.disabled;
  bool get isLoading => state == FullWidgetState.loading;
  bool get isSuccess => state == FullWidgetState.success;
  bool get isFail => state == FullWidgetState.fail;
  bool get isWarning => state == FullWidgetState.warning;
  bool get isCancel => state == FullWidgetState.cancel;

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

  R apply<R>(Function2<FullWidgetState, DATA, R> f) => f(state, data);

  WidgetStateEvent<NT2> mapData<NT2>(Function1<DATA, NT2> f, {bool? build}) =>
      WidgetStateEvent(state, data: f(data), build: build ?? true);

  WidgetStateEvent<DATA> mapState(Function1<FullWidgetState, FullWidgetState> f,
          {bool? build}) =>
      WidgetStateEvent(f(state), data: data, build: build ?? true);

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
      WidgetStateEvent<DATA>(
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
      WidgetStateEvent<DATA>(
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
