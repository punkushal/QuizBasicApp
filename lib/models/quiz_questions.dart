//this file contains blue print for my questions
class QuizQuestions {
  final String questionText;
  final List<String> answers;
//const QuizQuestions because for this app i have fixed question and answer that's why used it
  const QuizQuestions(this.questionText, this.answers);

  List<String> getShuffledAnswer() {
    //this copies the string list of answers and assign to shuffledList
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}
