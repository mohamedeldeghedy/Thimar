import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/shared/res/colors.dart';

import '../../../generated/locale_keys.g.dart';

class ProductRatingItem extends StatelessWidget {
  const ProductRatingItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Image(
                image: NetworkImage(
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/8/89/Tomato_je.jpg/100px-Tomato_je.jpg')),
            SizedBox(
              width: 8.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('طماطم',
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: green)),
                Text('${LocaleKeys.price.tr()}/1 ${LocaleKeys.kg.tr()}',
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[500])),
                Row(
                  children: [
                    Text('45 ر.س',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: green)),
                    SizedBox(
                      width: 3.w,
                    ),
                    Text('56 ر.س',
                        style: TextStyle(fontSize: 13.sp, color: green))
                  ],
                ),
              ],
            )
          ],
        ),
        SizedBox(
          height: 26.h,
        ),
        RatingBar.builder(
          initialRating: 3,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemSize: 20,
          maxRating: 5,
          itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
          itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
            if (kDebugMode) {
              print(rating);
            }
          },
        ),
        SizedBox(
          height: 5.2.h,
        ),
        Container(
          width: 325.w,
          height: 89.h,
          alignment: AlignmentDirectional.topStart,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: Colors.grey.shade400)),
          child: TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  label: Text(
                    LocaleKeys.commentOnProduct.tr(),
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    style: TextStyle(fontSize: 13.sp, color: Colors.grey[400]),
                  ))),
        ),
      ],
    );
  }
}
