import 'package:flutter/material.dart';

class SubText extends StatelessWidget {
  final String text;
  final double? sizeWidth, sizeHeight, fontSize;
  final Color? color;

  const SubText(
      {super.key,
      required this.text,
      this.sizeHeight,
      this.sizeWidth,
      this.color,
      this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(text,
            style: TextStyle(
              fontSize: fontSize,
              color: color,
            )),
        SizedBox(
          height: sizeHeight,
          width: sizeWidth,
        )
      ],
    );
  }
}
