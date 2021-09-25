import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'screens/ask.dart';

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
      },
    );
  }
}