import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/shared/res/colors.dart';

import '../generated/locale_keys.g.dart';

class AuthHeader extends StatelessWidget {
  final String? phone, subtitle, header;
  final bool changePhoneNum;
  const AuthHeader({
    super.key,
    this.header,
    this.subtitle,
    this.changePhoneNum = false,
    this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20.3.h,
        ),
        Center(
          child: Image(
            image: const AssetImage('assets/icons/app_logo.png'),
            width: 129.83.w,
            height: 125.72.h,
          ),
        ),
        SizedBox(
          height: 21.h,
        ),
        Padding(
          padding:  EdgeInsets.all(8.0.r),
          child: Column(
            children: [
              Align(
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  header!,
                  style: TextStyle(
                    fontSize: 16,
                    color: green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              Align(
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  subtitle!,
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: grey,
                  ),
                ),
              ),
              if (changePhoneNum)
                Row(
                  children: [
                    Text(
                      phone!,
                      style: TextStyle(
                        color: grey,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        LocaleKeys.changePhoneNumber.tr(),
                        style: TextStyle(
                            color: green,
                            decoration: TextDecoration.underline,
                            fontSize: 12.sp),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ],
    );
  }
}
