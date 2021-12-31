import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:question_and_answer/components/text.dart';

class ButtonComponent extends StatelessWidget {
  ButtonComponent({required this.txt, required this.color});

  final String txt;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        primary: Colors.black,
        padding: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)),
        backgroundColor: color,
      ),
      onPressed: () {},
      child: TextWidget(text: txt, fontSize: 15, fontWeight: FontWeight.w600, colorType: Colors.black),
    );
  }
}
