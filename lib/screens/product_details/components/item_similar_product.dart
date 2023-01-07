import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/generated/locale_keys.g.dart';
import 'package:thimar/screens/home/pages/feeds/model.dart';
import 'package:thimar/shared/res/colors.dart';

import '../../../core/helper_methods.dart';
import '../view.dart';

class ItemSimilarProduct extends StatelessWidget {
  final Product model;
  const ItemSimilarProduct({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigateTo(
          context,
          page: ProductDetailsScreen(id: model.id),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 13.h,
          ),
          Padding(
            padding: EdgeInsets.all(16.0.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Stack(
                      alignment: AlignmentDirectional.topEnd,
                      children: [
                        Image(
                          image: NetworkImage(model.mainImage),
                          height: 116.h,
                          width: 110.w,
                        ),
                        Container(
                            width: 43.w,
                            height: 16.h,
                            decoration: BoxDecoration(
                                color: green,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5.r),
                                    bottomRight: Radius.circular(5.r))),
                            child: Text(
                              '${model.discount}%',
                              style: TextStyle(
                                  color: white,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold),
                            )),
                      ],
                    ),
                  ],
                ),
                Text(
                  model.title,
                  style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                      color: green),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  '${LocaleKeys.kg.tr()} /${LocaleKeys.price.tr()}',
                  style: TextStyle(color: grey, fontSize: 10.sp),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  children: [
                    Text(
                      '${model.price}ر.س',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: green,
                          fontSize: 13.sp),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      '56 ر.س',
                      style: TextStyle(
                          color: green,
                          fontSize: 10.sp,
                          decoration: TextDecoration.lineThrough),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    CircleAvatar(
                        backgroundColor: green1,
                        radius: 18.r,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.add,
                            color: white,
                          ),
                          iconSize: 15.r,
                        ))
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
