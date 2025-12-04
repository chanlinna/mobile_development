 
class Quiz {
  final List<Question> questions;
  List<Player> players = [];

  Quiz({required this.questions});

  Player get currentPlayer => players.last;

  void addAnswerToCurrentPlayer(String choice, Question question) {
    currentPlayer.answers.add(Answer(answerChoice: choice, question: question));
  }

}

class Question {
  final String title;
  final List<String> choices;
  final String goodChoice;
  final int point;

  Question({required this.title, required this.choices, required this.goodChoice, this.point = 1});
}

class Answer {
  final String answerChoice;
  final Question question;

  Answer({required this.answerChoice, required this.question});

  bool get isCorrect => answerChoice == question.goodChoice;
  int get points => isCorrect ? question.point : 0;
}

class Player {
  final String playerName;
  List<Answer> answers = [];

  Player({required this.playerName});

  int get score => answers.where((a) => a.isCorrect).length;
}