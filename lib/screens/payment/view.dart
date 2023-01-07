import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/generated/locale_keys.g.dart';
import 'package:thimar/shared/my_app_bar.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          MyAppBar(
            title: LocaleKeys.payment.tr(),
            backOnPressed: () {
              Navigator.pop(context);
            },
          ),
          Card(
            color: Colors.black,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.r)),
          )
        ],
      ),
    );
  }
}
