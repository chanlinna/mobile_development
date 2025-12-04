import 'package:flutter/material.dart';
import 'package:week8/week9/lib/model/quiz.dart';
import 'package:week8/week9/lib/ui/widgets/app_button.dart';
 
class QuestionScreen extends StatefulWidget {
  final Quiz quiz;
  final VoidCallback onQuizEnd;
  const QuestionScreen({super.key, required this.quiz, required this.onQuizEnd});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int index = 0;

  void selectAnswer(String choice) {
    final question = widget.quiz.questions[index];

    widget.quiz.addAnswerToCurrentPlayer(choice, question);

    if (index < widget.quiz.questions.length - 1) {
      setState(() {
        index++;
      });
    } else {
      widget.onQuizEnd();
    }
  } 

  @override
  Widget build(BuildContext context) {
    final question = widget.quiz.questions[index];

    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              question.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 40),

            ...question.choices.map((c) => Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: AppButton(c, onTap: () => selectAnswer(c)),
            ))           
          ],
        ),
      ),
    );
  }
}
 