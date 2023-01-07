import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/core/helper_methods.dart';
import 'package:thimar/screens/home/pages/my_order/model.dart';
import 'package:thimar/shared/res/colors.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../../my_personal_data/view.dart';

class OrderFinishedScreen extends StatelessWidget {
  final OrderData finishedOrderData;
  const OrderFinishedScreen({Key? key, required this.finishedOrderData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigateTo(context, page: const PersonalDataScreen());
      },
      child: Container(
        width: 342.w,
        height: 100.h,
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              Text('طلب ${finishedOrderData.id}',
                  style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.bold,
                      color: green)),
              const Spacer(),
              Container(
                  width: 70.w,
                  height: 23.h,
                  alignment: AlignmentDirectional.center,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(20.r)),
                  child: Text(finishedOrderData.status,
                      style: TextStyle(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.bold,
                          color: grey)))
            ],
          ),
          Text(finishedOrderData.date,
              style: TextStyle(fontSize: 14.sp, color: Colors.grey[200])),
          SizedBox(
            height: 14.5.h,
          ),
          Row(
            children: [
              Container(
                  width: 25.w,
                  height: 25.h,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20.r)),
                  child: const Image(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/89/Tomato_je.jpg/100px-Tomato_je.jpg'))),
              SizedBox(
                width: 3.w,
              ),
              Container(
                  width: 25.w,
                  height: 25.h,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20.r)),
                  child: const Image(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                          'https://catherineasquithgallery.com/uploads/posts/2021-03/1614550018_48-p-morkov-na-belom-fone-52.jpg'))),
              SizedBox(
                width: 3.w,
              ),
              Container(
                  width: 25.w,
                  height: 25.h,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20.r)),
                  child: const Image(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                          'https://avatars.mds.yandex.net/i?id=1b1f0f6321e3e5bb971256e1426a48b9258603ec-7042882-images-thumbs&n=13'))),
              SizedBox(
                width: 3.w,
              ),
              Container(
                  height: 25.h,
                  width: 25.w,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(15.r)),
                  child: Center(
                      child: Text('2+',
                          style: TextStyle(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.bold,
                              color: green)))),
              const Spacer(),
              Text('${finishedOrderData.totalPrice} ر.س',
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: green))
            ],
          )
        ]),
      ),
    );
  }
}
