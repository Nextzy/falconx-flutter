import 'package:falconx/lib.dart';

class FullWidgetStateNotifier extends ValueNotifier<FullWidgetState> {
  FullWidgetStateNotifier([FullWidgetState? state])
      : super(state ?? FullWidgetState.normal);

  bool _isDisposed = false;

  bool get isDisposed => _isDisposed;

  @override
  void dispose() {
    if (!_isDisposed) {
      super.dispose();
    }
    _isDisposed = true;
  }

  @override
  set value(FullWidgetState newValue) {
    if (!_isDisposed) {
      super.value = newValue;
    }
  }
}
