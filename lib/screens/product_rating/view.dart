import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/core/helper_methods.dart';
import 'package:thimar/shared/my_app_bar.dart';

import '../../generated/locale_keys.g.dart';
import '../../shared/my_button.dart';
import '../home/pages/my_account/view.dart';
import 'components/item_product_rating.dart';

class ProductRatingScreen extends StatelessWidget {
  const ProductRatingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(
            title: LocaleKeys.rateProducts.tr(),
            backOnPressed: () {
              Navigator.pop(context);
            }),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                height: 625.h,
                width: 342.5.w,
                child: ListView.separated(
                    itemBuilder: (context, index) => const ProductRatingItem(),
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 16.h),
                    itemCount: 5),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16.0),
          child: MyButton(
              buttonName: LocaleKeys.rate.tr(),
              onPressed: () {
                navigateTo(context, page: const AccountScreen());
              }),
        ));
  }
}
