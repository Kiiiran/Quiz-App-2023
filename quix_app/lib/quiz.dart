import 'package:flutter/material.dart';
import 'package:quix_app/Data/questions.dart';
import 'package:quix_app/questionscreen.dart';
import 'package:quix_app/result_screen.dart';
import 'package:quix_app/startscree.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswere = [];
  Widget? activescreen;
  @override
  void initState() {
    activescreen = StartScreen(SwitchScreen);
    super.initState();
  }

  SwitchScreen() {
    setState(() {
      activescreen = QuestionScreen(onselectAnswere: ChooseAnswere);
    });
  }

  void ChooseAnswere(String answere) {
    selectedAnswere.add(answere);

    if (selectedAnswere.length == questions.length) {
      setState(() {
        activescreen = ResultScreen(
          choosenAnswere: selectedAnswere,
          Restart: restartQuiz,
        );
      });
    }
  }


  void restartQuiz() {
    setState(() {
      selectedAnswere=[];
      activescreen = QuestionScreen(onselectAnswere: ChooseAnswere);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.deepPurple, Colors.deepPurpleAccent],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight),
          ),
          child: activescreen,
        ),
      ),
    );
  }
}
