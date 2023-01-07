import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/shared/icons.dart';

import '../../../../../shared/res/colors.dart';
import '../bloc/model.dart';

class ItemNotification extends StatelessWidget {
  final NotificationData notificationData;
   const ItemNotification({super.key,required this.notificationData});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            height: 33.h,
            width: 33.w,
            decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: Colors.grey.shade200)),
            child: Image(
                image: const AssetImage(note),
                width: 19.5.w,
                height: 19.5.h,
                color: green)),
        SizedBox(
          width: 10.w,
        ),
        Padding(
          padding: EdgeInsets.only(top: 25.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('تم قبول طلبك وجاري تحضيره الآن',
                  style: TextStyle(fontSize: 15.sp, color: Colors.black)),
              SizedBox(
                height: 6.h,
              ),
              SizedBox(
                width: 279.w,
                child: Text(
                    'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 11.sp, color: Colors.grey[500])),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text('منذ ساعتان',
                  style: TextStyle(fontSize: 12.sp, color: Colors.black)),
            ],
          ),
        )
      ],
    );
  }
}
