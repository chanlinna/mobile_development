import 'package:flutter/material.dart';
import 'package:week8/week9/lib/model/quiz.dart';
import 'package:week8/week9/lib/ui/widgets/app_button.dart';
import 'package:week8/week9/lib/ui/widgets/choice_tile.dart';
import 'package:week8/week9/lib/ui/widgets/question_order_button.dart';

class ResultScreen extends StatelessWidget {
  final Quiz quiz;
  final VoidCallback onRestart;
  final VoidCallback onViewHistory;

  const ResultScreen({super.key, required this.quiz, required this.onRestart, required this.onViewHistory});

  @override
  Widget build(BuildContext context) {
    final player = quiz.currentPlayer;
    
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 40),
              const Text(
                "Your Answers",
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              //here we loop through all questions
              //List.generate creates a list of widgets dynamically.
              //The first argument is the number of items (quiz.questions.length)
              //The second argument is a function that returns a widget for each index
              //so for each question, we generate a Column containing the question and its choices :))
              ...List.generate(quiz.questions.length, (i) {
                final question = quiz.questions[i];
                final answer = player.answers[i];
                final isCorrect = answer.isCorrect;

                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 18.0,
                    horizontal: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          QuestionOrderButton(
                            number: i + 1,
                            isCorrect: isCorrect,
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              question.title,
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 12),

                      // All choices (here i use resuable widget ChoiceTile to generate all the choice)
                      ...question.choices.map((choice) => ChoiceTile(
                        choice: choice,
                        isUserChoice: choice == answer.answerChoice,
                        isCorrectChoice: choice == question.goodChoice,
                      )),
                    ],
                  ),
                );
              }),

              const SizedBox(height: 30),

              AppButton('Restart Quiz', onTap: onRestart),

              const SizedBox(height: 15),

              AppButton('View History', onTap: onViewHistory)
            ],
          ),
        ),
      ),
    );
  }
}
 