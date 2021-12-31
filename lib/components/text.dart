import 'package:flutter/cupertino.dart';

class TextWidget extends StatelessWidget {
  TextWidget({required this.text, required this.fontWeight, required this.fontSize, required this.colorType});
  final String text;
  final FontWeight fontWeight;
  final double fontSize;
  final Color colorType;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: colorType,
      ),
      textAlign: TextAlign.justify,
    );
  }
}
