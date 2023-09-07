import 'package:flutter/material.dart';
import 'package:quiz_basic_app/answer_button.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //We can also wrap Column() with Center but this is also another approach
      width: double.infinity, //this means it'll take as much width as available
      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.center, //align elements to the center
        children: [
          const Text(
            'Questions....',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          AnswerButton(
            answerText:
                'Answer 1', //for positional argument we also have to write parameter used as positional argument
            onTap: () {},
          ),
          AnswerButton(
            answerText: 'Answer 2',
            onTap: () {},
          ),
          AnswerButton(
            answerText: 'Answer 3',
            onTap: () {},
          ),
          AnswerButton(
            answerText: 'Answer 4',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
