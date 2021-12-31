import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:question_and_answer/components/QuestionRequest.dart';
import '../components/appbar.dart';
import '../components/footer.dart';
import '../components/ButtonComponent.dart';
import '../components/text.dart';

class Ask extends StatefulWidget {
  static String id = "ask";
  @override
  _AskState createState() => _AskState();
}

class _AskState extends State<Ask> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Header(text: "Ask", isNotifications: false),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 20.0, bottom: 20.0, left: 20.0, right: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    text:
                        "Important: Please search the question before asking, so it saves yours and other's time.",
                    fontSize: 16.0,
                    colorType: Colors.blue,
                    fontWeight: FontWeight.w400,
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  TextWidget(
                    text:
                        "Request your question here: ",
                    fontSize: 16.0,
                    colorType: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  QuestionRequest(
                    height: 120.0,
                    maxLines: 7,
                    text: 'Type your question here...',
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  TextWidget(
                    text:
                        "Request any specific person to answer your question: ",
                    fontSize: 16.0,
                    colorType: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  QuestionRequest(
                    height: 39.0,
                    maxLines: 1,
                    text: 'Type name...',
                  ),
                  SizedBox(
                    height: 100.0,
                  ),
                  TextWidget(
                    text:
                        "Note: Even though you can request a specific person to answer, still the question will be public and anyone can answer.",
                    fontSize: 16.0,
                    colorType: Colors.blue,
                    fontWeight: FontWeight.w400,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ButtonComponent(txt: "Ask", color: Color(0xFFF5F6FD)),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(child: Container()),
            Footer(),
          ],
        ),
      ),
    );
  }
}
