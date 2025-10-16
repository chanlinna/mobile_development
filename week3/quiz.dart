class Question {
  final String title;
  final List<String> choices;
  final String goodChoice;

  Question({required this.title, required this.choices, required this.goodChoice});
}
class Answer {
  final String answerChoice;
  final Question question;

  Answer({required this.answerChoice, required this.question});

  bool get isGoodAnswer => answerChoice == question.goodChoice;
}
class Quiz {
  final List<Answer> _answers = [];

  void addAnswer(Answer answer)=> _answers.add(answer);

  int get score => _answers.where((a) => a.isGoodAnswer).length;

  // int getScore(){
  //   int score = 0;
  //   for( var a in _answers){
  //     if(a.isGoodAnswer){
  //       score++;
  //     }
  //   }
  //   return score;
  // }
}

void main() {
  var q1 = Question(
    title: "How many minutes are in a full week?", 
    choices: ["1", "10080", "20050"], 
    goodChoice: "10080"
  );

  var q2 = Question(
    title: "What is 2 + 2?",
    choices: ["3", "4", "5"],
    goodChoice: "4",
  );

  var q3 = Question(
    title: "Which planet has the most moons?",
    choices: ["Jupiter", "Venus", "Saturn"],
    goodChoice: "Saturn",
  );

  var quiz = Quiz();
  var a1 = Answer(question: q1, answerChoice: "10080");
  var a2 = Answer(question: q2, answerChoice: "3");
  var a3 = Answer(answerChoice: "Saturn", question: q3);

  quiz.addAnswer(a1);
  quiz.addAnswer(a2);
  quiz.addAnswer(a3);

  print("Final score: ${quiz.score} / 3");
}
