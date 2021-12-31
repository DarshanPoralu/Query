import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'screens/ask.dart';
import 'screens/profile.dart';
import 'screens/my_account.dart';
import 'screens/settings.dart';
import 'screens/helpCenter.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Home.id,
      routes: {
        Home.id: (context) => Home(),
        Ask.id: (context) => Ask(),
        Profile.id: (context) => Profile(),
        MyAccount.id: (context) => MyAccount(),
        Setting.id: (context) => Setting(),
        Contact.id: (context) => Contact(),
      },
    );
  }
}