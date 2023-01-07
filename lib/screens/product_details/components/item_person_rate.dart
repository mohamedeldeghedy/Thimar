import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/screens/product_details/components/product_rate/model.dart';

class ItemPersonRate extends StatelessWidget {
  final Rate rate;
   const ItemPersonRate({Key? key,required this.rate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
             Text(
              rate.clientName,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff333333)),
            ),
            RatingBar.builder(
              initialRating: rate.value.toDouble(),
              itemSize: 20.r,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              ignoreGestures: true,
              itemPadding:  EdgeInsets.symmetric(horizontal: 2.5.w),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),

              onRatingUpdate: (double rating) {
                rating=rate.value.toDouble();
                if (kDebugMode) {
                  print(rating);
                }
              },
            ),
          ],
        ),
        SizedBox(
          width: 375.w,
          height: 87.w,
          child: Row(
            children: [
              SizedBox(
                width: 182.w,
                height: 45.h,
                child: Text(
                 rate.comment,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                      fontSize: 12.sp, color: const Color(0xff333333)),
                ),
              ),
              Image(
                image:NetworkImage(
                  rate.clientImage,
                ),
                fit: BoxFit.cover,
                width: 55.w,
                height: 55.h,
              )
            ],
          ),
        )
      ],
    );
  }
}
