import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../generated/locale_keys.g.dart';
import '../../../../../shared/res/colors.dart';
import '../model.dart';


class ItemProduct extends StatelessWidget {
  final FavouritesData favouritesData;
  const ItemProduct({Key? key,required this.favouritesData,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Stack(
                          alignment: AlignmentDirectional.topEnd,
                          children: [
                            Container(decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(5.r))),
                              child: Image(
                                fit: BoxFit.fill,
                                image:  NetworkImage(
                                    favouritesData.mainImage,),
                                height: 117.h,
                                width: 145.w,
                              ),
                            ),
                            Container(
                                width: 45.w,
                                height: 19.h,
                                decoration: BoxDecoration(
                                    color: green,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(5.r),
                                        bottomRight: Radius.circular(5.r))),
                                child: Text(
                                  '${favouritesData.discount}',
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
                      favouritesData.title,
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: green),
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
                          '${favouritesData.price} ر.س',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: green,
                              fontSize: 16.sp),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          '${favouritesData.priceBeforeDiscount} ر.س',
                          style: TextStyle(
                              color: green,
                              fontSize: 13.sp,
                              decoration: TextDecoration.lineThrough),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        InkWell(
                          onTap: (){},
                          child: Container(
                              height: 40.h,
                              width: 40.w,
                              decoration: BoxDecoration(
                                  color: green1,
                                  borderRadius: BorderRadius.circular(5.r)),
                              child:  Icon(
                                  Icons.add,
                                  color: white,
                                ),
                              ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                  ],
                ),

    );
  }
}
