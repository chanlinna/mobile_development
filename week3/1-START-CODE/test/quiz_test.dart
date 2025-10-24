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

  test('players added to quiz', () {
    Player p1 = Player(name: "Linna");
    Player p2 = Player(name: "Liza");
    Player p3 = Player(name: "Veysean");

    // Linna gets all correct
    p1.answers = [
      Answer(questionId: q1.id, answerChoice: "Paris"),
      Answer(questionId: q2.id, answerChoice: "4"),
    ];

    // Liza gets one wrong
    p2.answers = [
      Answer(questionId: q1.id, answerChoice: "London"),
      Answer(questionId: q2.id, answerChoice: "4"),
    ];

    // Veysean gets all wrong
    p3.answers = [
      Answer(questionId: q1.id, answerChoice: "Rome"),
      Answer(questionId: q2.id, answerChoice: "5"),
    ];

    quiz.addPlayer(p1);
    quiz.addPlayer(p2);
    quiz.addPlayer(p3);

    expect(quiz.players.length, equals(3));
    expect(quiz.players[0].getScoreInPoint(quiz.questions), equals(60)); 
    expect(quiz.players[1].getScoreInPoint(quiz.questions), equals(50)); 
    expect(quiz.players[2].getScoreInPoint(quiz.questions), equals(0));
  });

    test('create new player or overwrite the exist one', () {
    Quiz quiz2 = Quiz(questions: [q1, q2]);

    //create new player
    Player p1 = quiz2.checkPlayer("Linna");
    expect(quiz2.players.length, equals(1));
    expect(p1.name, equals("Linna"));

    // same name
    Player same = quiz2.checkPlayer("Linna");
    expect(quiz2.players.length, equals(1)); 
    expect(same.id, equals(p1.id));

    //Check if answers are cleared when the same player play again
    p1.addAnswer(Answer(questionId: q1.id, answerChoice: "Paris"));
    expect(p1.answers.isNotEmpty, isTrue);
    Player again = quiz2.checkPlayer("Linna");
    expect(again.answers.isEmpty, isTrue);
  });


  
}