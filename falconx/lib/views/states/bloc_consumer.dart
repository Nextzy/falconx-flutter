import 'package:falconx/lib.dart';

class WidgetStateBlocConsumer<
    PAGE_EVENT,
    B extends StateStreamable<WidgetStateEvent<DATA?>>,
    DATA> extends BlocConsumer<B, WidgetStateEvent<DATA?>> {
  WidgetStateBlocConsumer({
    super.key,
    super.bloc,
    BlocWidgetListenerEvent<PAGE_EVENT>? listenEvent,
    BlocWidgetListenerState<WidgetStateEvent<DATA?>>? listenState,
    BlocBuilderCondition<WidgetStateEvent<DATA?>>? buildWhen,
    required super.builder,
  }) : super(
          listenWhen: (previous, current) => true,
          listener: (context, state) {
            if (state.event != null) {
              listenEvent?.call(
                  context, state.event!.name as PAGE_EVENT, state.event!.data);
            }
            listenState?.call(context, state);
          },
          buildWhen: (previous, current) {
            if (current.event != null) {
              // No build the widget when state has event
              return false;
            } else if (buildWhen != null) {
              return buildWhen(previous, current);
            } else if (current.event == null) {
              return current.build;
            } else {
              return true;
            }
          },
        );
}

class WidgetStateSafeBlocConsumer<
    PAGE_EVENT,
    B extends StateStreamable<WidgetStateEvent<DATA>>,
    DATA> extends BlocConsumer<B, WidgetStateEvent<DATA>> {
  WidgetStateSafeBlocConsumer({
    super.key,
    super.bloc,
    BlocWidgetListenerEvent<PAGE_EVENT>? listenEvent,
    BlocWidgetListenerState<WidgetStateEvent<DATA>>? listenState,
    BlocBuilderCondition<WidgetStateEvent<DATA>>? buildWhen,
    required super.builder,
  }) : super(
          listenWhen: (previous, current) => true,
          listener: (context, state) {
            if (state.event != null) {
              listenEvent?.call(
                  context, state.event!.name as PAGE_EVENT, state.event!.data);
            }
            listenState?.call(context, state);
          },
          buildWhen: (previous, current) {
            if (current.event != null) {
              // No build the widget when state has event
              return false;
            } else if (buildWhen != null) {
              return buildWhen(previous, current);
            } else if (current.event == null) {
              return current.build;
            } else {
              return true;
            }
          },
        );
}
