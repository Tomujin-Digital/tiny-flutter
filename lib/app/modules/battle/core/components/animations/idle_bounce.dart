import 'package:flutter/material.dart';

class IdleBounce extends StatefulWidget {
  const IdleBounce({
    Key? key,
    required this.builder,
    required this.child,
    this.offset = 0.0,
    this.duration = const Duration(seconds: 1),
  }) : super(key: key);

  final double offset;
  final Duration duration;
  final Widget child;
  final Widget Function(BuildContext, Widget, double) builder;

  @override
  State<IdleBounce> createState() => _IdleBounceState();
}

class _IdleBounceState extends State<IdleBounce>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      value: widget.offset,
      vsync: this,
      lowerBound: 0.0,
      upperBound: 1.0,
      duration: widget.duration,
    );

    _controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, __) {
        return widget.builder(context, widget.child, _controller.value);
      },
    );
  }
}
