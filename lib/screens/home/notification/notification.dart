import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:question_and_answer/components/ButtonComponent.dart';
import 'package:question_and_answer/components/size_config.dart';
import 'package:question_and_answer/components/text.dart';

class NotificationAlert extends StatefulWidget {
  static String id = "answer";

  @override
  _NotificationAlertState createState() => _NotificationAlertState();
}

class _NotificationAlertState extends State<NotificationAlert> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
              child: SingleChildScrollView(
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("questions")
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                      snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    final messages = snapshot.data!.docs;
                    List<Question> questions = [];
                    for (var message in messages) {
                      if (message.get('countAns') != '0') {
                        final questionTxt = message.get('question');
                        final question = Question(question: questionTxt);
                        questions.add(question);
                      }
                    }
                    return Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: getProportionateScreenWidth(20),
                              right: getProportionateScreenWidth(20)),
                          child: ListView(
                            children: questions,
                          ),
                        ));
                  },
                ),
      ),
    );
  }
}

class Question extends StatelessWidget {
  Question({required this.question});

  final String question;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(100),
      child: Column(
        children: [
          TextWidget(
              text: question,
              fontWeight: FontWeight.w600,
              fontSize: 16,
              colorType: Colors.black,
              textAlign: TextAlign.left),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ButtonComponent(
                  text: "Answer",
                  press: () {},
                  buttonWidth: getProportionateScreenWidth(100),
                  buttonHeight: getProportionateScreenHeight(50),
                  fontSizeLength: 15,
                  borderColor: Colors.green,
                  backColor: Colors.white,
                  textColor: Colors.green),
              ButtonComponent(
                  text: "Report",
                  press: () {},
                  buttonWidth: getProportionateScreenWidth(100),
                  buttonHeight: getProportionateScreenHeight(50),
                  fontSizeLength: 15,
                  borderColor: Colors.red,
                  backColor: Colors.white,
                  textColor: Colors.red),
            ],
          ),
        ],
      ),
    );
  }
}
