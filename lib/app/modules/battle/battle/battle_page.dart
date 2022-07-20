import 'package:flutter/material.dart';

import 'components/battle_background_layer.dart';
import 'components/battle_drawables_layer.dart';
import 'components/battle_question_layer.dart';
import 'enemy_controller.dart';
import 'player_controller.dart';
import 'question_layer_controller.dart';

class BattlePage extends StatefulWidget {
  const BattlePage({Key? key}) : super(key: key);

  @override
  State<BattlePage> createState() => _BattlePageState();
}

class _BattlePageState extends State<BattlePage> {
  final PlayerController _playerController = PlayerController();
  final EnemyController _enemyController = EnemyController();
  final QuestionLayerController _questionLayerController =
      QuestionLayerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      extendBodyBehindAppBar: true,
      body: buildPageBody(),
    );
  }

  Widget buildPageBody() {
    return Stack(
      children: [
        const BattleBackgroundLayer(),
        BattleDrawablesLayer(
          enemyController: _enemyController,
          playerController: _playerController,
        ),
        Positioned.fill(
          child: BattleQuestionLayer(
            controller: _questionLayerController,
            onPressOption: (option) async {
              _questionLayerController.isVisible.value = false;
              await Future.delayed(const Duration(milliseconds: 180));

              await Future.wait(
                [
                  _playerController.attack(),
                  Future.delayed(
                    const Duration(milliseconds: 200),
                    () => _enemyController.getHit(),
                  ),
                ],
              );

              _questionLayerController.isVisible.value = true;
            },
          ),
        ),
        // Positioned.fill(
        //   child: BattleBoostsLayer(),
        // ),
      ],
    );
  }
}
