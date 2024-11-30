import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  final String title;
  final Color color;
  final double fontSize;
  final int? maxLines;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final TextDecoration textDecoration;
  final List<Shadow>? shadows;

  const CustomTextWidget(
      {super.key,
      required this.title,
      this.color = Colors.black,
      this.fontSize = 14.0,
      this.maxLines,
      this.fontWeight = FontWeight.normal,
      this.textAlign = TextAlign.start,
      this.textDecoration = TextDecoration.none,
      this.shadows});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: maxLines,
      overflow: maxLines != null ? TextOverflow.ellipsis : null,
      textAlign: textAlign,
      style: TextStyle(
          fontFamily: 'Poppins',
          decoration: textDecoration,
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
          shadows: shadows),
    );
  }
}
