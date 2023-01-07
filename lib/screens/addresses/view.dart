import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/generated/locale_keys.g.dart';
import 'package:thimar/screens/addresses/components/item_addresse.dart';
import 'package:thimar/shared/my_app_bar.dart';

import '../../shared/res/colors.dart';

class AddresseScreen extends StatelessWidget {
  const AddresseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            MyAppBar(
              title: LocaleKeys.addresses.tr(),
              leadingIcon: true,
              backOnPressed: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(
              height: 650.h,
              width: 343.w,
              child: ListView.separated(
                  itemBuilder: (context, index) => const ItemAddresse(),
                  separatorBuilder: (context, index) => SizedBox(height: 20.h),
                  itemCount: 6),
            ),
            SizedBox(
              width: 342.w,
              height: 54.h,
              child: DottedBorder(
                color: green,
                radius: const Radius.circular(20),
                borderType: BorderType.RRect,
                strokeWidth: 1,
                padding: const EdgeInsets.all(15),
                child: Center(
                  child: Text(
                    LocaleKeys.addNewAddress.tr(),
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: green),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
