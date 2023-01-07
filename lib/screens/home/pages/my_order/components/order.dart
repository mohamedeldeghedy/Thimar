import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/shared/sub_text.dart';
import 'package:thimar/shared/text.dart';

import '../../../../../generated/locale_keys.g.dart';
import '../../../../../shared/res/colors.dart';
import '../../../../../shared/my_app_bar.dart';
import '../../../../../shared/my_button.dart';


class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            MyAppBar(
              title: LocaleKeys.orderDetails.tr(),
              fontSize: 19,
              backOnPressed: () {
                Navigator.pop(context);
              },
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 21.h,
                  ),
                  Container(
                    width: 365.w,
                    height: 140.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r)),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text('طلب #4587',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: green)),
                              const Spacer(),
                              Container(
                                  width: 95.w,
                                  height: 23.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.grey[200]),
                                  child: Center(
                                      child: HeadText(
                                          text: LocaleKeys.pending.tr(),
                                          fontSize: 11))),
                            ],
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Row(
                            children: [
                              Text('27,يونيو,2021',
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      color: Colors.grey[400])),
                              const Spacer(),
                              Text('180 ر.س',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: green))
                            ],
                          ),
                          SizedBox(
                            height: 16.7.h,
                          ),
                          Row(
                            children: [
                              Container(
                                  width: 25.w,
                                  height: 25.h,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(20.r)),
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
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(20.r)),
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
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(20.r)),
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
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Center(
                                      child: Text('2+',
                                          style: TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.bold,
                                              color: green)))),
                              const Spacer(),
                              InkWell(
                                  onTap: () {},
                                  child: Image(
                                    image: const AssetImage(
                                        'assets/icons/left_arrow.png'),
                                    height: 24.h,
                                    width: 24.w,
                                  ))
                            ],
                          ),
                        ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: HeadText(
                      text: LocaleKeys.deliveryAddress.tr(),
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(
                    width: 343.w,
                    height: 83.h,
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HeadText(
                                text: LocaleKeys.house.tr(),
                                fontSize: 15,
                                sizeHeight: 5.h),
                            SubText(
                              text: 'شقة 40',
                              fontSize: 12.sp,
                              color: Colors.grey[400],
                              sizeHeight: 4.h,
                            ),
                            SubText(
                              text: 'شارع العليا الرياض 12521 السعودية',
                              fontSize: 12.sp,
                              color: Colors.black,
                              sizeHeight: 4.h,
                            ),
                          ],
                        ),
                        const Spacer(),
                        Image(
                            height: 62.h,
                            width: 72.w,
                            image:
                                const AssetImage('assets/icons/location.png'))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  HeadText(
                    text: LocaleKeys.orderPref.tr(),
                    fontSize: 17,
                    sizeHeight: 19.h,
                  ),
                  Container(
                    height: 145.h,
                    width: 342.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[100]),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(LocaleKeys.allProducts.tr(),
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: green)),
                              const Spacer(),
                              Text('180 ر.س',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: green))
                            ],
                          ),
                          Row(
                            children: [
                              Text(LocaleKeys.deliveryPrice.tr(),
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: green)),
                              const Spacer(),
                              Text('40 ر.س',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: green))
                            ],
                          ),
                          Row(
                            children: [
                              Text(LocaleKeys.total.tr(),
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: green)),
                              const Spacer(),
                              Text('220 ر.س',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: green))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SubText(
                                  text: LocaleKeys.payWith.tr(),
                                  fontSize: 15,
                                  color: green,
                                  sizeWidth: 16.3.w),
                              Image(
                                  height: 15.h,
                                  width: 50.w,
                                  image: const NetworkImage(
                                      'https://avatars.mds.yandex.net/i?id=d7de6c86b1be33872994ac42f4acb265-5318046-images-thumbs&ref=rim&n=33&w=297&h=113'))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  MyButton(
                    buttonName: LocaleKeys.cancelOrder.tr(),
                    sizedBoxHeight: 182.h,
                    sizedBoxHeightBtm: 17.h,
                    onPressed: () {},
                    fontColor: Colors.red,
                    buttonColor: Colors.red[100],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
