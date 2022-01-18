import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:question_and_answer/components/QuestionRequest.dart';
import 'package:question_and_answer/components/constants.dart';
import 'package:question_and_answer/components/size_config.dart';
import 'package:question_and_answer/models/question_model/database.dart';
import 'package:question_and_answer/models/user_model/database.dart';
import 'package:question_and_answer/screens/home/add/bullet_list.dart';
import '../../../components/ButtonComponent.dart';
import '../../../components/text.dart';

class Ask extends StatefulWidget {
  static String id = "add";
  @override
  _AskState createState() => _AskState();
}

class _AskState extends State<Ask> {
  String question = "";
  String request = "";
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();


  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              left: getProportionateScreenWidth(20),
              right: getProportionateScreenWidth(20),
              top: getProportionateScreenHeight(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: getProportionateScreenWidth(370),
                height: getProportionateScreenHeight(170),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16),
                      child: TextWidget(
                        text: "Important",
                        fontSize: 16.0,
                        colorType: kPrimaryColor,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    BulletList([
                      "Please search the question before asking, so it saves yours and other's time",
                      "Even though you can request a specific person to answer, still the question will be public and anyone can answer"
                    ]),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Color(0xFFebf0ff),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(50),
              ),
              TextWidget(
                text: "Request your question here: ",
                fontSize: 16.0,
                colorType: Colors.black,
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: 10.0,
              ),
              QuestionRequest(
                controller: controller1,
                onChange: (value) {
                  question = value;
                },
                height: getProportionateScreenHeight(120),
                width: getProportionateScreenWidth(370),
                maxLines: 7,
                text: 'Type your question here...',
              ),
              SizedBox(
                height: getProportionateScreenHeight(30),
              ),
              TextWidget(
                text:
                    "Request any specific person to answer your question(Optional): ",
                fontSize: 16.0,
                colorType: Colors.black,
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: 10.0,
              ),
              QuestionRequest(
                controller: controller2,
                onChange: (value) {
                  request = value;
                },
                height: getProportionateScreenHeight(40),
                width: getProportionateScreenWidth(370),
                maxLines: 1,
                text: 'Type name...',
              ),
              SizedBox(
                height: getProportionateScreenHeight(30),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ButtonComponent(
                    text: "Add",
                    buttonWidth: 50.0,
                    buttonHeight: 30.0,
                    fontSizeLength: 15.0,
                    textColor: Colors.white,
                    borderColor: Colors.transparent,
                    backColor: kPrimaryColor,
                    press: () async {
                      if (question == "") {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                behavior: SnackBarBehavior.floating,
                                backgroundColor: kPrimaryColor,
                                content: Text('Please enter the question')));
                      } else {
                        var questionDatabase = DatabaseQuestionService();
                        final FirebaseAuth _auth = FirebaseAuth.instance;
                        String uid = _auth.currentUser!.uid;
                        String qid =
                            await questionDatabase.insertQuestionData(question, uid);
                        var userDatabase = DatabaseUserService();
                        await userDatabase.updateUserData(
                            qid, "qid", "countQid");
                        controller1.clear();
                        controller2.clear();
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                behavior: SnackBarBehavior.floating,
                                backgroundColor: kPrimaryColor,
                                content: Text('Question added')));
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
