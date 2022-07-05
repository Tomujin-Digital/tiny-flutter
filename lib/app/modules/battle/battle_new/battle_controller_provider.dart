import 'package:flutter/material.dart';

import 'battle_controller.dart';

mixin BattleControllerProviderMixin<T extends StatefulWidget> on State<T> {
  BattleController get battleController =>
      BattleControllerProvider.of(context)!.controller;
}

class BattleControllerProvider extends InheritedWidget {
  const BattleControllerProvider({
    Key? key,
    required Widget child,
    required this.controller,
  }) : super(key: key, child: child);

  final BattleController controller;

  static BattleControllerProvider? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<BattleControllerProvider>();
  }

  @override
  bool updateShouldNotify(BattleControllerProvider oldWidget) {
    return false;
  }
}
