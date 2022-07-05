import 'package:flutter/material.dart';

/// Delay a widget for the given duration
class Delayed extends StatelessWidget {
  const Delayed({
    Key? key,
    required this.duration,
    required this.child,
  }) : super(key: key);

  final Widget child;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      initialData: false,
      future: Future.delayed(duration, () => true),
      builder: (context, snapshot) {
        if (snapshot.data == true) {
          return child;
        } else {
          return Container();
        }
      },
    );
  }
}
