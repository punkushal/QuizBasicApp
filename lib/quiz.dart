import 'package:flutter/material.dart';
import 'package:quiz_basic_app/data/questions.dart';
import 'package:quiz_basic_app/question_screen.dart';
import 'package:quiz_basic_app/result_screen.dart';
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
      setState(() {
        activeScreen = "result-screen";
      });
    }
  }

  @override
  Widget build(context) {
    Widget switchWidget = StartScreen(switchScreen);
    if (activeScreen == 'questions-screen') {
      switchWidget = QuestionScreen(onSelectAnswer: choosedAnswer);
    }
    if (activeScreen == 'result-screen') {
      switchWidget = ResultScreen(
        chosenAnswer: selectedAnswer,
      );
    }
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
          child: switchWidget,
        ),
      ),
    );
  }
}
