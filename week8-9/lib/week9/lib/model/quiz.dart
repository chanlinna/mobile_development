 
import 'package:week8/week9/lib/model/answer.dart';
import 'package:week8/week9/lib/model/player.dart';
import 'package:week8/week9/lib/model/question.dart';

class Quiz {
  final List<Question> questions;
  List<Player> players = [];

  Quiz({required this.questions});

  Player get currentPlayer => players.last;

  void addAnswerToCurrentPlayer(String choice, Question question) {
    currentPlayer.answers.add(Answer(answerChoice: choice, question: question));
  }

}