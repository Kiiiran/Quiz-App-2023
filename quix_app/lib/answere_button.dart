import 'package:flutter/material.dart';

class AnswereButton extends StatelessWidget {
  AnswereButton({super.key, required this.answereText, required this.onTap});
  final String answereText;
  void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 83, 39, 39),
          foregroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
      onPressed: onTap,
      child: Text(answereText),
    );
  }
}
