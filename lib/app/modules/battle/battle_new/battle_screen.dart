import 'dart:math' as math;

import 'package:flutter/material.dart';
import '../battle/components/battle_drawables_layer.dart';
import '../core/components/animations/delay.dart';
import '../core/components/animations/i_zoom.dart';
import '../core/components/touchables/flat_button.dart';
import '../path/spine.dart';
import 'battle_controller.dart';
import 'battle_controller_provider.dart';
import 'components/animated_tree.dart';
import 'components/announcer.dart';
import 'components/battle_banner.dart';
import 'components/bottom_controls.dart';
import 'components/quiz_presenter.dart';

class BattleScreen extends StatefulWidget {
  const BattleScreen({Key? key}) : super(key: key);

  @override
  State<BattleScreen> createState() => _BattleScreenState();
}

class _BattleScreenState extends State<BattleScreen>
    with SingleTickerProviderStateMixin {
  late BattleController battleController;

  @override
  void initState() {
    battleController = BattleController(this);
    super.initState();
  }

  @override
  void dispose() {
    battleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BattleControllerProvider(
      controller: battleController,
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            // Background
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff129959),
                      Color(0xff21CB7A),
                      Color(0xff21CB7A),
                      Color(0xff14A660),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),

            // Trees left
            for (int i = -2; i <= 2; i++)
              Positioned(
                key: ValueKey('tree_left_$i'),
                left: 0,
                top: 0,
                bottom: 0,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: FractionalTranslation(
                    translation: Offset(
                      -0.5 + (math.Random().nextDouble() - 0.0) * 0.5,
                      i * 0.75 + (math.Random().nextDouble() - 0.5) / 3,
                    ),
                    child: Delayed(
                      duration: Duration(
                        milliseconds: 300 + math.Random().nextInt(400),
                      ),
                      child: AnimatedTree(),
                    ),
                  ),
                ),
              ),
            // Trees right
            for (int i = -2; i <= 2; i++)
              Positioned(
                key: ValueKey('tree_right_$i'),
                right: 0,
                top: 0,
                bottom: 0,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: FractionalTranslation(
                    translation: Offset(
                      0.5 + (math.Random().nextDouble() - 1.0) * 0.5,
                      i * 0.75 + (math.Random().nextDouble() - 0.5) / 3,
                    ),
                    child: Delayed(
                      duration: Duration(
                        milliseconds: 300 + math.Random().nextInt(400),
                      ),
                      child: AnimatedTree(),
                    ),
                  ),
                ),
              ),
            BattleDrawablesLayer(
              enemyController: battleController.enemyController,
              playerController: battleController.playerController,
            ),

            const Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.fromLTRB(24.0, 0.0, 24.0, 0.0),
                child: BattleBanner(),
              ),
            ),

            // Announcer
            Align(
              alignment: Alignment.center,
              child: Announcer(
                controller: battleController.screenCtrl.announcerCtrl,
              ),
            ),

            // Bottom Control Panel
            Align(
              alignment: Alignment.bottomCenter,
              child: BottomControlPanel(
                controller: battleController.screenCtrl.controlPanelCtrl,
              ),
            ),

            // Question

            const Align(
              alignment: Alignment.center,
              child: QuizPresenter(),
            ),

            Positioned.fill(
              child: ValueListenableBuilder<String?>(
                valueListenable: battleController.screenCtrl.endGameMessage,
                builder: (ctx, msg, _) {
                  if (msg == null) {
                    return Container();
                  }

                  return Container(
                    color: Colors.black.withOpacity(0.5),
                    child: IZoom(
                      begin: 0.8,
                      child: Center(
                        child: Container(
                          width: 375,
                          padding: EdgeInsets.all(24.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24.0),
                              color: Colors.white),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                msg,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 32,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 12.0, bottom: 12),
                                child: SizedBox(
                                  height: 128.0,
                                  child: Builder(
                                    builder: (ctx) {
                                      return Spine(
                                        'player',
                                        controller: battleController
                                            .playerController.spineCtrl,
                                      );
                                    },
                                  ),
                                ),
                              ),
                              FilledButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text("Go back"),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
