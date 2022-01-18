import 'package:flutter/material.dart';
import 'package:question_and_answer/components/size_config.dart';
import 'package:question_and_answer/components/text.dart';

class QuestionAnswerBubble extends StatelessWidget {
  QuestionAnswerBubble({required this.contText, required this.onPress, required this.check});
  final String contText;
  // final String txt;
  final void Function() onPress;
  final bool check;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 2.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.only(left: getProportionateScreenWidth(20), right: getProportionateScreenWidth(20), top: getProportionateScreenHeight(10), bottom: getProportionateScreenHeight(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: onPress,
                child: TextWidget(
                    text: contText,
                    fontWeight: check? FontWeight.w600: FontWeight.normal,
                    fontSize: 15,
                    colorType: Colors.black,
                    textAlign: TextAlign.left),
              ),
              // SizedBox(height: 10,),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     TextWidget(
              //         text: txt,
              //         fontWeight: FontWeight.normal,
              //         fontSize: 14,
              //         colorType: Colors.black54,
              //         textAlign: TextAlign.left),
              //     ButtonComponent(
              //         text: "Report",
              //         press: () {},
              //         buttonWidth: 60,
              //         buttonHeight: 30,
              //         fontSizeLength: 14,
              //         borderColor: Colors.red,
              //         backColor: Colors.white,
              //         textColor: Colors.red),
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}