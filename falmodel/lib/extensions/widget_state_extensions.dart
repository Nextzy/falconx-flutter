// Created by Nonthawit on 8/7/2024 AD Lead Flutter at NEXTZY and EXISTING
import 'package:falmodel/lib.dart';

extension FullWidgetStateExtension on FullWidgetState {
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
}
