import 'package:flutter/material.dart';
import 'package:pocket_tomyo/app/modules/battle/utilities/space_widgets.dart';
import 'dart:math' as math;

import '../../../../../widgets/buttons/touchable_scale.dart';
import '../../core/components/animations/idle_bounce.dart';
import '../question_layer_controller.dart';

// TODO:
// - Idle animation on question box
// - Fade in/out animation
// - Entry animation
class BattleQuestionLayer extends StatelessWidget {
  const BattleQuestionLayer({
    Key? key,
    required this.onPressOption,
    required this.controller,
  }) : super(key: key);
  final ValueSetter<String> onPressOption;
  final QuestionLayerController controller;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: controller.isVisible,
      builder: (context, isVisible, child) {
        return TweenAnimationBuilder<double>(
          tween: Tween<double>(
            begin: isVisible ? 1.0 : 0.0,
            end: isVisible ? 1.0 : 0.0,
          ),
          duration: Duration(milliseconds: 200),
          builder: (_, opacity, __) {
            if (opacity == 0.0) {
              return Container();
            }

            return Opacity(
              opacity: opacity,
              child: child,
            );
          },
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FutureBuilder<bool>(
            future: Future.delayed(Duration(milliseconds: 100), () => true),
            builder: (context, snapshot) {
              final body = Container(
                margin: EdgeInsets.only(bottom: 24.0),
                padding: EdgeInsets.fromLTRB(28.0, 24.0, 28.0, 24.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    width: 2,
                  ),
                ),
                child: Text(
                  "This ____ apple",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 24.0,
                  ),
                ),
              );

              return TweenAnimationBuilder<double>(
                tween: Tween<double>(
                    begin: 0.0, end: snapshot.data != true ? 0.0 : 1.0),
                duration: Duration(milliseconds: 300),
                builder: (ctx, opacity, _) => Opacity(
                  opacity: opacity,
                  child: body,
                ),
              );
              if (snapshot.data != true)
                return Opacity(opacity: 0.0, child: body);
              return body;
            },
          ),
          TweenAnimationBuilder<double>(
            tween: Tween<double>(
              begin: 0.0,
              end: 1.0,
            ),
            duration: Duration(milliseconds: 450),
            curve: Curves.easeInOutCubicEmphasized,
            builder: (context, scale, child) {
              return Transform.scale(
                scale: scale,
                origin: Offset(0.0, -200.0),
                alignment: Alignment.topCenter,
                child: child,
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <String>['is', 'and', 'was', 'are']
                  .map(
                    (option) => IdleBounce(
                      offset: math.Random().nextDouble(),
                      duration: Duration(
                        milliseconds: Tween<double>(begin: 900.0, end: 1200.0)
                            .transform(math.Random().nextDouble())
                            .toInt(),
                      ),
                      builder: (ctx, child, value) {
                        return Transform.rotate(
                          angle: Tween<double>(begin: 0.08, end: -0.10)
                              .transform(value),
                          child: child,
                        );
                      },
                      child: TouchableScale(
                        onPressed: () => onPressOption(option),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 12.0),
                          decoration: BoxDecoration(
                            color: Colors.pinkAccent,
                            border: Border.all(width: 2.0),
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Text(
                            option,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList()
                  .spaceWidgets(16.0),
            ),
          )
        ],
      ),
    );
  }
}
