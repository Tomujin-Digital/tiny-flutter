import 'package:flutter/widgets.dart';

class Quiz {
  final String id;
  final String question;
  final String type;
  final List<QuizAnswer>? answers;

  final String icon;

  Quiz({
    required this.id,
    required this.type,
    required this.icon,
    required this.question,
    this.answers,
  });

  factory Quiz.fromJson(String id, Map<String, dynamic> json) {
    return Quiz(
      id: id,
      type: json['type'] as String,
      icon: json['icon'] as String,
      question: json['question'] as String,
      answers: (json['answers'] as List<dynamic>?)
          ?.map((e) => QuizAnswer.fromJson(e as Map<String, dynamic>))
          ?.toList(),
    );
  }
}

class QuizAnswer {
  final String icon;
  final String value;
  final bool isCorrect;

  QuizAnswer(this.icon, this.value, this.isCorrect);

  factory QuizAnswer.fromJson(Map<String, dynamic> json) {
    return QuizAnswer(
      json['icon'] as String,
      json['value'] as String,
      json['isCorrect'] as bool,
    );
  }
}
