import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:question_and_answer/components/ButtonComponent.dart';
import 'package:question_and_answer/components/size_config.dart';
import 'package:question_and_answer/components/text.dart';

import '../../../components/modal.dart';

class Answer extends StatefulWidget {
  static String id = "answer";

  @override
  _AnswerState createState() => _AnswerState();
}

class _AnswerState extends State<Answer> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection("questions").snapshots(),
            builder: (BuildContext context,
                AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                final messages = snapshot.data!.docs;
                List<Question> questions = [];
                for (var message in messages) {
                  if (message.get('countAns') == '0') {
                    final questionTxt = message.get('question');
                    final qid = message.get('qid');
                    final question = Question(
                      question: questionTxt,
                      qid: qid,
                    );
                    questions.add(question);
                  }
                }
                return Expanded(
                  child: ListView(
                    children: questions,
                  ),
                );
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        ],
      ),
    );
  }
}

class Question extends StatelessWidget {
  Question({required this.question, required this.qid});
  final String qid;
  final String question;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 2),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        height: getProportionateScreenHeight(120),
        child: Padding(
          padding: EdgeInsets.only(
              left: getProportionateScreenWidth(20),
              right: getProportionateScreenWidth(20),
              top: getProportionateScreenHeight(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                      press: () {
                        showModalBottomSheet(
                          constraints: BoxConstraints(
                              maxHeight: getProportionateScreenHeight(700),
                              ),
                          isScrollControlled: true,
                          context: context,
                          builder: (context) => Modal(
                            qid: qid,
                            question: question,
                          ),
                        );
                      },
                      buttonWidth: 60,
                      buttonHeight: 30,
                      fontSizeLength: 14,
                      borderColor: Colors.green,
                      backColor: Colors.white,
                      textColor: Colors.green),
                  ButtonComponent(
                      text: "Report",
                      press: () {},
                      buttonWidth: 60,
                      buttonHeight: 30,
                      fontSizeLength: 14,
                      borderColor: Colors.red,
                      backColor: Colors.white,
                      textColor: Colors.red),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
