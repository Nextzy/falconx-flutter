import 'package:falconx/lib.dart';
import 'package:flutter/foundation.dart';

/// [Android State]
/// - onCreate
/// - onStart
/// - onResume
/// ----------
/// - onPause
/// - onStop
/// - onDestroy
///
/// [iOS State]
/// - viewDidLoad
/// - viewWillAppear
/// - viewDidAppear
/// ----------
/// - viewWillDisappear
/// - viewDidDisappear
/// - viewDidUnload
///
/// [Flutter State with FalconX]
/// - initState
/// - didChangeDependencies
/// - resume (Came to foreground)
/// - build
/// - (didUpdateWidget)
/// ----------
/// - inactive
/// - deactivate
/// - dispose
///
/// - paused (Went to background)
/// - detached
///
/// Read more
/// - https://medium.com/flutter-community/flutter-lifecycle-for-android-and-ios-developers-8f532307e0c7
/// - https://stackoverflow.com/questions/41479255/life-cycle-in-flutter
///

abstract class FalconState<T extends StatefulWidget> extends State<T>
    with WidgetsBindingObserver {
  FalconState({FullWidgetState? initialWidgetState})
      : _initState = initialWidgetState;

  final FullWidgetState? _initState;
  late final FullWidgetStateNotifier stateNotifier;

  bool get debug => false;

  FullWidgetState get state => stateNotifier.value;

  String get tag => '${widget.runtimeType} State';

  Key? get key => widget.key;

  Future<Version> get currentVersion async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    final versionStr = packageInfo.version;
    final buildNumber = packageInfo.buildNumber;
    final fullVersion = '$versionStr+$buildNumber';
    return Version.parse(fullVersion);
  }

  @override
  void initState() {
    super.initState(); // Should call first
    if (debug) {
      printInfo('$tag => Lifecycle State: initState');
    }
    stateNotifier = FullWidgetStateNotifier(_initState);
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        postFrame(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return FullWidgetStateBuilder(
      create: stateNotifier,
      builder: (context, state, child) => buildState(context, state),
    );
  }

  Widget buildState(BuildContext context, FullWidgetState state) {
    return Placeholder();
  }

  @override
  void dispose() {
    if (debug) {
      printInfo('$tag => Lifecycle State: dispose');
    }
    WidgetsBinding.instance.removeObserver(this);
    stateNotifier.dispose();
    super.dispose(); // Should call last
  }

  void postFrame(BuildContext context) {}

  void resumed() {}

  void inactive() {}

  void paused() {}

  void detached() {}

  void hidden() {}

  @protected
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:
        if (debug) {
          printInfo('$tag => Lifecycle State: resumed');
        }
        resumed();
        break;
      case AppLifecycleState.inactive:
        if (debug) {
          printInfo('$tag => Lifecycle State: inactive');
        }
        inactive();
        break;
      case AppLifecycleState.hidden:
        if (debug) {
          printInfo('$tag => Lifecycle State: hidden');
        }
        hidden();
        break;
      case AppLifecycleState.paused:
        if (debug) {
          printInfo('$tag => Lifecycle State: paused');
        }
        paused();
        break;
      case AppLifecycleState.detached:
        if (debug) {
          printInfo('$tag => Lifecycle State: detached');
        }
        detached();
        break;
    }
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  void updateState() => setState(() {});

  void clearFocus() => FocusScope.of(context).unfocus();



  /// Updates the widget state using [stateNotifier] if the widget is still mounted.
  ///
  /// The [state] parameter represents the new [FullWidgetState] to be set.
  ///
  /// Example usage:
  /// ```dart
  /// setFullWidgetState(FullWidgetState.loading); // Set loading state
  ///
  /// // In async operations
  /// try {
  ///   setFullWidgetState(FullWidgetState.loading);
  ///   await someOperation();
  ///   setFullWidgetState(FullWidgetState.success);
  /// } catch (e) {
  ///   setFullWidgetState(FullWidgetState.error);
  /// }
  /// ```
  ///
  /// To handle state changes in the UI:
  /// ```dart
  /// buildState(context, state) {
  ///   switch (state) {
  ///     case FullWidgetState.loading:
  ///       return LoadingWidget();
  ///     case FullWidgetState.success:
  ///       return SuccessWidget();
  ///     case FullWidgetState.error:
  ///       return ErrorWidget();
  ///   }
  /// }
  /// ```
  ///
  /// Or use [FullWidgetStateBuilder] with [stateNotifier] directly:
  /// ```dart
  /// FullWidgetStateBuilder(
  ///   stateNotifier: stateNotifier,
  ///   builder: (context, state) {
  ///     // Handle different states
  ///   },
  /// )
  /// ```
  void setFullWidgetState(FullWidgetState state) {
    if (mounted) {
      stateNotifier.value = state;
    }
  }

  /// Sets the widget state to normal and optionally executes a callback function.
  ///
  /// The optional [fn] parameter is a callback that will be executed before setting the state to normal.
  ///
  /// Example usage:
  /// ```dart
  /// // Simple usage
  /// setNormalState();
  ///
  /// // With callback
  /// setNormalState(() {
  ///   // Do something before setting normal state
  ///   data.clear();
  /// });
  /// ```
  ///
  /// See how to handle states in UI at `setFullWidgetState()`
  void setNormalState([VoidCallback? fn]) {
    if (mounted) {
      fn?.call();
      stateNotifier.value = FullWidgetState.normal;
    }
  }

  /// Sets the widget state to loading and optionally executes a callback function.
  ///
  /// The optional [fn] parameter is a callback that will be executed before setting the state to loading.
  ///
  /// Example usage:
  /// ```dart
  /// // Simple usage
  /// setLoadingState();
  ///
  /// // With callback
  /// setLoadingState(() {
  ///   // Do something before setting loading state
  ///   data.setLoadingState();
  /// });
  /// ```
  ///
  /// See how to handle states in UI at `setFullWidgetState()`
  void setLoadingState([VoidCallback? fn]) {
    if (mounted) {
      fn?.call();
      stateNotifier.value = FullWidgetState.loading;
    }
  }

  /// Sets the widget state to hovered and optionally executes a callback function.
  ///
  /// The optional [fn] parameter is a callback that will be executed before setting the state to hovered.
  ///
  /// Example usage:
  /// ```dart
  /// // Simple usage
  /// setHoveredState();
  ///
  /// // With callback
  /// setHoveredState(() {
  ///   // Do something before setting hovered state
  ///   data.setHoveredState();
  /// });
  /// ```
  ///
  /// See how to handle states in UI at `setFullWidgetState()`
  void setHoveredState([VoidCallback? fn]) {
    if (mounted) {
      fn?.call();
      stateNotifier.value = FullWidgetState.hovered;
    }
  }

  /// Sets the widget state to focused and optionally executes a callback function.
  ///
  /// The optional [fn] parameter is a callback that will be executed before setting the state to focused.
  ///
  /// Example usage:
  /// ```dart
  /// // Simple usage
  /// setFocusedState();
  ///
  /// // With callback
  /// setFocusedState(() {
  ///   // Do something before setting focused state
  ///   data.setFocusedState();
  /// });
  /// ```
  ///
  /// See how to handle states in UI at `setFullWidgetState()`
  void setFocusedState([VoidCallback? fn]) {
    if (mounted) {
      fn?.call();
      stateNotifier.value = FullWidgetState.focused;
    }
  }

  /// Sets the widget state to disabled and optionally executes a callback function.
  ///
  /// The optional [fn] parameter is a callback that will be executed before setting the state to disabled.
  ///
  /// Example usage:
  /// ```dart
  /// // Simple usage
  /// setDisabledState();
  ///
  /// // With callback
  /// setDisabledState(() {
  ///   // Do something before setting disabled state
  ///   data.setDisabledState();
  /// });
  /// ```
  ///
  /// See how to handle states in UI at `setFullWidgetState()`
  void setDisabledState([VoidCallback? fn]) {
    if (mounted) {
      fn?.call();
      stateNotifier.value = FullWidgetState.disabled;
    }
  }

  /// Sets the widget state to warning and optionally executes a callback function.
  ///
  /// The optional [fn] parameter is a callback that will be executed before setting the state to warning.
  ///
  /// Example usage:
  /// ```dart
  /// // Simple usage
  /// setWarningState();
  ///
  /// // With callback
  /// setWarningState(() {
  ///   // Do something before setting warning state
  ///   data.setWarningState();
  /// });
  /// ```
  ///
  /// See how to handle states in UI at `setFullWidgetState()`
  void setWarningState([VoidCallback? fn]) {
    if (mounted) {
      fn?.call();
      stateNotifier.value = FullWidgetState.warning;
    }
  }

  /// Sets the widget state to empty and optionally executes a callback function.
  ///
  /// The optional [fn] parameter is a callback that will be executed before setting the state to empty.
  ///
  /// Example usage:
  /// ```dart
  /// // Simple usage
  /// setEmptyState();
  ///
  /// // With callback
  /// setEmptyState(() {
  ///   // Do something before setting empty state
  ///   data.setEmptyState();
  /// });
  /// ```
  ///
  /// See how to handle states in UI at `setFullWidgetState()`
  void setEmptyState([VoidCallback? fn]) {
    if (mounted) {
      fn?.call();
      stateNotifier.value = FullWidgetState.empty;
    }
  }

  /// Sets the widget state to selected and optionally executes a callback function.
  ///
  /// The optional [fn] parameter is a callback that will be executed before setting the state to selected.
  ///
  /// Example usage:
  /// ```dart
  /// // Simple usage
  /// setSelectedState();
  ///
  /// // With callback
  /// setSelectedState(() {
  ///   // Do something before setting selected state
  ///   data.setSelectedState();
  /// });
  /// ```
  ///
  /// See how to handle states in UI at `setFullWidgetState()`
  void setSelectedState([VoidCallback? fn]) {
    if (mounted) {
      fn?.call();
      stateNotifier.value = FullWidgetState.selected;
    }
  }

  /// Sets the widget state to success and optionally executes a callback function.
  ///
  /// The optional [fn] parameter is a callback that will be executed before setting the state to success.
  ///
  /// Example usage:
  /// ```dart
  /// // Simple usage
  /// setSuccessState();
  ///
  /// // With callback
  /// setSuccessState(() {
  ///   // Do something before setting success state
  ///   data.setSuccessState();
  /// });
  /// ```
  ///
  /// See how to handle states in UI at `setFullWidgetState()`
  void setSuccessState([VoidCallback? fn]) {
    if (mounted) {
      fn?.call();
      stateNotifier.value = FullWidgetState.success;
    }
  }

  /// Sets the widget state to cancel and optionally executes a callback function.
  ///
  /// The optional [fn] parameter is a callback that will be executed before setting the state to cancel.
  ///
  /// Example usage:
  /// ```dart
  /// // Simple usage
  /// setCancelState();
  ///
  /// // With callback
  /// setCancelState(() {
  ///   // Do something before setting cancel state
  ///   data.setCancelState();
  /// });
  /// ```
  ///
  /// See how to handle states in UI at `setFullWidgetState()`
  void setCancelState([VoidCallback? fn]) {
    if (mounted) {
      fn?.call();
      stateNotifier.value = FullWidgetState.cancel;
    }
  }

  /// Sets the widget state to fail and optionally executes a callback function.
  ///
  /// The optional [fn] parameter is a callback that will be executed before setting the state to fail.
  ///
  /// Example usage:
  /// ```dart
  /// // Simple usage
  /// setFailState();
  ///
  /// // With callback
  /// setFailState(() {
  ///   // Do something before setting fail state
  ///   data.setFailState();
  /// });
  /// ```
  ///
  /// See how to handle states in UI at `setFullWidgetState()`
  void setFailState([VoidCallback? fn]) {
    if (mounted) {
      fn?.call();
      stateNotifier.value = FullWidgetState.fail;
    }
  }
}
