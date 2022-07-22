import 'dart:convert';
import 'dart:math' as math;

import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

import '../battle/enemy_controller.dart';
import '../battle/player_controller.dart';
import '../models/quiz.dart';

class ScheduledJob extends Comparable<ScheduledJob> {
  final int at;
  final VoidCallback callback;

  ScheduledJob(this.at, this.callback);

  @override
  String toString() => 'ScheduledJob(at: $at, callback: $callback)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ScheduledJob &&
          runtimeType == other.runtimeType &&
          at == other.at &&
          callback == other.callback;

  @override
  int get hashCode => at.hashCode ^ callback.hashCode;

  @override
  int compareTo(ScheduledJob other) => at.compareTo(other.at);
}

class QuizCardTransformationController with ChangeNotifier {
  String state = 'none';

  void show() {
    state = 'show';
    notifyListeners();
  }

  void hide() {
    state = 'hide';
    notifyListeners();
  }
}

class QuizController {
  final BattleController _battleController;
  QuizController(this._battleController);

  final transformationCtrl = QuizCardTransformationController();

  int mystery = 0;

  int duration = 10 * 1000;

  int? startedAt;

  bool didAnswer = false;

  int get remaining {
    if (startedAt == null) {
      return duration;
    }
    return math.max(0, duration - (_battleController.currentTime - startedAt!));
  }

  int get remainingSeconds {
    return (remaining + 999) ~/ 1000;
  }

  void startQuiz(Quiz quiz) {
    mystery++;
    didAnswer = false;
    duration = 10 * 1000;
    startedAt = _battleController.currentTime;
    currentQuiz.value = quiz;
    _battleController.createJobAfter(
      10,
      () {
        transformationCtrl.show();
      },
    );

    final currentQuizId = currentQuiz.value!.id;

    int copyMystery = mystery;

    _battleController.createJobAfter(
      duration,
      () {
        if (copyMystery != mystery) return;
        if (currentQuiz.value?.id == currentQuizId && didAnswer == false) {
          // still the same quiz
          finishQuiz();
        }

        // CHECK IF TIME RAN OUT
        // finishQuiz();
      },
    );
  }

  void updateDuration(int ms) {
    duration += ms;
    mystery++;

    final currentQuizId = currentQuiz.value!.id;

    int copyMystery = mystery;

    _battleController.createJobAfter(
      duration,
      () {
        if (copyMystery != mystery) return;
        if (currentQuiz.value?.id == currentQuizId && didAnswer == false) {
          // still the same quiz
          finishQuiz();
        }

        // CHECK IF TIME RAN OUT
        // finishQuiz();
      },
    );
  }

  void finishQuiz() {
    bool isCorrect = selectedOption.value?.isCorrect ?? false;
    startedAt = null;
    didAnswer = true;
    selectedOption.value = null;
    transformationCtrl.hide();

    // TODO: SHOW CHARACTER ANIMATIONS

    _battleController.createJobAfter(
      1000,
      () {
        if (isCorrect) {
          _battleController.attack();
        } else {
          _battleController.attacked();
        }
      },
    );

    _battleController.createJobAfter(
      2000,
      () {
        _battleController.nextQuiz();
      },
    );
  }

  void selectA() {
    if (selectedOption.value != null) return;
    selectedOption.value = currentQuiz.value!.answers![0];

    _battleController.createJobAfter(
      1000,
      () {
        finishQuiz();
      },
    );
  }

  void selectB() {
    if (selectedOption.value != null) return;
    selectedOption.value = currentQuiz.value!.answers![1];

    _battleController.createJobAfter(
      1000,
      () {
        finishQuiz();
      },
    );
  }

  void selectC() {
    if (selectedOption.value != null) return;
    selectedOption.value = currentQuiz.value!.answers![2];

    _battleController.createJobAfter(
      1000,
      () {
        finishQuiz();
      },
    );
  }

  void selectD() {
    if (selectedOption.value != null) return;
    selectedOption.value = currentQuiz.value!.answers![3];

    _battleController.createJobAfter(
      1000,
      () {
        finishQuiz();
      },
    );
  }

  final ValueNotifier<Quiz?> currentQuiz = ValueNotifier(null);
  final ValueNotifier<QuizAnswer?> selectedOption = ValueNotifier(null);
}

class SingleBoostController {
  final BattleController _battleController;

  final int cooldown;

  final VoidCallback onUse;

  SingleBoostController(this._battleController, this.cooldown, this.onUse);

  int? lastUsedAt;

  int get boostCooldownRemaining {
    if (lastUsedAt == null) return 0;

    int timePassed = _battleController.currentTime - lastUsedAt!;

    return math.max(0, cooldown - timePassed);
  }

  int get cooldownRemainingInSeconds {
    return (boostCooldownRemaining + 999) ~/ 1000;
  }

  double get cooldownProgress => boostCooldownRemaining / cooldown;

  bool get isAvailable {
    if (boostCooldownRemaining == 0) return true;
    return false;
  }

  void use() {
    if (isAvailable && !_battleController.gameEnded) {
      lastUsedAt = _battleController.currentTime;
      onUse();
    }
  }
}

class BattleController {
  final quizList = <Quiz>[];
  int currentQuizIndex = 0;

