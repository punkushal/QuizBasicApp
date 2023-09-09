import 'package:flutter/material.dart';
import 'package:quiz_basic_app/answer_button.dart';
import 'package:quiz_basic_app/data/questions.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  final currentQuestion =
      questions[0]; //used to assign first question with their list of answers
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //We can also wrap Column() with Center but this is also another approach
      width: double.infinity, //this means it'll take as much width as available
      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.center, //align elements to the center
        children: [
          Text(
            currentQuestion.questionText,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          //Here we convert values of List<String>answers to another value
          // i.e. list of answer changes to list of button
          //Here the function inside map takes individual answer for each button which automatically performed by dart
          //...=> works to make list of answerbutton as individual button separated with commas
          ...currentQuestion.answers.map((answer) {
            return AnswerButton(answerText: answer, onTap: () {});
          }),
        ],
      ),
    );
  }
}
