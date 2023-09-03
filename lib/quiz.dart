import 'package:flutter/material.dart';
import 'package:quiz_basic_app/question_screen.dart';
import 'package:quiz_basic_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen; //? this means activeScreen can be null or widget

  @override
  void initState() {
    //this initState() tells that the variabel will be initialized at later stage so no erro throws
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  void switchScreen() {
    //and when switchScreen() called
    // inside of it there's a setState() which changes the value of activeScreen
    //and again build method runs and now StartScreen replaced with QuestionScreen() widget
    setState(() {
      activeScreen = const QuestionScreen();
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 124, 12, 198),
                Color.fromARGB(255, 129, 16, 152),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child:
              activeScreen, //now activeScreen represents the widget after all
        ),
      ),
    );
  }
}
