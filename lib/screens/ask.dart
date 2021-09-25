import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:question_and_answer/components/appbar.dart';
import 'package:question_and_answer/components/footer.dart';

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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Header(text: "Ask", isNotifications: false),
            Column(
              children: [
            Padding(
              padding: const EdgeInsets.only(top: 30.0, left: 25.0,),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.ideographic,
                children: [
                  Text("Q.", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20.0, color: Colors.black54),),
                  SizedBox(
                    width: 20.0,
                  ),
                  Container(
                    width: 330.0,
                    child: TextField(
                      maxLines: 10,
                      autocorrect: true,
                      decoration: InputDecoration(
                        hintText: 'Ask your question here...',
                        hintStyle: TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          borderSide: BorderSide(color: Colors.black12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.black12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                Text("To:"),
                SizedBox(
                  width: 20.0,
                ),
              ],
            )
              ],
            ),
            Expanded(child: Container()),
            Footer(),
          ],
        ),
      ),
    );
  }
}
