
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LightText extends StatelessWidget {
  double size;
  final String text;
  final String font;

  Color color;

  TextOverflow textOverflow;
  LightText({
    super.key,
    this.textOverflow = TextOverflow.ellipsis,
    this.font = "font30",
    required this.size ,
    this.color = Colors.black,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      overflow: textOverflow,
      text,
      style: TextStyle(fontSize: size, color: color, fontFamily: font),
    );
  }
}
