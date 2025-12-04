import 'package:week8/week9/lib/model/quiz.dart';

class QuizData {
  Quiz loadQuiz() {
    final questions = [
      Question(
        title: "Who is the best teacher?",
        choices: ["Hongly", "Ronan", "Leangsiv"],
        goodChoice: "Ronan",
      ),
      Question(
        title: "What is the best color",
        choices: ["Blue", "Red", "Green"],
        goodChoice: "Red",
      ),
    ];
    
    return Quiz(questions: questions);
  }
}