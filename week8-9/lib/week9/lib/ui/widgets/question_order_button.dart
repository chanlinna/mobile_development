import 'package:flutter/material.dart';

class QuestionOrderButton extends StatelessWidget {
  final int number;
  final bool isCorrect;

  const QuestionOrderButton({
    super.key,
    required this.number,
    required this.isCorrect,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20,
      backgroundColor: isCorrect ? Colors.green : Colors.red,
      child: Text(
        number.toString(),
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
