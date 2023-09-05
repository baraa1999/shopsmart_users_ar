import 'package:flutter/material.dart';

class SubTitleWidget extends StatelessWidget {
  const SubTitleWidget(
      {super.key,
      required this.label,
      this.fontsize = 18,
      this.fontStyle = FontStyle.normal,
      this.fontWeight = FontWeight.normal,
      this.color,
      this.textDecoration = TextDecoration.none});
  final String label;
  final double fontsize;
  final FontStyle fontStyle;
  final FontWeight? fontWeight;
  final Color? color;
  final TextDecoration textDecoration;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
          fontSize: fontsize,
          fontWeight: fontWeight,
          color: color,
          fontStyle: fontStyle,
          decoration: textDecoration),
    );
  }
}
