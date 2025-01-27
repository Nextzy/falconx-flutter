import 'package:falconx/lib.dart';

class WidgetStateBlocConsumer<EVENT, B extends StateStreamable<S>, S>
    extends BlocConsumer<B, S> {
  WidgetStateBlocConsumer({
    super.key,
    super.bloc,
    BlocWidgetListenerEvent<EVENT>? listenEvent,
    BlocWidgetListenerState<S>? listenState,
    BlocBuilderCondition<S>? buildWhen,
    required super.builder,
  }) : super(
          listenWhen: (previous, current) => true,
          listener: (context, state) {
            if (state is WidgetStateEvent && state.event != null) {
              listenEvent?.call(
                  context, state.event!.name as EVENT, state.event!.data);
            }
            listenState?.call(context, state);
          },
          buildWhen: (previous, current) {
            if (current is WidgetStateEvent && current.event != null) {
              // No build the widget when state has event
              return false;
            } else if (buildWhen != null) {
              return buildWhen(previous, current);
            } else if (current is WidgetStateEvent && current.event == null) {
              return current.build;
            } else {
              return true;
            }
          },
        );
}
