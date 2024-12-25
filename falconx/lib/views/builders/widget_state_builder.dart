import 'package:falconx/lib.dart';

class FullWidgetStateBuilder extends StatefulWidget {
  const FullWidgetStateBuilder({
    super.key,
    required this.create,
    required this.builder,
  });

  final FullWidgetStateNotifier create;
  final Widget Function(
      BuildContext context, FullWidgetState state, Widget? child) builder;

  @override
  State<FullWidgetStateBuilder> createState() => _FullWidgetStateBuilderState();
}

class _FullWidgetStateBuilderState extends State<FullWidgetStateBuilder> {
  @override
  Widget build(BuildContext context) => ValueListenableBuilder(
        valueListenable: widget.create,
        builder: (context, state, child) =>
            widget.builder(context, state, child),
      );
}
