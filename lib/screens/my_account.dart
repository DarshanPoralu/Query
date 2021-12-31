import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:question_and_answer/components/appbar.dart';
import 'package:question_and_answer/components/profile_pic.dart';
import 'package:question_and_answer/components/text.dart';
import '../components/ButtonComponent.dart';

class MyAccount extends StatefulWidget {
  static String id = "my_account";
  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Header(text: "Profile", isNotifications: true),
              SizedBox(height: 30,),
              ProfilePic(),
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(text: "Your Info", fontSize: 20, fontWeight: FontWeight.w600, colorType: Colors.black,),
                        ButtonComponent(txt: "Edit", color: Color(0xFFF5F6FD)),
                      ],
                    ),
                    SizedBox(height: 20,),
                    TextWidget(text: "Name:", fontSize: 18, fontWeight: FontWeight.w400, colorType: Colors.black,),
                    SizedBox(height: 10,),
                    TextWidget(text: "Semester:", fontSize: 18, fontWeight: FontWeight.w400, colorType: Colors.black,),
                    SizedBox(height: 10,),
                    TextWidget(text: "Department:", fontSize: 18, fontWeight: FontWeight.w400, colorType: Colors.black,),
                    SizedBox(height: 10,),
                    TextWidget(text: "Joined:", fontSize: 18, fontWeight: FontWeight.w400, colorType: Colors.black,),
                    SizedBox(height: 10,),
                  ],
                ),
              ),
              SizedBox(height: 20,),
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
                        text: "Questions Asked(0)",
                      ),
                      Tab(
                        text: "Questions Answered(0)",
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
                    Container(
                      child: Center(
                        child: Text(
                          'No Questions asked.',
                        ),
                      ),
                    ),

                    // second tab bar view widget
                    Container(
                      child: Center(
                        child: Text(
                          'No Questions answered.',
                        ),
                      ),
                    ),
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
          ),
        ),
      ),
    );
  }
}
