import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:question_and_answer/components/ButtonComponent.dart';
import 'package:question_and_answer/components/question_answer.dart';
import 'package:question_and_answer/components/size_config.dart';
import 'package:question_and_answer/components/text.dart';

class Home extends StatefulWidget {
  static String id = "home";

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String askName = "";
  String answerId = "";
  String answerName = "";
  String answer = "";

  Future<String> getData(String coll, String doc, String id) async {
    var val;
    await FirebaseFirestore.instance
        .collection(coll)
        .doc(id)
        .get()
        .then((value) {
      val = value.data()![doc];
    });
    return val;
  }

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
                List<QuestionAnswer> questionAnswers = [];
                for (var message in messages) {
                  if (message.get('mainQ') == true &&
                      message.get("countAns") != '0') {
                    final questionTxt = message.get('question');
                    final qid = message.get('qid');
                    final aid = message.get('aid');
                    int randomIndex = Random().nextInt(aid.length);
                    final fAid = aid[randomIndex];
                    final asked = message.get('asked');
                    getData('users', 'username', asked).then((val){ askName = val;});
                    Future.delayed(Duration(milliseconds: 1000));
                    getData('answers', 'answered', fAid).then((val){answerId = val;});
                    Future.delayed(Duration(milliseconds: 1000));
                    getData('users', 'username', answerId).then((val){answerName = val;});
                    Future.delayed(Duration(milliseconds: 1000));
                    getData('answers', 'answer', fAid).then((val){answer = val;});
                    Future.delayed(Duration(milliseconds: 1000));
                    final questionAnswer = QuestionAnswer(
                      question: questionTxt,
                      qid: qid,
                      askName: askName,
                      answerName: answerName,
                      answer: answer,
                    );
                    questionAnswers.add(questionAnswer);
                  }
                }
                return Expanded(
                  child: ListView(
                    children: questionAnswers,
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

class QuestionAnswer extends StatelessWidget {
  QuestionAnswer(
      {required this.question,
      required this.qid,
      required this.askName,
      required this.answerName,
      required this.answer});
  final String question;
  final String qid;
  final String askName;
  final String answerName;
  final String answer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: getProportionateScreenHeight(20)),
      child: Column(
        children: [
          QuestionAnswerBubble(
            contText: question,
            // txt: "Asked by $askName",
            onPress: () {},
            check: true,
          ),
          QuestionAnswerBubble(
            contText: answer,
            // txt: "Answered by $answerName",
            onPress: () {},
            check: false,
          )
        ],
      ),
    );
  }
}


