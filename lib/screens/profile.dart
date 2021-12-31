import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:question_and_answer/components/appbar.dart';
import 'package:question_and_answer/components/footer.dart';
import 'package:question_and_answer/components/profile_menu.dart';
import 'my_account.dart';
import 'settings.dart';
import 'helpCenter.dart';

class Profile extends StatefulWidget {
  static String id = "profile";

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Header(text: "Profile", isNotifications: true),
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProfileMenu(
                    text: "My Account",
                    icon: Icons.account_circle_rounded,
                    press: (){
                      Navigator.pushNamed(context, MyAccount.id);
                    },
                  ),
                  ProfileMenu(
                    text: "Settings",
                    icon: Icons.settings,
                    press: () {
                      Navigator.pushNamed(context, Setting.id);
                    },
                  ),
                  ProfileMenu(
                    text: "Help Center",
                    icon: Icons.help_outline,
                    press: () {
                      Navigator.pushNamed(context, Contact.id);
                    },
                  ),
                  ProfileMenu(
                    text: "Log Out",
                    icon: Icons.logout,
                    press: () {},
                  ),
                ],
              ),
              Footer(),
            ],
          ),
      ),
    );
  }
}