  Future<void> readMockQuestions() async {
    final assetPath = 'assets/mock_questions.json';
    final String jsonString = await rootBundle.loadString(assetPath);

    final List<dynamic> jsonList = json.decode(jsonString);

    for (int i = 0; i < jsonList.length; i++) {
      final json = jsonList[i];

      // Skip drag & drop question for now

      if (json['type'] == 'dd') continue;
      quizList.add(Quiz.fromJson('MOCK_QUIZ_$i', jsonList[i]));
    }
  }

  late Ticker _ticker;

  late SingleBoostController boost1, boost2, boost3;
  final PlayerController playerController = PlayerController();
  final EnemyController enemyController = EnemyController();
  final jobQueue = PriorityQueue<ScheduledJob>();

  int? matchStartedAt;
  int currentTime = 0;

  final screenCtrl = BattleScreenController();
  late QuizController quizCtrl;

  BattleController(TickerProvider tickerProvider) {
    // ignore: avoid_print
    print("Battle Controller initialized: $tickerProvider");
    _ticker = tickerProvider.createTicker(_onTick)..start();
    boost1 = SingleBoostController(this, 10000, () => heal());
    boost2 = SingleBoostController(this, 14000, () => increaseQuizTime());
    boost3 = SingleBoostController(this, 1000, () => attack());
    quizCtrl = QuizController(this);

    readMockQuestions().then((value) => startMatch());
  }

  void increaseQuizTime() {
    // nextQuiz();
    quizCtrl.updateDuration(5000);
  }

  void heal() {
    playerController.hpNotifier.value = math.min(
      playerController.hpNotifier.value + 10,
      playerController.maxHp,
    );
  }

  bool gameEnded = false;

  void win() {
    gameEnded = true;
    screenCtrl.showWin();
    enemyController.sad();
    playerController.dance();
  }

  void lose() {
    gameEnded = true;
    screenCtrl.showLose();
    playerController.sad();
  }

  void dispose() {
    _ticker.stop();
    screenCtrl.dispose();
  }

  void nextQuiz() {
    // check HP.
    if (playerController.hpNotifier.value <= 0) {
      lose();
      return;
    }
    if (enemyController.hpNotifier.value <= 0) {
      win();
      return;
    }

    currentQuizIndex = (currentQuizIndex + 1) % quizList.length;
    quizCtrl.startQuiz(quizList[currentQuizIndex]);
  }

  void _onTick(Duration duration) => update(duration.inMilliseconds);

  void update(int ms) {
    currentTime = ms;

    while (jobQueue.isNotEmpty) {
      final ScheduledJob job = jobQueue.first;
      if (job.at > currentTime) {
        break;
      }
      jobQueue.remove(job);
      job.callback();
    }
  }

  void startMatch() {
    matchStartedAt = currentTime;

    announceMatch();
  }

  void createJobAt(int at, VoidCallback callback) {
    jobQueue.add(ScheduledJob(at, callback));
  }

  void createJobAfter(int ms, VoidCallback callback) {
    createJobAt(currentTime + ms, callback);
  }

  void announceMatch() {
    createJobAfter(
      0,
      () => screenCtrl.announcerCtrl.start3(),
    );
    createJobAfter(
      1000,
      () => screenCtrl.announcerCtrl.start2(),
    );
    createJobAfter(
      2000,
      () => screenCtrl.announcerCtrl.start1(),
    );
    createJobAfter(
      3000,
      () => screenCtrl.announcerCtrl.fight(),
    );
    createJobAfter(
      4000,
      () {
        screenCtrl.announcerCtrl.end();
        screenCtrl.controlPanelCtrl.show();
        quizCtrl.startQuiz(quizList[currentQuizIndex]);
      },
    );
  }

  void attack() {
    playerController.attack();
    Future.delayed(
      const Duration(milliseconds: 200),
      () => enemyController.getHit(),
    );
  }

  void attacked() {
    enemyController.attack();
    Future.delayed(
      const Duration(milliseconds: 200),
      () => playerController.getHit(),
    );
  }

  // Control boosts

}

class BattleScreenController {
  final controlPanelCtrl = ControlPanelController();
  final announcerCtrl = AnnouncerController();

  ValueNotifier<String?> endGameMessage = ValueNotifier(null);

  void showWin() {
    endGameMessage.value = 'You win!';
  }

  void showLose() {
    endGameMessage.value = 'You lose!';
  }

  void dispose() {
    controlPanelCtrl.dispose();
    announcerCtrl.dispose();
  }
}

class QuizPresentationController {
  //

}

enum AnnouncerState {
  hidden,
  ready,
  start3,
  start2,
  start1,
  fight,
  end,

  win,
  lose,
}

class AnnouncerController {
  final ValueNotifier<AnnouncerState> currentStateNotifier =
      ValueNotifier<AnnouncerState>(
    AnnouncerState.hidden,
  );

  void dispose() {
    currentStateNotifier.dispose();
  }

  void ready() => currentStateNotifier.value = AnnouncerState.ready;
  void start3() => currentStateNotifier.value = AnnouncerState.start3;
  void start2() => currentStateNotifier.value = AnnouncerState.start2;
  void start1() => currentStateNotifier.value = AnnouncerState.start1;
  void fight() => currentStateNotifier.value = AnnouncerState.fight;
  void end() => currentStateNotifier.value = AnnouncerState.end;
}

class ControlPanelController {
  final ValueNotifier<bool> visibilityNotifier = ValueNotifier(false);

  void dispose() {
    visibilityNotifier.dispose();
  }

  void show() {
    visibilityNotifier.value = true;
  }

  void hide() {
    visibilityNotifier.value = false;
  }
}
