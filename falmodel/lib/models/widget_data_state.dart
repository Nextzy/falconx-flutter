import 'package:falmodel/lib.dart';
import 'package:flutter/widgets.dart';

enum FullWidgetState {
  initial,
  normal,
  empty,
  hovered,
  focused,
  focusedVisible,
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

  bool get isInitial => this == FullWidgetState.initial; //
  bool get isNormal => this == FullWidgetState.normal; //
  bool get isEmpty => this == FullWidgetState.empty; //
  bool get isHovered => this == FullWidgetState.hovered; //
  bool get isFocused => this == FullWidgetState.focused; //
  bool get isFocusedVisible => this == FullWidgetState.focusedVisible; //
  bool get isPressed => this == FullWidgetState.pressed; //
  bool get isDragged => this == FullWidgetState.dragged; //
  bool get isSelected => this == FullWidgetState.selected; //
  bool get isScrolledUnder => this == FullWidgetState.scrolledUnder; //
  bool get isDisabled => this == FullWidgetState.disabled; //
  bool get isLoading => this == FullWidgetState.loading; //
  bool get isSuccess => this == FullWidgetState.success; //
  bool get isFail => this == FullWidgetState.fail; //
  bool get isWarning => this == FullWidgetState.warning; //
  bool get isCancel => this == FullWidgetState.cancel; //

  bool get isNotInitial => !isInitial; //
  bool get isNotNormal => !isNormal; //
  bool get isNotEmpty => !isEmpty; //
  bool get isNotHovered => !isHovered; //
  bool get isNotFocused => !isFocused; //
  bool get isNotFocusedVisible => !isFocusedVisible; //
  bool get isNotPressed => !isPressed; //
  bool get isNotDragged => !isDragged; //
  bool get isNotSelected => !isSelected; //
  bool get isNotScrolledUnder => !isScrolledUnder; //
  bool get isNotDisabled => !isDisabled; //
  bool get isNotLoading => !isLoading; //
  bool get isNotSuccess => !isSuccess; //
  bool get isNotFail => !isFail; //
  bool get isNotWarning => !isWarning; //
  bool get isNotCancel => !isCancel; //

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
class WidgetDataState<DATA> {
  const WidgetDataState._(
    this.state, {
    this.id,
    required this.data,
    required this.feedback,
    this.event,
    this.build = true,
  });

  final FullWidgetState state;
  final String? id;

  /// Purpose to [UserFeedback] for show the message or data on the widgets
  final UserFeedback feedback;

  /// Purpose to [WidgetEvent] for communicate BLoC --> Widget
  /// Important: [event] not copy because event must use for one time.
  /// if you want to send [event] to view, please use [addEvent]
  final WidgetEvent? event;
  final DATA data;
  final bool build;

  factory WidgetDataState.initial(
    DATA data, {
    String? id,
    UserFeedback? feedback,
    bool build = true,
  }) =>
      WidgetDataState._(FullWidgetState.initial,
          id: id,
          feedback: feedback ?? Information(),
          data: data,
          build: build);

  factory WidgetDataState.normal(
    DATA data, {
    String? id,
    UserFeedback? feedback,
    bool build = true,
  }) =>
      WidgetDataState._(FullWidgetState.normal,
          id: id,
          feedback: feedback ?? Information(),
          data: data,
          build: build);

  factory WidgetDataState.empty(
    DATA data, {
    String? id,
    UserFeedback? feedback,
    bool build = true,
  }) =>
      WidgetDataState._(FullWidgetState.empty,
          id: id,
          feedback: feedback ?? Information(),
          data: data,
          build: build);

  factory WidgetDataState.hovered(
    DATA data, {
    String? id,
    UserFeedback? feedback,
    bool build = true,
  }) =>
      WidgetDataState._(FullWidgetState.hovered,
          id: id,
          feedback: feedback ?? Information(),
          data: data,
          build: build);

  factory WidgetDataState.focused(
    DATA data, {
    String? id,
    UserFeedback? feedback,
    bool build = true,
  }) =>
      WidgetDataState._(FullWidgetState.focused,
          id: id,
          feedback: feedback ?? Information(),
          data: data,
          build: build);

  factory WidgetDataState.focusedVisible(
    DATA data, {
    String? id,
    UserFeedback? feedback,
    bool build = true,
  }) =>
      WidgetDataState._(FullWidgetState.focusedVisible,
          id: id,
          feedback: feedback ?? Information(),
          data: data,
          build: build);

  factory WidgetDataState.pressed(
    DATA data, {
    String? id,
    UserFeedback? feedback,
    bool build = true,
  }) =>
      WidgetDataState._(FullWidgetState.pressed,
          id: id,
          feedback: feedback ?? Information(),
          data: data,
          build: build);

  factory WidgetDataState.dragged(
    DATA data, {
    String? id,
    UserFeedback? feedback,
    bool build = true,
  }) =>
      WidgetDataState._(FullWidgetState.dragged,
          id: id,
          feedback: feedback ?? Information(),
          data: data,
          build: build);

