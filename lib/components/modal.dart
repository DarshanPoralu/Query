import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:question_and_answer/components/ButtonComponent.dart';
import 'package:question_and_answer/components/QuestionRequest.dart';
import 'package:question_and_answer/components/constants.dart';
import 'package:question_and_answer/components/size_config.dart';
import 'package:question_and_answer/components/text.dart';
import 'package:question_and_answer/models/answer_model/database.dart';
import 'package:question_and_answer/models/question_model/database.dart';
import 'package:question_and_answer/models/user_model/database.dart';

class Modal extends StatefulWidget {
  Modal({required this.question, required this.qid});
  final String qid;
  final String question;

  @override
  State<Modal> createState() => _ModalState();
}

class _ModalState extends State<Modal> {
  TextEditingController controller = TextEditingController();
  String answer = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(top: 30.0, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(
                text: widget.question,
                fontWeight: FontWeight.w600,
                fontSize: 15,
                colorType: Colors.black,
                textAlign: TextAlign.left),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            QuestionRequest(
                height: 330,
                width: getProportionateScreenWidth(370),
                text: "Type your answer here...",
                maxLines: 100,
                onChange: (value) {
                  answer = value;
                },
                controller: controller),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ButtonComponent(
                  text: "Post",
                  press: () async {
                    var answerService = DatabaseAnswerService();
                    final FirebaseAuth _auth = FirebaseAuth.instance;
                    String uid = _auth.currentUser!.uid;
                    String aid =
                        await answerService.insertAnswerData(answer, widget.qid, uid);
                    var userService = DatabaseUserService();
                    await userService.updateUserData(aid, "aid", "countAid");
                    var questionService = DatabaseQuestionService();
                    await questionService.updateQuestionData(widget.qid, aid);
                    controller.clear();
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: kPrimaryColor,
                        content: Text('Answer posted')));
                    Navigator.pop(context);
                  },
                  buttonWidth: 50,
                  buttonHeight: 30,
                  fontSizeLength: 15,
                  textColor: Colors.white,
                  borderColor: Colors.transparent,
                  backColor: kPrimaryColor,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
