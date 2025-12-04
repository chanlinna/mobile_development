import 'package:week8/week9/lib/model/question.dart';

class Answer {
  final String answerChoice;
  final Question question;

  Answer({required this.answerChoice, required this.question});

  bool get isCorrect => answerChoice == question.goodChoice;
  int get points => isCorrect ? question.point : 0;
}