import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuestionRequest extends StatelessWidget {
  QuestionRequest({required this.height, required this.text, required this.maxLines});

  final double height;
  final int maxLines;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 370.0,
      height: height,
      child: TextField(
        // textAlign: TextAlign.center,
        maxLines: maxLines,
        autocorrect: true,
        decoration: InputDecoration(
          hintText: text,
          hintStyle: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: Colors.black12),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Colors.black12),
          ),
        ),
      ),
    );
  }
}
