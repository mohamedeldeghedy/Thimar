import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/core/helper_methods.dart';

import '../generated/locale_keys.g.dart';
import '../screens/auth/login/view.dart';
import '../screens/auth/register/view.dart';
import 'res/colors.dart';

class HaveAccounts extends StatelessWidget {
  final double? heightSizedBox;
  final bool isHave;
  const HaveAccounts({super.key, this.heightSizedBox, this.isHave = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: heightSizedBox,
        ),
        if (isHave)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(LocaleKeys.haveAccount.tr(),
                  style: TextStyle(
                    color: green,
                  )),
              TextButton(
                  onPressed: () {
                    navigateTo(context,
                        page: const LoginScreen(), withHistory: false);
                  },
                  child: Text(
                    LocaleKeys.login.tr(),
                    style: TextStyle(
                      color: green,
                    ),
                  )),
            ],
          ),
        if (isHave == false)
          Padding(
            padding: EdgeInsets.only(right: 71.w, left: 76.w),
            child: Row(
              children: [
                Text(
                  LocaleKeys.noAccount.tr(),
                  style: TextStyle(
                    color: green,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    navigateTo(context,
                        page:  RegisterScreen(), withHistory: false);
                  },
                  child: Text(
                    LocaleKeys.registerNow.tr(),
                    style: TextStyle(color: green),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
