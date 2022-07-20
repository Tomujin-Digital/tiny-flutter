import 'package:flutter/material.dart';
import '../../utilities/space_widgets.dart';
import '../../../../../widgets/buttons/touchable_scale.dart';
import '../battle_controller.dart';
import '../battle_controller_provider.dart';
import 'boost_button.dart';

class BottomControlPanel extends StatefulWidget {
  const BottomControlPanel({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ControlPanelController controller;

  @override
  State<BottomControlPanel> createState() => _BottomControlPanelState();
}

class _BottomControlPanelState extends State<BottomControlPanel>
    with BattleControllerProviderMixin {
  @override
  Widget build(BuildContext context) {
    final Widget controlPanel = Container(
      height: 144.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.black.withOpacity(0.0),
            Colors.black.withOpacity(0.6),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: TouchableScale(
                onPressed: () {
                  // battleController();
                  Navigator.of(context).pop();
                },
                child: const Icon(
                  Icons.exit_to_app_rounded,
                  size: 32,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    BoostButton(
                      type: 0,
                      boostCtrl: battleController.boost1,
                    ),
                    const Text(
                      "Heal",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    BoostButton(
                      type: 1,
                      boostCtrl: battleController.boost2,
                    ),
                    const Text(
                      "+5 sec",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ].spaceWidgets(16.0),
            ),
          ),
        ],
      ),
    );

    return ValueListenableBuilder<bool>(
      valueListenable: widget.controller.visibilityNotifier,
      builder: (ctx, visibility, _) {
        return TweenAnimationBuilder<double>(
          tween: Tween<double>(
            begin: visibility ? 0.0 : 1.0,
            end: visibility ? 0.0 : 1.0,
          ),
          duration: const Duration(milliseconds: 550),
          curve: Curves.easeInOutCubic,
          builder: (context, anim, child) {
            return FractionalTranslation(
              translation: Offset(0.0, anim),
              child: child,
            );
          },
          child: controlPanel,
        );
      },
    );
  }
}
