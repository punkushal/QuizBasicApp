import 'package:flutter/material.dart';
import 'package:quiz_basic_app/data/questions.dart';
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
  var activeScreen = "start-screen";
  List<String> selectedAnswer =
      []; //This variable will contain answers choosed by users

  void switchScreen() {
    //and when switchScreen() called
    // inside of it there's a setState() which changes the value of activeScreen
    //and again build method runs and now StartScreen replaced with QuestionScreen() widget
    setState(() {
      activeScreen = "questions-screen";
    });
  }

  void choosedAnswer(String answer) {
    //this function adds answer to the varible i.e. selectedAnswer
    selectedAnswer.add(answer);
    if (selectedAnswer.length == questions.length) {
      selectedAnswer = [];
      setState(() {
        activeScreen = "start-screen";
      });
    }
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
          child: activeScreen ==
                  "start-screen" //this is another approach to render content conditionally
              ? StartScreen(switchScreen)
              : QuestionScreen(
                  onSelectAnswer:
                      choosedAnswer), //now activeScreen represents the widget after all
        ),
      ),
    );
  }
}
