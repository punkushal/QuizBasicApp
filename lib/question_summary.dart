import 'package:flutter/material.dart';
import 'package:quiz_basic_app/questionSummary/question_answer_list.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});
  //This gets Map values from ResultScreen()
  final List<Map<String, Object>> summaryData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //To fix the height of the content
      //But doing that content is overflowed to fix this problem
      //We use another widget provided by dart called SingleChildScrollView
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          //Now children wants list of widgets
          //But we already hava list of Map inside summaryData
          //So we can convert this Map list to list of Widgets
          //using map()
          //While adding this function, we get an error
          //Saying that iterable type object can't be assigned to list
          //To fix this problem we use toList() now we generate list of Row()
          //Here as int => typecasting and toString() is to convert into string
          children: summaryData.map((data) {
            return QuestionAnswerList(data);
          }).toList(),
        ),
      ),
    );
  }
}
