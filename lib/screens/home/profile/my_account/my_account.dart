import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:question_and_answer/components/constants.dart';
import 'package:question_and_answer/components/header2.dart';
import 'package:question_and_answer/components/question_answer.dart';
import 'package:question_and_answer/components/question_message.dart';
import 'package:question_and_answer/components/size_config.dart';
import 'package:question_and_answer/components/text.dart';
import 'package:question_and_answer/models/user_model/user_model.dart';
import '../../../../components/ButtonComponent.dart';

class MyAccount extends StatefulWidget {
  static String id = "my_account";
  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  User? user = FirebaseAuth.instance.currentUser;
  final FirebaseStorage storage = FirebaseStorage.instance;
  UserModel userModel = UserModel();
  var url;
  var questions = [];
  var answerQuestions = [];
  bool loadUserData = true, loadQuestionData = true, loadAnswerData = true;

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  void getUserData() async{
    await FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      userModel = UserModel.fromMap(value.data());
    });
    url = await storage.ref('test/${user!.uid}').getDownloadURL();
    print("Darshan $url");
    setState(() {
      loadUserData = false;
    });
    await getQuestions(userModel.qid);
    setState(() {
      loadQuestionData = false;
    });
    await getAnswersQuestions(userModel.aid);
    setState(() {
      loadAnswerData = false;
    });
  }

  Future getAnswersQuestions(var aids) async{
    for(int i=0; i<aids.length; i++){
      var val1 = "", val2 = "";
      var qid = "";
      await FirebaseFirestore.instance
          .collection('answers')
          .doc(aids[i])
          .get()
          .then((value) {
        val1 = value.data()!['answer'];
        qid = value.data()!['qid'];
      });
      await FirebaseFirestore.instance
          .collection('questions')
          .doc(qid)
          .get()
          .then((value) {
        val2 = value.data()!['question'];
      });
      answerQuestions.add([val2, val1]);
    }
  }

  Future getQuestions(var qids) async{
    for(int i=0; i<qids.length; i++){
      var val = "";
      await FirebaseFirestore.instance
          .collection('questions')
          .doc(qids[i])
          .get()
          .then((value) {
        val = value.data()!['question'];
      });
      questions.add(val);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          body: !loadUserData ? Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Header2(text: "Profile"),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(115),
                    height: getProportionateScreenHeight(115),
                    child: url != null ? CircleAvatar(
                      backgroundImage: NetworkImage(url!),
                    ) : CircleAvatar(
                      backgroundImage: AssetImage("assets/images/profile.jpg"),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: getProportionateScreenWidth(20),
                        right: getProportionateScreenWidth(20)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextWidget(
                              text: "Your Info",
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              colorType: Colors.black,
                              textAlign: TextAlign.left,
                            ),
                            ButtonComponent(
                              text: "Edit",
                              buttonWidth: getProportionateScreenWidth(50),
                              buttonHeight: getProportionateScreenHeight(30),
                              fontSizeLength: 15.0,
                              textColor: Colors.white,
                              borderColor: Colors.transparent,
                              backColor: kPrimaryColor,
                              press: () {},
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            TextWidget(
                              text: "Name: ",
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              colorType: Colors.black,
                              textAlign: TextAlign.left,
                            ),
                            TextWidget(
                              text: "${userModel.username}",
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              colorType: Colors.black,
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            TextWidget(
                              text: "Designation: ",
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              colorType: Colors.black,
                              textAlign: TextAlign.left,
                            ),
                            TextWidget(
                              text: "${userModel.designation}",
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              colorType: Colors.black,
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            TextWidget(
                              text: "Department: ",
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              colorType: Colors.black,
                              textAlign: TextAlign.left,
                            ),
                            TextWidget(
                              text: "${userModel.department}",
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              colorType: Colors.black,
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            TextWidget(
                              text: "Joined: ",
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              colorType: Colors.black,
                              textAlign: TextAlign.left,
                            ),
                            TextWidget(
                              text: "${userModel.joined}",
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              colorType: Colors.black,
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                child: AppBar(
                  backgroundColor: Colors.white,
                  bottom: TabBar(
                    labelColor: Color(0xff0558bb),
                    unselectedLabelColor: Colors.black38,
                    indicatorColor: Color(0xff0558bb),
                    isScrollable: true,
                    tabs: [
                      Tab(
                        text: "Questions Asked(${userModel.countQid})",
                      ),
                      Tab(
                        text: "Questions Answered(${userModel.countAid})",
                      ),
                      Tab(
                        text: "Requests Sent(0)",
                      ),
                      Tab(
                        text: "Requests Received(0)",
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    // first tab bar view widget
                    !loadQuestionData ? Container(
                      child: Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              itemCount: questions.length,
                              itemBuilder: (BuildContext context, int index) =>
                                  QuestionMessage(question: questions[index]),
                            ),
                          ),
                        ],
                      ),
                    ) : Center(child: CircularProgressIndicator(),),

                    // second tab bar view widget
                    !loadAnswerData ? Container(
                      child: Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              itemCount: answerQuestions.length,
                              itemBuilder: (BuildContext context, int index) =>
                                  Padding(
                                    padding: EdgeInsets.only(bottom: getProportionateScreenHeight(20)),
                                    child: Column(
                                      children: [
                                        QuestionAnswerBubble(
                                          contText: answerQuestions[index][0],
                                          // txt: "Asked by $askName",
                                          onPress: () {},
                                          check: true,
                                        ),
                                        QuestionAnswerBubble(
                                          contText: answerQuestions[index][1],
                                          // txt: "Answered by $answerName",
                                          onPress: () {},
                                          check: false,
                                        )
                                      ],
                                    ),
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ) : Center(child: CircularProgressIndicator(),),
                    Container(
                      child: Center(
                        child: Text(
                          'No Requests sent.',
                        ),
                      ),
                    ),

                    // second tab bar view widget
                    Container(
                      child: Center(
                        child: Text(
                          'No Requests received'
                          '.',
                        ),
                      ),
                    ),
                  ],
                ),

          ),
          ],
        ) : Center(child: CircularProgressIndicator(),),
      ),
      ),
    );
  }
}


