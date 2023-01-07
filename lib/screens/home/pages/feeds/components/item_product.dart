import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/core/helper_methods.dart';
import 'package:thimar/screens/home/pages/feeds/model.dart';
import 'package:thimar/screens/product_details/view.dart';
import 'package:thimar/shared/res/colors.dart';
import '../../../../../generated/locale_keys.g.dart';

class ItemProduct extends StatelessWidget {
  final Product model;
  const ItemProduct({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigateTo(
          context,
          page: ProductDetailsScreen(id:model.id ),
        );
      },
      child: Padding(
        padding:  EdgeInsets.all(16.0.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                alignment: AlignmentDirectional.topEnd,
                children: [
                  Image(
                    fit: BoxFit.fill,
                    image: NetworkImage(model.mainImage),
                    height: 117.h,
                    width: 145.w,
                  ),
                  Container(
                      width: 45.w,
                      height: 19.h,
                      alignment: AlignmentDirectional.center,
                      decoration: BoxDecoration(
                          color: green,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.r),
                              bottomRight: Radius.circular(10.r))),
                      child: Text(
                        '${model.discount}%',
                        style: TextStyle(
                            color: white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              model.title,
              style: TextStyle(
                  fontSize: 16.sp, fontWeight: FontWeight.bold, color: green),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              '${LocaleKeys.price.tr()}/1${LocaleKeys.kg.tr()}',
              style: TextStyle(color: grey, fontSize: 12.sp),
            ),
            SizedBox(
              height: 5.h,
            ),
            Row(
              children: [
                Text(
                  '${model.price}ر.س',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: green, fontSize: 16),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  '${model.priceBeforeDiscount}ر.س',
                  style: TextStyle(
                      color: green,
                      fontSize: 13.sp,
                      decoration: TextDecoration.lineThrough),
                ),
                const Spacer(),
                Container(
                  height: 35.h,
                  alignment: AlignmentDirectional.center,
                  width: 35.w,
                  decoration: BoxDecoration(
                      color: green1, borderRadius: BorderRadius.circular(8.r)),
                  child: Icon(
                    Icons.add,
                    color: white,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(115.w, 30.h),
                    backgroundColor: green1,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r))),
                child: Text(LocaleKeys.addToCart.tr(),
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: white))),
          ],
        ),
      ),
    );
  }
}
