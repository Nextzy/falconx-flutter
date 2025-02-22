import 'package:falconx/lib.dart';

typedef BlocWidgetListenerState<S> = void Function(
    BuildContext context, S state);
typedef BlocWidgetListenerEvent<S> = void Function(
    BuildContext context, S event, Object? data);
typedef CanPopListener<S> = bool Function(S state);
typedef PopListener<S> = void Function(S state, Object? result);
@Deprecated(
  'Use PopListener instead. '
  'This feature was deprecated after v3.12.0-1.0.pre.',
)
typedef WillPopListener<S> = Future<bool> Function(
    BuildContext context, S state);

abstract class FalconWidgetEventBlocState<
    WIDGET extends StatefulWidget,
    BLOC extends BlocBase<WidgetStateEvent<DATA?>>,
    DATA> extends FalconBlocState<WIDGET, BLOC, WidgetStateEvent<DATA?>> {
  FalconWidgetEventBlocState({super.initialWidgetState});

  Widget buildWithBloc({
    BlocWidgetListenerEvent<Object>? listenEvent,
    BlocWidgetListenerState<WidgetStateEvent<DATA?>>? listenState,
    CanPopListener<WidgetStateEvent<DATA?>>? canPop,
    PopListener<WidgetStateEvent<DATA?>>? onPop,
    @Deprecated(
      'Use onPop instead. '
      'This feature was deprecated after v3.12.0-1.0.pre.',
    )
    WillPopListener<WidgetStateEvent<DATA?>>? onWillPop,
    BlocListenerCondition<WidgetStateEvent<DATA?>>? buildWhen,
    required Widget Function(
            BuildContext context, WidgetStateEvent<DATA?> state)
        builder,
  }) =>
      WidgetStateBlocConsumer<BLOC, DATA>(
        bloc: bloc,
        listenEvent: listenEvent,
        listenState: listenState,
        buildWhen: buildWhen,
        builder: (context, state) => GestureDetector(
          onTap: clearFocus,
          child: buildCompatPopScope<WidgetStateEvent<DATA?>>(
            state: state,
            canPop: canPop,
            onPop: onPop,
            onWillPop: onWillPop,
            child: builder(context, state),
          ),
        ),
      );
}

abstract class FalconWidgetEventSafeBlocState<
    WIDGET extends StatefulWidget,
    BLOC extends BlocBase<WidgetStateEvent<DATA>>,
    DATA> extends FalconBlocState<WIDGET, BLOC, WidgetStateEvent<DATA>> {
  FalconWidgetEventSafeBlocState({super.initialWidgetState});

  Widget buildWithBloc({
    BlocWidgetListenerEvent<Object>? listenEvent,
    BlocWidgetListenerState<WidgetStateEvent<DATA>>? listenState,
    CanPopListener<WidgetStateEvent<DATA>>? canPop,
    PopListener<WidgetStateEvent<DATA>>? onPop,
    @Deprecated(
      'Use onPop instead. '
      'This feature was deprecated after v3.12.0-1.0.pre.',
    )
    WillPopListener<WidgetStateEvent<DATA>>? onWillPop,
    BlocListenerCondition<WidgetStateEvent<DATA>>? buildWhen,
    required Widget Function(BuildContext context, WidgetStateEvent<DATA> state)
        builder,
  }) =>
      WidgetStateSafeBlocConsumer<BLOC, DATA>(
        bloc: bloc,
        listenEvent: listenEvent,
        listenState: listenState,
        buildWhen: buildWhen,
        builder: (context, state) => GestureDetector(
          onTap: clearFocus,
          child: buildCompatPopScope<WidgetStateEvent<DATA>>(
            state: state,
            canPop: canPop,
            onPop: onPop,
            onWillPop: onWillPop,
            child: builder(context, state),
          ),
        ),
      );
}

abstract class FalconBlocState<WIDGET extends StatefulWidget,
    BLOC extends BlocBase<STATE>, STATE> extends FalconState<WIDGET> {
  FalconBlocState({super.initialWidgetState});

  FocusNode? get focusNode => FocusManager.instance.primaryFocus;

  BLOC get bloc => context.read<BLOC>();

  Widget buildCompatPopScope<S>({
    required S state,
    required CanPopListener<S>? canPop,
    required PopListener<S>? onPop,
    required WillPopListener<S>? onWillPop,
    required Widget child,
  }) =>
      onPop != null || canPop != null
          ? PopScope(
              canPop: canPop?.call(state) ?? true,
              onPopInvokedWithResult: (didPop, result) {
                if (didPop) return;
                clearFocus();
                onPop?.call(state, result);
              },
              child: child,
            )
          : onWillPop != null
              ? WillPopScope(
                  onWillPop: () {
                    clearFocus();
                    return onWillPop.call(context, state);
                  },
                  child: child,
                )
              : child;
}
