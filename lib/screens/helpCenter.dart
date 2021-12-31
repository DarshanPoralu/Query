import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/QuestionRequest.dart';
import '../components/appbar.dart';
import '../components/text.dart';

class Contact extends StatefulWidget {
  static String id = "Contact";
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Header(text: "Contact", isNotifications: false),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    text:
                    "Name: ",
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
                        text: 'Type your name..',
                      ),
                  SizedBox(
                    height: 40.0,
                  ),
                  TextWidget(
                    text:
                    "Email: ",
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
                        text: 'Type your email..',
                      ),

                  SizedBox(
                    height: 40.0,
                  ),
                  TextWidget(
                    text:
                    "Message: ",
                    fontSize: 16.0,
                    colorType: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                      QuestionRequest(
                        height: 180.0,
                        maxLines: 10,
                        text: 'Type your doubts here...',
                      ),
                  SignupContact(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SignupContact extends StatelessWidget {
  const SignupContact({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 20,
        bottom: 4,
        left: 40,
        right: 60,
      ),
      width: double.infinity,
      child: RaisedButton(
        padding: EdgeInsets.only(
          top: 16,
          bottom: 16,
        ),
        onPressed: () {},
        child: Text(
          "Send",
          style: TextStyle(
            fontFamily: 'Petrona',
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        // color: Color(0xffe63946),
        color: Colors.blueAccent,
        textColor: Colors.black,
        shape: const StadiumBorder(),
      ),
    );
  }
}