  factory WidgetDataState.selected(
    DATA data, {
    String? id,
    UserFeedback? feedback,
    bool build = true,
  }) =>
      WidgetDataState._(FullWidgetState.selected,
          id: id,
          feedback: feedback ?? Information(),
          data: data,
          build: build);

  factory WidgetDataState.scrolledUnder(
    DATA data, {
    String? id,
    UserFeedback? feedback,
    bool build = true,
  }) =>
      WidgetDataState._(FullWidgetState.scrolledUnder,
          id: id,
          feedback: feedback ?? Information(),
          data: data,
          build: build);

  factory WidgetDataState.disabled(
    DATA data, {
    String? id,
    UserFeedback? feedback,
    bool build = true,
  }) =>
      WidgetDataState._(FullWidgetState.disabled,
          id: id,
          feedback: feedback ?? Information(),
          data: data,
          build: build);

  factory WidgetDataState.loading(
    DATA data, {
    String? id,
    UserFeedback? feedback,
    bool build = true,
  }) =>
      WidgetDataState._(FullWidgetState.loading,
          id: id,
          feedback: feedback ?? Information(),
          data: data,
          build: build);

  factory WidgetDataState.success(
    DATA data, {
    String? id,
    UserFeedback? feedback,
    bool build = true,
  }) =>
      WidgetDataState._(FullWidgetState.success,
          id: id,
          feedback: feedback ?? Information(),
          data: data,
          build: build);

  factory WidgetDataState.cancel(
    DATA data, {
    String? id,
    UserFeedback? feedback,
    bool build = true,
  }) =>
      WidgetDataState._(FullWidgetState.cancel,
          id: id,
          feedback: feedback ?? Information(),
          data: data,
          build: build);

  factory WidgetDataState.warning(
    DATA data, {
    String? id,
    UserFeedback? feedback,
    bool build = true,
  }) =>
      WidgetDataState._(FullWidgetState.warning,
          id: id, feedback: feedback ?? Warning(), data: data, build: build);

  factory WidgetDataState.fail(
    DATA data, {
    String? id,
    UserFeedback? feedback,
    bool build = true,
  }) =>
      WidgetDataState._(FullWidgetState.fail,
          id: id, feedback: feedback ?? Failure(), data: data, build: build);

  bool get isInitial => state.isInitial; //
  bool get isNormal => state.isNormal; //
  bool get isEmpty => state.isEmpty; //
  bool get isHovered => state.isHovered; //
  bool get isFocused => state.isFocused; //
  bool get isFocusedVisible => state.isFocusedVisible; //
  bool get isPressed => state.isPressed; //
  bool get isDragged => state.isDragged; //
  bool get isSelected => state.isSelected; //
  bool get isScrolledUnder => state.isScrolledUnder; //
  bool get isDisabled => state.isDisabled; //
  bool get isLoading => state.isLoading; //
  bool get isSuccess => state.isSuccess; //
  bool get isFail => state.isFail; //
  bool get isWarning => state.isWarning; //
  bool get isCancel => state.isCancel; //

  bool get isNotInitial => !isInitial; //
  bool get isNotNormal => !isNormal; //
  bool get isNotEmpty => !isEmpty; //
  bool get isNotHovered => !isHovered; //
  bool get isNotFocused => !isFocused; //
  bool get isNotFocusedVisible => !isFocusedVisible; //
  bool get isNotPressed => !isPressed; //
  bool get isNotDragged => !isDragged; //
  bool get isNotSelected => !isSelected; //
  bool get isNotScrolledUnder => !isScrolledUnder; //
  bool get isNotDisabled => !isDisabled; //
  bool get isNotLoading => !isLoading; //
  bool get isNotSuccess => !isSuccess; //
  bool get isNotFail => !isFail; //
  bool get isNotWarning => !isWarning; //
  bool get isNotCancel => !isCancel; //

  bool get hasData => data != null; //
  bool get noData => data == null; //

  R apply<R>(Function2<FullWidgetState, DATA, R> f) => f(state, data);

  WidgetDataState<NT2> mapData<NT2>(Function1<DATA, NT2> f,
          {String? id, UserFeedback? feedback, bool? build}) =>
      WidgetDataState._(state,
          data: f(data),
          id: id ?? this.id,
          feedback: feedback ?? this.feedback,
          build: build ?? true);

  WidgetDataState<DATA> mapState(Function1<FullWidgetState, FullWidgetState> f,
          {String? id, UserFeedback? feedback, bool? build}) =>
      WidgetDataState._(f(state),
          id: id ?? this.id,
          data: data,
          feedback: feedback ?? this.feedback,
          build: build ?? true);

  WidgetDataState<DATA> toState(FullWidgetState state,
          {DATA? data, String? id, UserFeedback? feedback, bool? build}) =>
      copy(
          state: state,
          id: id,
          data: data,
          feedback: feedback ?? Information(),
          build: build);

  WidgetDataState<DATA> toInitial(
          {DATA? data, String? id, UserFeedback? feedback, bool? build}) =>
      copy(
          state: FullWidgetState.initial,
          id: id,
          feedback: feedback ?? Information(),
          data: data,
          build: build);

