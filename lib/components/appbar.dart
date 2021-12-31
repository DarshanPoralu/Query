import 'package:flutter/material.dart';
import 'package:question_and_answer/components/icon_widget.dart';

class Header extends StatelessWidget {
  Header({required this.text, required this.isNotifications});

  final String text;
  final bool isNotifications;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      decoration: BoxDecoration(
        color: Color(0xff0558bb),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  height: 30,
                  width: 30,
                  child: Stack(
                    fit: StackFit.expand,
                    clipBehavior: Clip.none,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage("assets/images/Profile Image.png"),
                        backgroundColor: Colors.white,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 15.0,),
                Text(
                  text,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            IconWidget(icons: Icons.search, onPress: (){},),
          ],
        ),
      ),
    );
  }
}
