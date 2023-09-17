import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_basic_app/questionSummary/question_number.dart';

class QuestionAnswerList extends StatelessWidget {
  const QuestionAnswerList(this.dataItem, {super.key});
  final Map<String, Object> dataItem;
  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer =
        dataItem['user-answer'] == dataItem['correct-answer'];
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuestionNumber(
            questionIndex: dataItem['question-index'] as int,
            isCorrectAnswer: isCorrectAnswer),
        const SizedBox(
          width: 30,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                dataItem['question'] as String,
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                dataItem['user-answer'] as String,
                style: const TextStyle(
                  color: Color.fromARGB(255, 227, 110, 216),
                ),
              ),
              Text(
                dataItem['correct-answer'] as String,
                style: const TextStyle(
                  color: Color.fromARGB(255, 84, 195, 74),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
