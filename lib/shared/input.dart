import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/shared/res/colors.dart';

class Input extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? type;
  final bool isPassword = false, isPhone;
  final String? label, hint;
  final double? height, width, fontSize;
  final Color? color, fontColor;
  final Widget? suffix, prefix;
  final String? Function(String?)? validate;
  final FormFieldSetter? onSaved;
  final TextInputAction? textInputAction;

  final ValueChanged<String>? onChanged, onSubmit;
  final GestureTapCallback? onTap;

   const Input(
      {super.key,
      this.prefix,
      this.hint,
      this.label,
      this.type,
      this.isPhone = false,
      this.controller,
      this.height = 49,
      this.width = 343,
      this.color,
      this.suffix,
      this.fontColor,
      this.fontSize,
      this.validate,
      this.onSaved,
      this.onTap,
      this.onSubmit,
      this.onChanged,
        this.textInputAction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(bottom: 16.r, end: 8.r, start: 8.r),
      child: Row(
        children: [
          if (isPhone)
            Padding(
              padding: EdgeInsets.all(8.0.r),
              child: Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.h, vertical: 8.h),
                    child: Image(
                        image: const AssetImage('assets/icons/saudi.png'),
                        height: 20.h,
                        width: 32.w),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                   Text('+966', style: TextStyle(fontSize: 15.sp)),
                ],
              ),
            ),
          Expanded(
            child: Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                  color: color, borderRadius: BorderRadius.circular(15.r)),
              child: TextFormField(
                textInputAction: textInputAction,
                onTap: onTap,
                onChanged: onChanged,onFieldSubmitted: onSubmit,
                validator: validate,
                keyboardType: type,
                textAlign: TextAlign.right,
                controller: controller,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: green),
                        borderRadius: BorderRadius.circular(25.r)),
                    labelText: label,
                    floatingLabelBehavior:
                        controller != null && controller!.text.isNotEmpty
                            ? FloatingLabelBehavior.always
                            : FloatingLabelBehavior.never,
                    hintText: hint,
                    hintTextDirection: TextDirection.ltr,
                    hintStyle: TextStyle(color: green),
                    contentPadding: EdgeInsets.all(20.r),
                    labelStyle: TextStyle(
                      color: Colors.grey[400],
                      fontSize: fontSize,
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade300,
                        ),
                        borderRadius: BorderRadius.circular(15.r)),
                    // border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.r),borderSide:BorderSide(color: Color(0xff8AC253))),
                    prefixIcon: prefix,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: suffix,
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
