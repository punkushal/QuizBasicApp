import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
          Text(
            'Learn Flutter The Fun Way!',
            style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 255, 255, 255), fontSize: 24),
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
