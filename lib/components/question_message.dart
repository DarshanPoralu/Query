import 'package:flutter/material.dart';
import 'package:question_and_answer/components/size_config.dart';
import 'package:question_and_answer/components/text.dart';

class QuestionMessage extends StatelessWidget {
  QuestionMessage({required this.question});
  final String question;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2.0),
      child: Container(
        height: getProportionateScreenHeight(50),
        decoration: BoxDecoration(color: Colors.white),
        child: Padding(
          padding: EdgeInsets.only(left: getProportionateScreenWidth(20), right: getProportionateScreenWidth(20), top: getProportionateScreenHeight(10)),
          child: GestureDetector(
            child: TextWidget(
              fontSize: 15,
              colorType: Colors.black,
              fontWeight: FontWeight.w600,
              textAlign: TextAlign.left,
              text: question,
            ),
          ),
        ),
      ),
    );
  }
}