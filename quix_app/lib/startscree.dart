import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});
  final void Function() startQuiz;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.deepPurple, Colors.deepPurpleAccent],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            scale: 3,
            color: Color.fromARGB(151, 255, 255, 255),
          ),
          SizedBox(
            height: 50,
          ),
          Center(
            child: Text(
              'Learn Flutter in Fun way',
              style: TextStyle(color: Colors.white, fontSize: 23),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 150),
            child: TextButton(
              onPressed: () {
                startQuiz();
              },
              child: Text('Start Quiz'),
            ),
          ),
        ],
      ),
    );
  }
}
