import 'package:flutter/material.dart';
import 'package:question_and_answer/components/icon_widget.dart';
import '../screens/ask.dart';
import '../screens/home.dart';
import '../screens/profile.dart';

class Footer extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      decoration: BoxDecoration(
        color: Color(0xff0558bb),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconWidget(icons: Icons.home, onPress: (){ Navigator.pushNamed(context, Home.id); },),
          IconWidget(icons: Icons.add_circle_outline, onPress: (){ Navigator.pushNamed(context, Ask.id); },),
          IconWidget(icons: Icons.notes, onPress: (){ Navigator.pushNamed(context, Ask.id); },),
          IconWidget(icons: Icons.notifications, onPress: (){ Navigator.pushNamed(context, Ask.id); },),
          IconWidget(icons: Icons.account_circle, onPress: (){ Navigator.pushNamed(context, Profile.id); },),
        ],
      ),
    );
  }
}


