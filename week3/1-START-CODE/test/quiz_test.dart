import 'package:my_first_project/domain/quiz.dart';
import 'package:test/test.dart';

main() {
  // Create 2 questions and the quiz
  Question q1 =
      Question(title: "Capital of France?", choices: ["Paris", "London", "Rome"], goodChoice: "Paris", points: 10);

  Question q2 =
      Question(title: "2+2", choices: ["2", "4", "5"], goodChoice: "4", points: 50);

  Quiz quiz = Quiz(questions: [q1, q2]);
  Player p1 = Player(name: "Linna");

  test('All answers are good (100%)', () {
    // Create the answer here
    Answer a1 = Answer(questionId: q1.id, answerChoice: "Paris");
    Answer a2 = Answer(questionId: q2.id, answerChoice: "4");

    p1.answers = [a1, a2];

    // Check something
    expect(p1.getScoreInPercentage(quiz.questions), equals(100));
    expect(p1.getScoreInPoint(quiz.questions), equals(60));
  });

  test('All answers are fault (0%)', () {
    // Create the answer here
    Answer a1 = Answer(questionId: q1.id, answerChoice: "Rome");
    Answer a2 = Answer(questionId: q2.id, answerChoice: "2");

    p1.answers = [a1, a2];

    // Check something
    expect(p1.getScoreInPercentage(quiz.questions), equals(0));
    expect(p1.getScoreInPoint(quiz.questions), equals(0));
  });

  test('One answer is fault (50%)', () {
    // Create the answer here
    Answer a1 = Answer(questionId: q1.id, answerChoice: "Paris");
    Answer a2 = Answer(questionId: q2.id, answerChoice: "5");

    p1.answers = [a1, a2];

    // Check something
    expect(p1.getScoreInPercentage(quiz.questions), equals(50));
    expect(p1.getScoreInPoint(quiz.questions), equals(10));
  });

  
}