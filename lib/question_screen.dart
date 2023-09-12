import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_basic_app/answer_button.dart';
import 'package:quiz_basic_app/data/questions.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer)
      onSelectAnswer; //this function will take choosedAnswer() from quiz.dart's QuestionScreen()
  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;
  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    //used to assign first question with their list of answers
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      //We can also wrap Column() with Center but this is also another approach
      width: double.infinity, //this means it'll take as much width as available
      child: Container(
        //Wrapping Column() with Container to use margin property
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, //align elements to the center
          crossAxisAlignment: CrossAxisAlignment
              .stretch, //Stretch elements inside Column() as much as available width
          children: [
            Text(
              currentQuestion.questionText,
              style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 188, 146, 242),
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center, //To center the text
            ),
            const SizedBox(
              height: 30,
            ),
            //Here we convert values of List<String>answers to another value
            // i.e. list of answer changes to list of button
            //Here the function inside map takes individual answer for each button which automatically performed by dart
            //...=> works to make list of answerbutton as individual button separated with commas
            ...currentQuestion.getShuffledAnswer().map((answer) {
              return AnswerButton(
                  answerText: answer,
                  onTap: () {
                    answerQuestion(answer);
                  });
            }),
          ],
        ),
      ),
    );
  }
}
