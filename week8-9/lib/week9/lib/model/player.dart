import 'package:week8/week9/lib/model/answer.dart';

class Player {
  final String playerName;
  List<Answer> answers = [];

  Player({required this.playerName});

  int get score => answers.where((a) => a.isCorrect).length;
}