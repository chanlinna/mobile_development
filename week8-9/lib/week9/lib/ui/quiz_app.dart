import 'package:flutter/material.dart';
import 'package:week8/week9/lib/data/repositories/quiz_mock_repository.dart';
import 'package:week8/week9/lib/model/quiz.dart';
import 'package:week8/week9/lib/ui/screens/history_screen.dart';
import 'package:week8/week9/lib/ui/screens/player_name_screen.dart';
import 'package:week8/week9/lib/ui/screens/question_screen.dart';
import 'package:week8/week9/lib/ui/screens/result_screen.dart';
import 'package:week8/week9/lib/ui/screens/welcome_screen.dart';

enum QuizScreenType {
  welcome,
  playerName,
  question,
  result,
  history,
}
 
class QuizApp extends StatefulWidget {
  final Quiz quiz;
  const QuizApp( {super.key, required this.quiz});


  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  late Quiz quiz;
  QuizScreenType currScreen = QuizScreenType.welcome;

  @override
  void initState() {
    super.initState();
    quiz = widget.quiz;
  }

  void goToPlayerNameScreen() {
    setState(() => currScreen = QuizScreenType.playerName);
  }

  void goToQuestionScreen() {
    setState(() => currScreen = QuizScreenType.question);
  }

  void goToResultScreen() {
    setState(() => currScreen = QuizScreenType.result);
  }

  void goToHistoryScreen() {
    setState(() => currScreen = QuizScreenType.history);
  }

  void restartQuiz() {
    setState(() {
      quiz = QuizData().loadQuiz();
      currScreen = QuizScreenType.welcome;
    });
  }

  Widget buildScreen() {
    switch (currScreen) {
      case QuizScreenType.welcome:
        return WelcomeScreen(onStart: goToPlayerNameScreen);

      case QuizScreenType.playerName:
        return PlayerNameScreen(quiz: quiz, onNameEntered: goToQuestionScreen);

      case QuizScreenType.question:
        return QuestionScreen(quiz: quiz, onQuizEnd: goToResultScreen);

      case QuizScreenType.result:
        return ResultScreen(
          quiz: quiz,
          onRestart: restartQuiz,
          onViewHistory: goToHistoryScreen,
        );

      case QuizScreenType.history:
        return HistoryScreen(
          quiz: quiz,
          onBack: goToResultScreen
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: buildScreen(),
    );
  }
}
