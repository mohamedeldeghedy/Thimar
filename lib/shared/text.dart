import 'package:flutter/material.dart';
import 'res/colors.dart';

class HeadText extends StatelessWidget {
  final String text;
  final double? sizeHeight, fontSize;

  const HeadText(
      {super.key, required this.text, this.sizeHeight, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(text,
            style: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: green)),
        SizedBox(
          height: sizeHeight,
        )
      ],
    );
  }
}
