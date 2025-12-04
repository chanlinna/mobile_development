import 'package:flutter/material.dart';
import 'package:week8/week9/lib/ui/widgets/app_button.dart';

 class WelcomeScreen extends StatelessWidget {
  final VoidCallback onStart;
  const WelcomeScreen({super.key, required this.onStart});
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset('assets/week9/quiz-logo.png', width: 500),
            const SizedBox(height: 30,),
            //ElevatedButton(onPressed: (){print("Button pressed");}, child: const Text('get startes'))
            AppButton('Start Quiz', onTap: onStart)
          ],
        ),
      ),
    );
  }
}
 
