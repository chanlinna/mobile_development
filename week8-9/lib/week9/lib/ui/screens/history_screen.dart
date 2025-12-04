import 'package:flutter/material.dart';
import 'package:week8/week9/lib/model/quiz.dart';

class HistoryScreen extends StatelessWidget {
  final Quiz quiz;
  final VoidCallback onBack;

  const HistoryScreen({
    super.key,
    required this.quiz,
    required this.onBack
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text("Player History"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: onBack,
        ),
      ),
      body: Column(
        children: [
          const Text('History screen is not done', style: TextStyle(color: Colors.white),),
          Expanded(
            child: ListView.builder(
              itemCount: quiz.players.length,
              itemBuilder: (context, i) {
                final p = quiz.players[i];
                return ListTile(
                  leading: CircleAvatar(child: Text((i + 1).toString())),
                  title: Text(p.playerName),
                  subtitle: Text("Score: ${p.score} / ${quiz.questions.length}"),
                );
              },
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
