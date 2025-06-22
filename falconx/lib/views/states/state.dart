import 'package:falconx/lib.dart';

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
    final packageInfo = await PackageInfo.fromPlatform();
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
    return stateBuilder(
      (context, state, child) => buildState(context, state),
    );
  }

  Widget buildState(BuildContext context, FullWidgetState state) {
    return const Placeholder();
  }

  Widget stateBuilder(
    Widget Function(BuildContext context, FullWidgetState state, Widget? child)
        builder,
  ) {
    return FullWidgetStateBuilder(
      create: stateNotifier,
      builder: builder,
    );
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
      case AppLifecycleState.inactive:
        if (debug) {
          printInfo('$tag => Lifecycle State: inactive');
        }
        inactive();
      case AppLifecycleState.hidden:
        if (debug) {
          printInfo('$tag => Lifecycle State: hidden');
        }
        hidden();
      case AppLifecycleState.paused:
        if (debug) {
          printInfo('$tag => Lifecycle State: paused');
        }
        paused();
      case AppLifecycleState.detached:
        if (debug) {
          printInfo('$tag => Lifecycle State: detached');
        }
        detached();
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
  /// changeToFullWidgetState(FullWidgetState.loading); // Set loading state
  ///
  /// // In async operations
  /// try {
  ///   changeToFullWidgetState(FullWidgetState.loading);
  ///   await someOperation();
  ///   changeToFullWidgetState(FullWidgetState.success);
  /// } catch (e) {
  ///   changeToFullWidgetState(FullWidgetState.error);
  /// }
  /// ```
  ///
  /// To handle change state in the UI:
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
  void changeToFullWidgetState(FullWidgetState state) {
    if (mounted) {
      stateNotifier.value = state;
    }
  }

  void setFullWidgetState(FullWidgetState state) {
    if (mounted) {
      setState(() {
        stateNotifier.value = state;
      });
    }
  }

  /// Sets the widget state to normal and optionally executes a callback function.
  ///
  /// The optional [fn] parameter is a callback that will be executed before setting the state to normal.
  ///
  /// Example usage:
  /// ```dart
  /// // Simple usage
  /// changeToNormalState();
  ///
  /// // With callback
  /// changeToNormalState(() {
  ///   // Do something before setting normal state
  ///   data.clear();
  /// });
  /// ```
  ///
  /// See how to handle states in UI at `setFullWidgetState()`
  void changeToNormalState([VoidCallback? fn]) {
    if (mounted) {
      fn?.call();
      stateNotifier.value = FullWidgetState.normal;
    }
  }

  void setNormalState([VoidCallback? fn]) {
    if (mounted) {
      setState(() {
        fn?.call();
        stateNotifier.value = FullWidgetState.normal;
      });
    }
  }

  /// Sets the widget state to loading and optionally executes a callback function.
  ///
  /// The optional [fn] parameter is a callback that will be executed before setting the state to loading.
  ///
  /// Example usage:
  /// ```dart
  /// // Simple usage
  /// changeToLoadingState();
  ///
  /// // With callback
  /// changeToLoadingState(() {
  ///   // Do something before setting loading state
  ///   data.changeToLoadingState();
  /// });
  /// ```
  ///
  /// See how to handle states in UI at `setFullWidgetState()`
  void changeToLoadingState([VoidCallback? fn]) {
    if (mounted) {
      fn?.call();
      stateNotifier.value = FullWidgetState.loading;
    }
  }

  void setLoadingState([VoidCallback? fn]) {
    if (mounted) {
      setState(() {
        fn?.call();
        stateNotifier.value = FullWidgetState.loading;
      });
    }
  }

  /// Sets the widget state to hovered and optionally executes a callback function.
  ///
  /// The optional [fn] parameter is a callback that will be executed before setting the state to hovered.
  ///
  /// Example usage:
  /// ```dart
  /// // Simple usage
  /// changeToHoveredState();
  ///
  /// // With callback
  /// changeToHoveredState(() {
  ///   // Do something before setting hovered state
  ///   data.changeToHoveredState();
  /// });
  /// ```
  ///
  /// See how to handle states in UI at `setFullWidgetState()`
  void changeToHoveredState([VoidCallback? fn]) {
    if (mounted) {
      fn?.call();
      stateNotifier.value = FullWidgetState.hovered;
    }
  }

  void setHoveredState([VoidCallback? fn]) {
    if (mounted) {
      setState(() {
        fn?.call();
        stateNotifier.value = FullWidgetState.hovered;
      });
    }
  }

  /// Sets the widget state to focused and optionally executes a callback function.
  ///
  /// The optional [fn] parameter is a callback that will be executed before setting the state to focused.
  ///
  /// Example usage:
  /// ```dart
  /// // Simple usage
  /// changeToFocusedState();
  ///
  /// // With callback
  /// changeToFocusedState(() {
  ///   // Do something before setting focused state
  ///   data.changeToFocusedState();
  /// });
  /// ```
  ///
  /// See how to handle states in UI at `setFullWidgetState()`
  void changeToFocusedState([VoidCallback? fn]) {
    if (mounted) {
      fn?.call();
      stateNotifier.value = FullWidgetState.focused;
    }
  }

  void setFocusedState([VoidCallback? fn]) {
    if (mounted) {
      setState(() {
        fn?.call();
        stateNotifier.value = FullWidgetState.focused;
      });
    }
  }

  /// Sets the widget state to focus-visible and optionally executes a callback function.
  ///
  /// The optional [fn] parameter is a callback that will be executed before setting the state to focus-visible.
  ///
  /// Example usage:
  /// ```dart
  /// // Simple usage
  /// changeToFocusedVisibleState();
  ///
  /// // With callback
  /// changeToFocusedVisibleState(() {
  ///   // Do something before setting focused state
  ///   data.changeToFocusedVisibleState();
  /// });
  /// ```
  ///
  /// See how to handle states in UI at `setFullWidgetState()`
  void changeToFocusedVisibleState([VoidCallback? fn]) {
    if (mounted) {
      fn?.call();
      stateNotifier.value = FullWidgetState.focusedVisible;
    }
  }

  void setFocusedVisibleState([VoidCallback? fn]) {
    if (mounted) {
      setState(() {
        fn?.call();
        stateNotifier.value = FullWidgetState.focusedVisible;
      });
    }
  }

  /// Sets the widget state to disabled and optionally executes a callback function.
  ///
  /// The optional [fn] parameter is a callback that will be executed before setting the state to disabled.
  ///
  /// Example usage:
  /// ```dart
  /// // Simple usage
  /// changeToDisabledState();
  ///
  /// // With callback
  /// changeToDisabledState(() {
  ///   // Do something before setting disabled state
  ///   data.changeToDisabledState();
  /// });
  /// ```
  ///
  /// See how to handle states in UI at `setFullWidgetState()`
  void changeToDisabledState([VoidCallback? fn]) {
    if (mounted) {
      fn?.call();
      stateNotifier.value = FullWidgetState.disabled;
    }
  }

  void setDisabledState([VoidCallback? fn]) {
    if (mounted) {
      setState(() {
        fn?.call();
        stateNotifier.value = FullWidgetState.disabled;
      });
    }
  }

  /// Sets the widget state to warning and optionally executes a callback function.
  ///
  /// The optional [fn] parameter is a callback that will be executed before setting the state to warning.
  ///
  /// Example usage:
  /// ```dart
  /// // Simple usage
  /// changeToWarningState();
  ///
  /// // With callback
  /// changeToWarningState(() {
  ///   // Do something before setting warning state
  ///   data.changeToWarningState();
  /// });
  /// ```
  ///
  /// See how to handle states in UI at `setFullWidgetState()`
  void changeToWarningState([VoidCallback? fn]) {
    if (mounted) {
      fn?.call();
      stateNotifier.value = FullWidgetState.warning;
    }
  }

  void setWarningState([VoidCallback? fn]) {
    if (mounted) {
      setState(() {
        fn?.call();
        stateNotifier.value = FullWidgetState.warning;
      });
    }
  }

  /// Sets the widget state to empty and optionally executes a callback function.
  ///
  /// The optional [fn] parameter is a callback that will be executed before setting the state to empty.
  ///
  /// Example usage:
  /// ```dart
  /// // Simple usage
  /// changeToEmptyState();
  ///
  /// // With callback
  /// changeToEmptyState(() {
  ///   // Do something before setting empty state
  ///   data.changeToEmptyState();
  /// });
  /// ```
  ///
  /// See how to handle states in UI at `setFullWidgetState()`
  void changeToEmptyState([VoidCallback? fn]) {
    if (mounted) {
      fn?.call();
      stateNotifier.value = FullWidgetState.empty;
    }
  }

  void setEmptyState([VoidCallback? fn]) {
    if (mounted) {
      setState(() {
        fn?.call();
        stateNotifier.value = FullWidgetState.empty;
      });
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
  void changeToSelectedState([VoidCallback? fn]) {
    if (mounted) {
      fn?.call();
      stateNotifier.value = FullWidgetState.selected;
    }
  }

  void setSelectedState([VoidCallback? fn]) {
    if (mounted) {
      setState(() {
        fn?.call();
        stateNotifier.value = FullWidgetState.selected;
      });
    }
  }

  /// Sets the widget state to success and optionally executes a callback function.
  ///
  /// The optional [fn] parameter is a callback that will be executed before setting the state to success.
  ///
  /// Example usage:
  /// ```dart
  /// // Simple usage
  /// changeToSuccessState();
  ///
  /// // With callback
  /// changeToSuccessState(() {
  ///   // Do something before setting success state
  ///   data.changeToSuccessState();
  /// });
  /// ```
  ///
  /// See how to handle states in UI at `setFullWidgetState()`
  void changeToSuccessState([VoidCallback? fn]) {
    if (mounted) {
      fn?.call();
      stateNotifier.value = FullWidgetState.success;
    }
  }

  void setSuccessState([VoidCallback? fn]) {
    if (mounted) {
      setState(() {
        fn?.call();
        stateNotifier.value = FullWidgetState.success;
      });
    }
  }

  /// Sets the widget state to cancel and optionally executes a callback function.
  ///
  /// The optional [fn] parameter is a callback that will be executed before setting the state to cancel.
  ///
  /// Example usage:
  /// ```dart
  /// // Simple usage
  /// changeToCancelState();
  ///
  /// // With callback
  /// changeToCancelState(() {
  ///   // Do something before setting cancel state
  ///   data.changeToCancelState();
  /// });
  /// ```
  ///
  /// See how to handle states in UI at `setFullWidgetState()`
  void changeToCancelState([VoidCallback? fn]) {
    if (mounted) {
      fn?.call();
      stateNotifier.value = FullWidgetState.cancel;
    }
  }

  void setCancelState([VoidCallback? fn]) {
    if (mounted) {
      setState(() {
        fn?.call();
        stateNotifier.value = FullWidgetState.cancel;
      });
    }
  }

  /// Sets the widget state to fail and optionally executes a callback function.
  ///
  /// The optional [fn] parameter is a callback that will be executed before setting the state to fail.
  ///
  /// Example usage:
  /// ```dart
  /// // Simple usage
  /// changeToFailState();
  ///
  /// // With callback
  /// changeToFailState(() {
  ///   // Do something before setting fail state
  ///   data.changeToFailState();
  /// });
  /// ```
  ///
  /// See how to handle states in UI at `setFullWidgetState()`
  void changeToFailState([VoidCallback? fn]) {
    if (mounted) {
      fn?.call();
      stateNotifier.value = FullWidgetState.fail;
    }
  }

  void setFailState([VoidCallback? fn]) {
    if (mounted) {
      setState(() {
        fn?.call();
        stateNotifier.value = FullWidgetState.fail;
      });
    }
  }
}
