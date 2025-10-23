import 'dart:convert';
import 'dart:io';
import '../domain/quiz.dart';

class QuizRepository {
  final String filePath;

  QuizRepository(this.filePath);

  Quiz readQuiz() {
    final file = File(filePath);
    final content = file.readAsStringSync();
    final data = jsonDecode(content);

    // Map JSON to domain objects
    var questionsJson = data['questions'] as List;
    var questions = questionsJson.map((q) {
      return Question(
        id: q['id'],
        title: q['title'],
        choices: List<String>.from(q['choices']), 
        goodChoice: q['goodChoice'],
        points: q['points'],
      );
    }).toList();

    Quiz quiz = Quiz(
      id: data['id'],
      questions: questions,
    );

    if (data['players'] != null) {
      var playersJson = data['players'] as List;
      for (var p in playersJson) {
        Player player = Player(
          id: p['id'],
          name: p['name'],
        );

        if (p['answers'] != null) {
          var answersJson = p['answers'] as List;
          for (var a in answersJson) {
            Answer answer = Answer(
              id: a['id'],
              questionId: a['questionId'],
              answerChoice: a['answerChoice'],
            );
            player.addAnswer(answer);
          }
        }

        quiz.addPlayer(player);
      }
    }
    return quiz;
  }

  void writeQuiz(Quiz quiz){
    final Map<String, dynamic> data = {
      'id': quiz.id,
      'questions': quiz.questions.map((q) => {
        'id': q.id,
        'title': q.title,
        'choices': q.choices,
        'goodChoice': q.goodChoice,
        'points': q.points,
      }).toList(),
      'players': quiz.players.map((p) => {
        'id': p.id,
        'name': p.name,
        'answers': p.answers.map((a) => {
          'id': a.id,
          'questionId': a.questionId,
          'answerChoice': a.answerChoice,
        }).toList(),
      }).toList(),
    };

    final jsonString = JsonEncoder.withIndent('  ').convert(data);

    // Write to file
    final file = File(filePath);
    file.writeAsStringSync(jsonString);
  }
}