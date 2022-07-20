import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import '../../utilities/space_widgets.dart';
import '../../../../../widgets/buttons/touchable_scale.dart';
import '../../models/quiz.dart';
import '../battle_controller.dart';
import '../battle_controller_provider.dart';

class QuizCardSlider extends StatefulWidget {
  const QuizCardSlider({
    Key? key,
    required this.child,
    required this.controller,
  }) : super(key: key);

  final QuizCardTransformationController controller;
  final Widget child;

  @override
  State<QuizCardSlider> createState() => _QuizCardSliderState();
}

class _QuizCardSliderState extends State<QuizCardSlider>
    with TickerProviderStateMixin, BattleControllerProviderMixin {
  late AnimationController _translationX;
  late AnimationController _translationY;
  late AnimationController _translationZ;
  late AnimationController _rotationX;
  late AnimationController _rotationY;
  late AnimationController _rotationZ;
  late AnimationController _scale;
  late AnimationController _opacity;

  void hide() {
    _translationY.animateTo(
      800.0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
    _rotationX.animateTo(
      -1.8,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void show() {
    _translationY.animateTo(
      0.0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );

    _scale.animateTo(
      1.0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );

    _rotationY.animateTo(
      0.0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
    _rotationZ.animateTo(
      0.0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );

    _rotationX.animateTo(
      0.0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );

    _opacity.animateTo(
      1.0,
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeInOut,
    );
  }

  void _quizCtrlUpdate() {
    if (battleController.quizCtrl.transformationCtrl.state == 'show') {
      show();
    }
    if (battleController.quizCtrl.transformationCtrl.state == 'hide') {
      hide();
    }
  }

  @override
  void initState() {
    widget.controller.addListener(_quizCtrlUpdate);

    _translationX = AnimationController.unbounded(vsync: this, value: 0.0);
    _translationY = AnimationController.unbounded(vsync: this, value: 300.0);
    _translationZ = AnimationController.unbounded(vsync: this, value: 0.0);
    _rotationX = AnimationController.unbounded(vsync: this, value: 0.0);
    _rotationY = AnimationController.unbounded(vsync: this, value: 8.0);
    _rotationZ = AnimationController.unbounded(vsync: this, value: -2.0);
    _scale = AnimationController.unbounded(vsync: this, value: 0.3);
    _opacity = AnimationController.unbounded(vsync: this, value: 0.0);

    super.initState();
  }

  @override
  void dispose() {
    widget.controller.removeListener(_quizCtrlUpdate);
    _translationX.dispose();
    _translationY.dispose();
    _translationZ.dispose();
    _rotationX.dispose();
    _rotationY.dispose();
    _rotationZ.dispose();
    _scale.dispose();
    _opacity.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacity,
      child: AnimatedBuilder(
        animation: Listenable.merge([
          _translationX,
          _translationY,
          _translationZ,
          _rotationX,
          _rotationY,
          _rotationZ,
          _scale,
        ]),
        child: widget.child,
        builder: (context, child) {
          return Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..scale(_scale.value)
              ..translate(0.0, _translationY.value, 0.0)
              ..rotateY(_rotationY.value)
              ..rotateZ(_rotationZ.value)
              ..rotateX(_rotationX.value),
            alignment: FractionalOffset.center,
            child: child,
          );
        },
      ),
    );
  }
}

class QuizPresenter extends StatefulWidget {
  const QuizPresenter({Key? key}) : super(key: key);

  @override
  State<QuizPresenter> createState() => _QuizPresenterState();
}

class _QuizPresenterState extends State<QuizPresenter>
    with BattleControllerProviderMixin {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Quiz?>(
      valueListenable: battleController.quizCtrl.currentQuiz,
      builder: (context, quiz, _) {
        if (quiz == null) return const SizedBox();

        return QuizCardSlider(
          controller: battleController.quizCtrl.transformationCtrl,
          child: QuizCard(
            quiz: quiz,
          ),
        );
      },
    );
  }
}

class QuizCard extends StatefulWidget {
  const QuizCard({
    Key? key,
    required this.quiz,
  }) : super(key: key);
  final Quiz quiz;

  @override
  State<QuizCard> createState() => _QuizCardState();
}

class _QuizCardState extends State<QuizCard>
    with SingleTickerProviderStateMixin, BattleControllerProviderMixin {
  late Ticker _ticker;

  int _remaining = 0;

  @override
  void initState() {
    _ticker = createTicker(_onTick)..start();
    super.initState();
  }

  @override
  void dispose() {
    _ticker.stop();
    super.dispose();
  }

  void _onTick(Duration duration) {
    if (battleController.quizCtrl.remainingSeconds != _remaining) {
      setState(() {
        _remaining = battleController.quizCtrl.remainingSeconds;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375.0,
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.0),
      ),
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Image.asset(
                    'assets/png/Icon_ColorIcon_Timer.png',
                    height: 32.0,
                  ),
                ),
                Text(
                  '00:' + '${_remaining}'.padLeft(2, '0'),
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffED4756),
                  ),
                ),
              ],
            ),
          ),

          if (widget.quiz.icon.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Image.network(
                widget.quiz.icon,
                height: 128.0,
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Text(
              widget.quiz.question,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          //

          ValueListenableBuilder<QuizAnswer?>(
              valueListenable: battleController.quizCtrl.selectedOption,
              builder: (context, selectedOption, _) {
                return Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: QuizOption(
                            text: widget.quiz.answers![0],
                            isSelected:
                                selectedOption == widget.quiz.answers![0],
                            isCorrect: widget.quiz.answers![0].isCorrect,
                            onPressed: () {
                              battleController.quizCtrl.selectA();
                            },
                          ),
                        ),
                        Expanded(
                          child: QuizOption(
                            text: widget.quiz.answers![1],
                            isSelected:
                                selectedOption == widget.quiz.answers![1],
                            isCorrect: widget.quiz.answers![1].isCorrect,
                            onPressed: () {
                              battleController.quizCtrl.selectB();
                            },
                          ),
                        ),
                      ].spaceWidgets(8.0),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: QuizOption(
                            text: widget.quiz.answers![2],
                            isSelected:
                                selectedOption == widget.quiz.answers![2],
                            isCorrect: widget.quiz.answers![2].isCorrect,
                            onPressed: () {
                              battleController.quizCtrl.selectC();
                            },
                          ),
                        ),
                        Expanded(
                          child: QuizOption(
                            text: widget.quiz.answers![3],
                            isSelected:
                                selectedOption == widget.quiz.answers![3],
                            isCorrect: widget.quiz.answers![3].isCorrect,
                            onPressed: () {
                              battleController.quizCtrl.selectD();
                            },
                          ),
                        ),
                      ].spaceWidgets(8.0),
                    ),
                  ].spaceWidgets(0.0, 8.0),
                );
              }),
        ],
      ),
    );
  }
}

class QuizOption extends StatelessWidget {
  const QuizOption({
    Key? key,
    required this.text,
    required this.isSelected,
    required this.isCorrect,
    this.onPressed,
  }) : super(key: key);
  final QuizAnswer text;
  final bool isSelected;
  final bool isCorrect;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TouchableScale(
      onPressed: onPressed,
      child: Container(
        height: 48.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: isSelected
              ? (isCorrect ? Colors.greenAccent : Colors.redAccent)
              : const Color(0xffF2F2F2),
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (text.icon.isNotEmpty)
              Padding(
                padding:
                    const EdgeInsets.only(right: 8.0, top: 8.0, bottom: 8.0),
                child: Image.network(text.icon),
              ),
            Text(
              text.value,
              style: const TextStyle(
                fontSize: 16.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
