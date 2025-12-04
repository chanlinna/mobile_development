import 'package:flutter/material.dart';

class ChoiceTile extends StatelessWidget {
  final String choice;
  final bool isUserChoice;
  final bool isCorrectChoice;

  const ChoiceTile({
    super.key,
    required this.choice,
    required this.isUserChoice,
    required this.isCorrectChoice,
  });

  @override
  Widget build(BuildContext context) {
    Color background = Colors.white;
    if (isUserChoice) {
      background = isCorrectChoice ? Colors.green : Colors.red;
    }

    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          if (isCorrectChoice)
            const Icon(Icons.check, color: Colors.black)
          else
            const SizedBox(width: 24),
          const SizedBox(width: 8),
          Text(
            choice,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
