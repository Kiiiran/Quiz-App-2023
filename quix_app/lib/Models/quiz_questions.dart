class QuizQuestion {
  QuizQuestion(this.text, this.answeres);
  final String text;
  final List<String> answeres;

  List<String> getShuffled() {
    final shuffledList = List.of(answeres);
    shuffledList.shuffle();
    return shuffledList;
  }
}
