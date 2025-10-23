import 'dart:io';

import '../domain/quiz.dart';

class QuizConsole {
  Quiz quiz;

  QuizConsole({required this.quiz});

  void startQuiz() {
    print('--- Welcome to the Quiz ---\n');
    while(true){
      stdout.write("Your name: ");
      String? playerName = stdin.readLineSync();

      if(playerName == null || playerName.isEmpty){
        print("--- Quiz Finished ---");
        return;
      }

      Player? player;

      for(var p in quiz.players){
        if(p.name == playerName){
          player = p;
          p.answers.clear();
          break;
        }
      }

      if (player == null) {
        player = Player(name: playerName);
        quiz.addPlayer(player);
      }

      for (var question in quiz.questions) {
        print('Question: ${question.title} - (${question.points} points)');
        print('Choices: ${question.choices}');
        stdout.write('Your answer: ');
        String? userInput = stdin.readLineSync();

        // Check for null input
        if (userInput != null && userInput.isNotEmpty) {
          Answer answer = Answer(questionId: question.id, answerChoice: userInput);
          player.addAnswer(answer);
        } else {
          print('No answer entered. Skipping question.');
          Answer answer = Answer(questionId: question.id, answerChoice: '');
          player.addAnswer(answer);
        }

        print('');
      }

      print('$playerName, your score in percentage: ${player.getScoreInPercentage(quiz.questions)} %');
      print('$playerName, your score in points: ${player.getScoreInPoint(quiz.questions)}');
      print("\n");
      quiz.showAllScores();
    }
  }
}
 