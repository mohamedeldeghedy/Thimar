import 'package:flutter/material.dart';

Future navigateTo(context, {required Widget page, bool withHistory = true}) {
  return Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => page,
      ),
      (route) => withHistory);
}
