import 'package:flutter/material.dart';
import 'package:question_and_answer/components/constants.dart';
import 'package:question_and_answer/components/header1.dart';
import 'package:question_and_answer/screens/home/profile/profile.dart';
import 'home/answer/answer.dart';
import 'home/add/add.dart';
import 'home/home/home.dart';
import 'home/notification/notification.dart';

class Start extends StatefulWidget {
  static String id = "start";
  @override
  _StartState createState() => new _StartState();
}

class _StartState extends State<Start> {
  int _currentIndex = 0;
  List _screens = [Home(),
    Ask(),
    Answer(),
    NotificationAlert(),
    Profile(),
  ];
  List _titles = ["Home", "Add", "Answer", "Notification", "Profile"];

  void _updateIndex(int value) {
    setState(() {
      _currentIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            (_currentIndex == 3 || _currentIndex == 4) ? Header1(
              text: _titles[_currentIndex], isSearch: false,) : Header1(
              text: _titles[_currentIndex], isSearch: true,),
            _screens[_currentIndex],
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _updateIndex,
          selectedItemColor: kPrimaryColor,
          unselectedItemColor: Colors.black45,
          iconSize: 25,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: _titles[0],
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline),
              label: _titles[1],
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notes),
              label: _titles[2],
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications_none_outlined),
              label: _titles[3],
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              label: _titles[4],
            ),
          ],
        ),
      ),
    );
  }
}
