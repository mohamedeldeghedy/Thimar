import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast({required String msg, required ToastStates state}) =>
    Fluttertoast.showToast(
      msg: msg,
      fontSize: 15.sp,
      backgroundColor: chooseToastColor(state),
      timeInSecForIosWeb: 5,
      textColor: Colors.white,
      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_LONG,
    );
enum ToastStates { success, error, warning }

Color chooseToastColor(ToastStates state) {
      Color color;
      switch (state) {
            case ToastStates.success:
                  color = Colors.green;
                  break;
            case ToastStates.error:
                  color = Colors.red;
                  break;
            case ToastStates.warning:
                  color = Colors.yellow;
                  break;
      }
      return color;
}
Widget showLoading(){
     return  const CircularProgressIndicator();
}