import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../generated/locale_keys.g.dart';
import '../../../shared/res/colors.dart';
import '../../../shared/text.dart';

class ItemAddresse extends StatelessWidget {
  const ItemAddresse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(8.0.r),
      child: Column(
        children: [
          Container(
            padding:  EdgeInsets.all(8.r),
            foregroundDecoration: ShapeDecoration(
                shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
            )),
            width: 343.w,
            height: 144.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    HeadText(text: LocaleKeys.house.tr(), fontSize: 15.sp),
                    const Spacer(),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: 24.w,
                        height: 24.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            color: Colors.red[100]),
                        child: Image(
                            height: 13.48.h,
                            width: 13.48.w,
                            color: Colors.red,
                            image: const NetworkImage(
                                'https://cdn.icon-icons.com/icons2/3544/PNG/128/trash_icon_224597.png')),
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: 24.w,
                        height: 24.h,
                        padding: EdgeInsets.only(bottom: 2.r),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            color: Colors.green[100]),
                        child: Image(
                            height: 13.48.h,
                            width: 13.48.w,
                            color: green,
                            image: const NetworkImage(
                                'https://cdn.icon-icons.com/icons2/3544/PNG/512/edit_icon_224588.png')),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(LocaleKeys.address.tr(),
                        style: TextStyle(fontSize: 14.sp, color: green)),
                    Text('119 طريق الملك عبدالعزيز',
                        style: TextStyle(fontSize: 14.sp, color: green))
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  children: [
                    Text(LocaleKeys.description.tr(),
                        style: TextStyle(fontSize: 14.sp, color: Colors.grey)),
                    Text('',
                        style: TextStyle(fontSize: 14.sp, color: Colors.grey))
                  ],
                ),
                Row(
                  children: [
                    Text(LocaleKeys.phoneNumber.tr(),
                        style: TextStyle(fontSize: 14.sp, color: Colors.grey)),
                    Text('',
                        style: TextStyle(fontSize: 14.sp, color: Colors.grey))
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