  WidgetDataState<DATA> toNormal(
          {DATA? data, String? id, UserFeedback? feedback, bool? build}) =>
      copy(
          state: FullWidgetState.normal,
          id: id,
          feedback: feedback ?? Information(),
          data: data,
          build: build);

  WidgetDataState<DATA> toEmpty(
          {DATA? data, String? id, UserFeedback? feedback, bool? build}) =>
      copy(
          state: FullWidgetState.empty,
          id: id,
          feedback: feedback ?? Information(),
          data: data,
          build: build);

  WidgetDataState<DATA> toHovered(
          {DATA? data, String? id, UserFeedback? feedback, bool? build}) =>
      copy(
          state: FullWidgetState.hovered,
          id: id,
          feedback: feedback ?? Information(),
          data: data,
          build: build);

  WidgetDataState<DATA> toFocused(
          {DATA? data, String? id, UserFeedback? feedback, bool? build}) =>
      copy(
          state: FullWidgetState.focused,
          id: id,
          feedback: feedback ?? Information(),
          data: data,
          build: build);

  WidgetDataState<DATA> toFocusedVisible(
          {DATA? data, String? id, UserFeedback? feedback, bool? build}) =>
      copy(
          state: FullWidgetState.focusedVisible,
          id: id,
          feedback: feedback ?? Information(),
          data: data,
          build: build);

  WidgetDataState<DATA> toPressed(
          {DATA? data, String? id, UserFeedback? feedback, bool? build}) =>
      copy(
          state: FullWidgetState.pressed,
          id: id,
          feedback: feedback ?? Information(),
          data: data,
          build: build);

  WidgetDataState<DATA> toDragged(
          {DATA? data, String? id, UserFeedback? feedback, bool? build}) =>
      copy(
          state: FullWidgetState.dragged,
          id: id,
          feedback: feedback ?? Information(),
          data: data,
          build: build);

  WidgetDataState<DATA> toSelected(
          {DATA? data, String? id, UserFeedback? feedback, bool? build}) =>
      copy(
          state: FullWidgetState.selected,
          id: id,
          feedback: feedback ?? Information(),
          data: data,
          build: build);

  WidgetDataState<DATA> toScrolledUnder(
          {DATA? data, String? id, UserFeedback? feedback, bool? build}) =>
      copy(
          state: FullWidgetState.scrolledUnder,
          id: id,
          feedback: feedback ?? Information(),
          data: data,
          build: build);

  WidgetDataState<DATA> toDisabled(
          {DATA? data, String? id, UserFeedback? feedback, bool? build}) =>
      copy(
          state: FullWidgetState.disabled,
          id: id,
          feedback: feedback ?? Information(),
          data: data,
          build: build);

  WidgetDataState<DATA> toLoading(
          {DATA? data, String? id, UserFeedback? feedback, bool? build}) =>
      copy(
          state: FullWidgetState.loading,
          id: id,
          feedback: feedback ?? Information(),
          data: data,
          build: build);

  WidgetDataState<DATA> toSuccess(
          {DATA? data, String? id, UserFeedback? feedback, bool? build}) =>
      copy(
          state: FullWidgetState.success,
          id: id,
          feedback: feedback ?? Information(),
          data: data,
          build: build);

  WidgetDataState<DATA> toCancel(
          {DATA? data, String? id, UserFeedback? feedback, bool? build}) =>
      copy(
          state: FullWidgetState.cancel,
          id: id,
          feedback: feedback ?? Information(),
          data: data,
          build: build);

  WidgetDataState<DATA> toWarning(
          {DATA? data, String? id, UserFeedback? feedback, bool? build}) =>
      copy(
          state: FullWidgetState.warning,
          id: id,
          feedback: feedback ?? Warning(),
          data: data,
          build: build);

  WidgetDataState<DATA> toFail(
          {DATA? data, String? id, UserFeedback? feedback, bool? build}) =>
      copy(
          state: FullWidgetState.fail,
          id: id,
          feedback: feedback ?? Failure(),
          data: data,
          build: build);

  /// Important: Do not copy [event] because event must use that one time.
  /// [event] if you want to send event to view, please use [addEvent]
  /// [build] this flag use for control rebuild at widget.
  WidgetDataState<DATA> copy({
    FullWidgetState? state,
    String? id,
    UserFeedback? feedback,
    DATA? data,
    bool? build,
  }) =>
      WidgetDataState<DATA>._(
        state ?? this.state,
        id: id ?? this.id,
        data: data ?? this.data,
        feedback: feedback ?? this.feedback,
        build: build ?? true,
        // Always true if build == null
        event: null, // Clear event
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
  WidgetDataState<DATA> addEvent(
    Object event, [
    Object? data,
  ]) =>
      WidgetDataState<DATA>._(
        this.state,
        id: this.id,
        data: this.data,
        build: this.build,
        feedback: this.feedback,
        event: WidgetEvent(event, data),
      );

  @override
  String toString() {
    return 'WidgetDataState{state: $state, id: $id, data: $data, feedback: $feedback, event: $event, build: $build}';
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
