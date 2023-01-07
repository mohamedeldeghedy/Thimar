import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyButton extends StatelessWidget {
  final String buttonName;
  final bool isLoading;
  final double? sizedBoxHeight,
      sizedBoxHeightBtm,
      buttonHeight,
      buttonWidth,
      fontSize;
  final Color? buttonColor, fontColor;
  final VoidCallback? onPressed;
  const MyButton(
      {super.key,
      required this.buttonName,
      required this.onPressed,
      this.buttonHeight,
      this.buttonWidth,
      this.buttonColor,
      this.fontColor,
      this.fontSize,
      this.sizedBoxHeight,
      this.sizedBoxHeightBtm,
      this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: sizedBoxHeight ?? 0, bottom: sizedBoxHeightBtm ?? 0),
      child: isLoading
          ? const CircularProgressIndicator()
          : ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(buttonWidth ?? 343.w, buttonHeight ?? 60.h),
                  backgroundColor: buttonColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.r),
                  )),
              child: Text(buttonName,
                  style: TextStyle(
                      color: fontColor,
                      fontSize: fontSize,
                      fontWeight: FontWeight.bold)),
            ),
    );
  }
}
