import 'package:flutter/material.dart';
import 'package:question_and_answer/components/appbar.dart';
import 'package:question_and_answer/components/footer.dart';

class Home extends StatefulWidget {
  static String id = "home";

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Header(text: "Home", isNotifications: false),
            Footer(),
          ],
        ),
      ),
    );
  }
}
