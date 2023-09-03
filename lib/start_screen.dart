import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min, //center the widgets vertically
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color:
                const Color.fromARGB(150, 255, 255, 255), //adding transparency
          ),
          const SizedBox(
            height: 50,
          ),
          const Text(
            'Learn Flutter The Fun Way!',
            style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255), fontSize: 24),
          ),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor:
                  Colors.white, //set color to the text used inside the button
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('Start Quiz'),
          ),
        ],
      ),
    );
  }
}
