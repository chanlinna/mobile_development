import 'dart:convert';
import 'dart:io';
import 'package:week8/week9/lib/model/quiz.dart';

class QuizStorage {
  static const _fileName = 'quiz_history.json';
  static File get _file => File(_fileName);

  /// Save list of players to JSON file (synchronous)
  static void savePlayers(List<Player> players) {
    List jsonList = [];
    for (var p in players) {
      List answersList = [];
      for (var a in p.answers) {
        Map questionJson = {
          'title': a.question.title,
          'choices': a.question.choices,
          'goodChoice': a.question.goodChoice,
          'point': a.question.point,
        };
        Map answerJson = {
          'answerChoice': a.answerChoice,
          'question': questionJson,
        };
        answersList.add(answerJson);
      }

      Map playerJson = {
        'playerName': p.playerName,
        'answers': answersList,
      };
      jsonList.add(playerJson);
    }

    _file.writeAsStringSync(jsonEncode(jsonList));
  }

  /// Load list of players from JSON file (synchronous)
  static List<Player> loadPlayers() {
    if (!_file.existsSync()) return [];

    final content = _file.readAsStringSync();
    if (content.isEmpty) return [];

    final jsonList = jsonDecode(content);
    List<Player> players = [];

    for (var pJson in jsonList) {
      Player p = Player(playerName: pJson['playerName']);
      List<Answer> answers = [];

      for (var aJson in pJson['answers']) {
        var qJson = aJson['question'];
        Question q = Question(
          title: qJson['title'],
          choices: List<String>.from(qJson['choices']),
          goodChoice: qJson['goodChoice'],
          point: qJson['point'],
        );
        Answer a = Answer(answerChoice: aJson['answerChoice'], question: q);
        answers.add(a);
      }

      p.answers = answers;
      players.add(p);
    }

    return players;
  }
}
