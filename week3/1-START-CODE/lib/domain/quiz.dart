import 'package:uuid/uuid.dart';

var uuid = Uuid();

class Question{
  final String id;
  final String title;
  final List<String> choices;
  final String goodChoice;
  final int points;

  Question({String? id, required this.title, required this.choices, required this.goodChoice, this.points = 1}): id = id ?? uuid.v4();
}

class Player {
  final String id;
  final String name;
  List <Answer> answers =[];

  Player({String? id, required this.name}): id = id ?? uuid.v4();

  void addAnswer(Answer asnwer) {
     this.answers.add(asnwer);
  }

  int getScoreInPercentage(List<Question> questions){
    int totalScore =0;
    for(Answer answer in answers){
      var q = questions.firstWhere((q) => q.id == answer.questionId);
      if (answer.isGood(q)){ 
        totalScore++;
      }
    }
    return ((totalScore/ questions.length)*100).toInt();

  }

  int getScoreInPoint(List<Question> questions){
    int totalScore =0;
    for(Answer answer in answers){
      var q = questions.firstWhere((q) => q.id == answer.questionId);
      if (answer.isGood(q)) {
        totalScore += q.points;
      }
    }
    return totalScore;

  }
}

class Answer{
  final String id;
  final String questionId;
  final String answerChoice;
  

  Answer({String? id, required this.questionId, required this.answerChoice}): id = id?? uuid.v4();

  bool isGood(Question question){
    return this.answerChoice == question.goodChoice;
  }
}

class Quiz{
  final String id;
  List<Player> players = [];
  List<Question> questions;

  Quiz({String? id, required this.questions}): id = id ?? uuid.v4();

  void addPlayer(Player player) {
    players.add(player);
  }

  Question? getQuestionById(String id) {
    return questions.firstWhere((q) => q.id == id, orElse: () => Question(
      id: 'not-found',
      title: 'Question not found',
      choices: [],
      goodChoice: '',
    ));
  }

  Answer? getAnswerById(String id) {
    for (var player in players) {
      for (var answer in player.answers) {
        if (answer.id == id){
         return answer;
        }
      }
    }
    return null;
  }

  void showAllScores() {
    for (var player in players) {
      print('Player:${player.name}            Score:${player.getScoreInPoint(questions)}');
    }
  }
  
}