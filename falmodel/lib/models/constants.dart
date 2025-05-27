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