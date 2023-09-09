import 'package:flutter/material.dart';
import 'package:quix_app/Data/questions.dart';
import 'package:quix_app/answere_button.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onselectAnswere});
  final void Function(String Answere) onselectAnswere;
  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestion = 0;
  void answereQuestions(String selectAnswere) {
    widget.onselectAnswere(selectAnswere);

    setState(() {
      currentQuestion++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currenrQuestionIndex = questions[currentQuestion];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              currenrQuestionIndex.text,
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30,
            ),
            ...currenrQuestionIndex.getShuffled().map((answere) {
              return AnswereButton(
                  answereText: answere,
                  onTap: () {
                    answereQuestions(answere);
                  });
            })
          ],
        ),
      ),
    );
  }
}
