import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/core/cache_helper.dart';
import 'package:thimar/screens/home/view.dart';

import '../login/view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      if(CacheHelper.getToken().isEmpty) {
        Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const LoginScreen()));
      }
      else{
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const Home()));
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Image(
                image: const AssetImage(
                  'assets/icons/app_logo.png',
                ),
                width: 159.57.w,
                height: 513.99.h,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
