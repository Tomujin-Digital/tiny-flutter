import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class DesktopScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices {
    return {
      PointerDeviceKind.touch,
      PointerDeviceKind.mouse,
    };
  }
}
