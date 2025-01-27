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
}

abstract class FalconWidgetEventSafeBlocState<
    WIDGET extends StatefulWidget,
    BLOC extends BlocBase<WidgetStateEvent<DATA>>,
    DATA> extends FalconBlocState<WIDGET, BLOC, WidgetStateEvent<DATA>> {
  FalconWidgetEventSafeBlocState({super.initialWidgetState});
}

abstract class FalconBlocState<WIDGET extends StatefulWidget,
    BLOC extends BlocBase<STATE>, STATE> extends FalconState<WIDGET> {
  FalconBlocState({super.initialWidgetState});

  FocusNode? get focusNode => FocusManager.instance.primaryFocus;

  BLOC get bloc => context.read<BLOC>();

  Widget buildWithBloc<EVENT>({
    BlocWidgetListenerEvent<EVENT>? listenEvent,
    BlocWidgetListenerState<STATE>? listenState,
    CanPopListener<STATE>? canPop,
    PopListener<STATE>? onPop,
    @Deprecated(
      'Use onPop instead. '
      'This feature was deprecated after v3.12.0-1.0.pre.',
    )
    WillPopListener<STATE>? onWillPop,
    BlocListenerCondition<STATE>? buildWhen,
    required Widget Function(BuildContext context, STATE state) builder,
  }) =>
      WidgetStateBlocConsumer<EVENT, BLOC, STATE>(
        bloc: bloc,
        listenEvent: listenEvent,
        listenState: listenState,
        buildWhen: buildWhen,
        builder: (context, state) => GestureDetector(
          onTap: clearFocus,
          child: _buildCompatPopScope<STATE>(
            state: state,
            canPop: canPop,
            onPop: onPop,
            onWillPop: onWillPop,
            child: builder(context, state),
          ),
        ),
      );

  Widget buildWithAnotherBloc<EVENT, B extends StateStreamable<S>, S>({
    required B bloc,
    BlocWidgetListenerEvent<EVENT>? listenEvent,
    BlocWidgetListenerState<S>? listenState,
    CanPopListener<S>? canPop,
    PopListener<S>? onPop,
    @Deprecated(
      'Use onPop instead. '
      'This feature was deprecated after v3.12.0-1.0.pre.',
    )
    WillPopListener<S>? onWillPop,
    BlocListenerCondition<S>? buildWhen,
    required Widget Function(BuildContext context, S state) builder,
  }) =>
      WidgetStateBlocConsumer<EVENT, B, S>(
        bloc: bloc,
        listenEvent: listenEvent,
        listenState: listenState,
        buildWhen: buildWhen,
        builder: (context, state) => GestureDetector(
          onTap: clearFocus,
          child: _buildCompatPopScope<S>(
            state: state,
            canPop: canPop,
            onPop: onPop,
            onWillPop: onWillPop,
            child: builder(context, state),
          ),
        ),
      );

  Widget _buildCompatPopScope<S>({
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
