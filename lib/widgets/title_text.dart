import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleText extends StatelessWidget {
  final textalign;
  final bool line;
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  const TitleText({
    Key? key,
    this.text = "",
    this.fontSize = 18,
    this.color = Colors.grey,
    this.fontWeight = FontWeight.w800,
    this.line = false,
    this.textalign = TextAlign.left,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: textalign,
        style: GoogleFonts.mulish(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
          decoration: line ? TextDecoration.lineThrough : TextDecoration.none,
        ));
  }
}
