import 'package:my_first_project/data/quiz_repository.dart';
import 'domain/quiz.dart';
import 'ui/quiz_console.dart';

void main() {
  QuizRepository repo = QuizRepository('data/quiz_data.json');

  //read
  Quiz quiz = repo.readQuiz();

  QuizConsole console = QuizConsole(quiz: quiz);
  console.startQuiz();

  //write
  repo.writeQuiz(quiz);
}
