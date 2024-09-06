import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;
  final double size;
  final TextAlign? textAlign;
  final int? max;
  final TextOverflow? textOverflow;
  const CustomText(
      {super.key,
      required this.text,
      required this.color,
      required this.fontWeight,
      required this.size,
      this.textAlign,
      this.max, this.textOverflow});

  @override
  Widget build(BuildContext context) {
    return Text(
      overflow: textOverflow,
      textAlign: textAlign,
      maxLines: max,
      text,
      style: TextStyle(color: color, fontSize: size, fontWeight: fontWeight),
    );
  }
}
