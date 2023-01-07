import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../shared/res/colors.dart';
import '../../../../../shared/icons.dart';

class MyAccountButton extends StatelessWidget {
 final String image;
 final double? width;
 final String text;
 final GestureTapCallback onTap;
  const MyAccountButton(
      {super.key,
      required this.image,
      this.width,
      required this.text,
      required this.onTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(
          bottom: 30.h,
          left: 7.w,
          right: 7.w,
        ),
        child: Row(
          children: [
            Image(
                image: AssetImage(image),
                width: width,
                height: 19.h,
                color: green),
            SizedBox(
              width: 9.w,
            ),
            Text(text,
                style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold,
                    color: green)),
            const Spacer(),
            Image(
                image:  const AssetImage(arrowLeft),
                height: 18.h,
                width: 18.w,
                color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
