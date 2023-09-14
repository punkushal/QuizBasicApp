import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});
  //This gets Map values from ResultScreen()
  final List<Map<String, Object>> summaryData;
  @override
  Widget build(BuildContext context) {
    return Column(
      //Now children wants list of widgets
      //But we already hava list of Map inside summaryData
      //So we can convert this Map list to list of Widgets
      //using map()
      //While adding this function, we get an error
      //Saying that iterable type object can't be assigned to list
      //To fix this problem we use toList() now we generate list of Row()
      //Here as int => typecasting and toString() is to convert into string
      children: summaryData.map((data) {
        return Row(
          children: [
            Text(
              ((data['question-index'] as int) + 1).toString(),
            ),
          ],
        );
      }).toList(),
    );
  }
}
