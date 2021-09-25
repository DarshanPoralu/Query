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
                Container(
                  height: 30.0,
                  width: 30.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
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
