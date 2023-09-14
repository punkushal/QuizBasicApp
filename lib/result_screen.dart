import 'package:flutter/material.dart';
import 'package:quiz_basic_app/data/questions.dart';
import 'package:quiz_basic_app/question_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.chosenAnswer});
  //This is answers list selected by user
  final List<String> chosenAnswer;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summaryData = [];

    for (var i = 0; i < chosenAnswer.length; i++) {
      //To create map we use curly brackets inside add()
      summaryData.add(
        {
          'question-index': i,
          'question': questions[i].questionText,
          'correct-answer': questions[i].answers[0],
          'user-answer': chosenAnswer[i],
        },
      );
    }
    return summaryData;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('You answered X out of Y questions correctly!'),
          const SizedBox(
            height: 20,
          ),
          QuestionSummary(
            getSummaryData(),
          ),
          const SizedBox(
            height: 20,
          ),
          TextButton(
            onPressed: () {},
            child: const Text('Restart Quiz'),
          ),
        ],
      ),
    );
  }
}
