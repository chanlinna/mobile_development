import 'package:flutter/material.dart';
import 'package:week8/week9/lib/data/repositories/quiz_mock_repository.dart';
import 'package:week8/week9/lib/ui/quiz_app.dart';
 
void main() {
  final quiz = QuizData().loadQuiz();
  runApp(QuizApp(quiz: quiz,));
}