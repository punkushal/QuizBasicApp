import 'package:flutter/material.dart';
import 'package:quiz_basic_app/data/questions.dart';
import 'package:quiz_basic_app/question_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.chosenAnswer, required this.onRestart});
  //This is answers list selected by user
  final List<String> chosenAnswer;
  final void Function() onRestart;

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
    final summaryData = getSummaryData();
    final totalQuestions = questions.length;
    //In where() if the condition is met correctly
    //then it will added otherwise droped down
    //and here we need number of correctAnswers that's why used lenth()
    final totalCorrectAnswers = summaryData.where((data) {
      return data['user-answer'] == data['correct-answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'You answered $totalCorrectAnswers out of $totalQuestions questions correctly!',
            style: const TextStyle(
                color: Color.fromARGB(255, 196, 138, 213),
                fontSize: 20,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          QuestionSummary(
            summaryData,
          ),
          const SizedBox(
            height: 20,
          ),
          TextButton.icon(
            onPressed: onRestart,
            icon: const Icon(Icons.restart_alt),
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            label: const Text('Restart Quiz'),
          ),
        ],
      ),
    );
  }
}
