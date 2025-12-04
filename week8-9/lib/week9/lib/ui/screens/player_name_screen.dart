import 'package:flutter/material.dart';
import 'package:week8/week9/lib/model/quiz.dart';
import 'package:week8/week9/lib/ui/widgets/app_button.dart';

class PlayerNameScreen extends StatefulWidget {
  final Quiz quiz;
  final VoidCallback onNameEntered;

  const PlayerNameScreen({super.key, required this.quiz, required this.onNameEntered});

  @override
  State<PlayerNameScreen> createState() => _PlayerNameScreenState();
}

class _PlayerNameScreenState extends State<PlayerNameScreen> {
  final TextEditingController controller = TextEditingController();

  void submit() {
    if (controller.text.isEmpty) return;

    widget.quiz.players.add(Player(playerName: controller.text));
    widget.onNameEntered();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Enter Your Name",
              style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            Container(
              width: 300,
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Your name",
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            const SizedBox(height: 30),

            AppButton("Start Quiz", onTap: submit),
          ],
        ),
      ),
    );
  }
}
