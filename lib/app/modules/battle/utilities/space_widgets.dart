import 'package:flutter/material.dart';

extension SpaceWidgets on List<Widget> {
  List<Widget> spaceWidgets([
    double horizontalWidth = 0.0,
    double verticalHeight = 0.0,
  ]) {
    List<Widget> spacedElements = [];

    for (int i = 0; i < length; i++) {
      if (i > 0) {
        spacedElements.add(
          SizedBox(
            width: horizontalWidth,
            height: verticalHeight,
          ),
        );
      }
      spacedElements.add(this[i]);
    }

    return spacedElements;
  }
}
