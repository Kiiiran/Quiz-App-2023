import 'package:flutter/material.dart';
import 'package:quix_app/Data/questions.dart';
import 'package:quix_app/question_answere.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.choosenAnswere, required this.Restart});
  final List<String> choosenAnswere;
  final Function() Restart;

  List<Map<String, Object>> getSummary() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < choosenAnswere.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answere': questions[i].answeres[0],
        'user_answere': choosenAnswere[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summayData = getSummary();
    final numTotalQuestions = questions.length;
    final numCorrectAnswere = summayData.where((data) {
      return data['user_answere'] == data['correct_answere'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(20),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
              'YOu have Answered $numCorrectAnswere out of $numTotalQuestions questions'),
          SizedBox(
            height: 30,
          ),
          QuestionSummary(summayData),
          SizedBox(
            height: 30,
          ),
          TextButton(
              onPressed: () {
                Restart();
              },
              child: Text('Restart Quiz'))
        ]),
      ),
    );
  }
}
