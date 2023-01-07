import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/core/cache_helper.dart';
import 'package:thimar/core/helper_methods.dart';
import 'package:thimar/screens/add_new_addresse/view.dart';
import 'package:thimar/shared/input.dart';
import 'package:thimar/shared/res/colors.dart';

import '../../../generated/locale_keys.g.dart';
import '../../../shared/text.dart';

class OrderDetail extends StatelessWidget {
  final dateController = TextEditingController();
  final timeController = TextEditingController();

  OrderDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(LocaleKeys.name.tr(),
                style: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.bold,
                    color: green)),
            Text(CacheHelper.getFullName(),
                style: TextStyle(
                    fontSize: 17.sp, fontWeight: FontWeight.bold, color: green))
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          children: [
            Text(LocaleKeys.phone.tr(),
                style: TextStyle(
                    fontSize: 17.sp, fontWeight: FontWeight.bold, color: green)),
            Text(CacheHelper.getPhone(),
                style: TextStyle(
                    fontSize: 17.sp, fontWeight: FontWeight.bold, color: green))
          ],
        ),
        SizedBox(
          height: 37.h,
        ),
        Column(
          children: [
            Row(
              children: [
                Text(LocaleKeys.chooseLocation.tr(),
                    style: TextStyle(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.bold,
                        color: green)),
                const Spacer(),
                InkWell(
                  onTap: (){
                    navigateTo(context,page: const AddNewAddresseScreen());
                  },
                  child: Container(
                      width: 30.w,
                      height: 30.h,
                      alignment: AlignmentDirectional.center,
                      decoration: BoxDecoration(
                           color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(13.r)),
                      child: Icon(Icons.add,color: green),
                      )),

              ],
            ),
            SizedBox(
              height: 11.h,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: white,
                    fixedSize: Size(339.w, 33.h),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r))),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    shape:  RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(40.r),
                            topLeft: Radius.circular(40.r))),
                    builder: (context) => Padding(
                      padding:  EdgeInsets.all(8.0.r),
                      child: Column(
                        children: [
                          HeadText(
                            text: LocaleKeys.addresses.tr(),
                          ),
                          SizedBox(
                            height: 29.h,
                          ),
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
                                    HeadText(
                                        text: LocaleKeys.house.tr(),
                                        fontSize: 15),
                                    const Spacer(),
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                        width: 24.w,
                                        height: 24.h,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20.r),
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
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20.r),
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
                                SizedBox(
                                  height: 2.h,
                                ),
                                Row(
                                  children: [
                                    Text(LocaleKeys.address.tr(),
                                        style: TextStyle(
                                            fontSize: 14.sp, color: green)),
                                    Text('119 طريق الملك عبدالعزيز',
                                        style: TextStyle(
                                            fontSize: 14.sp, color: green))
                                  ],
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Row(
                                  children: [
                                    Text(LocaleKeys.description.tr(),
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            color: Colors.grey)),
                                    Text('',
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            color: Colors.grey))
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(LocaleKeys.phoneNumber.tr(),
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            color: Colors.grey)),
                                    Text('',
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            color: Colors.grey))
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            foregroundDecoration: ShapeDecoration(
                                shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
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
                                    HeadText(
                                        text: LocaleKeys.work.tr(),
                                        fontSize: 15),
                                    const Spacer(),
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                        width: 24.w,
                                        height: 24.h,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20.r),
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
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20.r),
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
                                SizedBox(
                                  height: 2.h,
                                ),
                                Row(
                                  children: [
                                    Text(LocaleKeys.address.tr(),
                                        style: TextStyle(
                                            fontSize: 14.sp, color: green)),
                                    Text('119 طريق الملك عبدالعزيز',
                                        style: TextStyle(
                                            fontSize: 14.sp, color: green))
                                  ],
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Row(
                                  children: [
                                    Text(LocaleKeys.description.tr(),
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            color: Colors.grey)),
                                    Text('',
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            color: Colors.grey))
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(LocaleKeys.phoneNumber.tr(),
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            color: Colors.grey)),
                                    Text('',
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            color: Colors.grey))
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 19.h,
                          ),
                          SizedBox(
                            width: 342.w,
                            height: 54.h,
                            child: DottedBorder(
                              color: green,
                              radius: const Radius.circular(20),
                              borderType: BorderType.RRect,
                              strokeWidth: 1,
                              padding: const EdgeInsets.all(15),
                              child: Center(
                                child: Text(
                                  LocaleKeys.addNewAddress.tr(),
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: green),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                child: Row(
                  children: [
                    Text('العنوان',
                        style: TextStyle(fontSize: 15, color: green)),
                    const Spacer(),
                    Icon(
                      color: green,
                      Icons.keyboard_arrow_down_rounded,
                    )
                  ],
                ))
          ],
        ),
        SizedBox(
          height: 32.h,
        ),
        HeadText(text: LocaleKeys.selectTime.tr()),
        SizedBox(
          height: 13.h,
        ),
        Row(
          children: [
            SizedBox(
              width: 163.w,
              height: 60.h,
              child: TextFormField(

                onTap:() {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.parse('2030-05-30'),
                  ).then((value) {
                    if (kDebugMode) {
                      print(DateFormat.yMMMd().format(value!));
                      dateController.text = DateFormat.yMMMd().format(value);
                    }
                  });
                } ,
              controller:dateController ,
              keyboardType: TextInputType.datetime,
                decoration: InputDecoration(
                  label: Text(LocaleKeys.chooseDayAndDate.tr(),),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: green),
                      borderRadius: BorderRadius.circular(20.r)),
                  suffixIcon:  Icon(Icons.date_range,color: green),
                  contentPadding: EdgeInsets.all(15.r),
                  labelStyle: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 13.sp,
                  ),
                ),

              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            SizedBox(
              width: 163.w,
              height: 60.h,
              child: TextFormField(

                onTap:() {
                  showTimePicker(context: context, initialTime: TimeOfDay.now())
                      .then((value) {
                    if (kDebugMode) {
                      print(value?.format(context));
                      timeController.text = value!.format(context);
                    }
                  });
                } ,
                controller:timeController ,
                keyboardType: TextInputType.datetime,
                decoration: InputDecoration(label: Text( LocaleKeys.chooseTime.tr(),),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: green),
                      borderRadius: BorderRadius.circular(20.r)),
                  suffixIcon: Icon(Icons.timer_outlined,color: green),
                  contentPadding: EdgeInsets.all(15.r),
                  labelStyle: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 13.sp,
                  ),
                ),

              ),
            ),
          ],
        ),

        SizedBox(
          height: 22.h,
        ),
        HeadText(text: LocaleKeys.hintsAndInstructions.tr()),
        TextFormField(
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: green),
                borderRadius: BorderRadius.circular(20.r)),
            contentPadding:  EdgeInsets.symmetric(vertical: 50.r),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.r)),
          ),
          maxLines: 5, // <-- SEE HERE
          minLines: 1, // <-- SEE HERE
        ),
        SizedBox(
          height: 25.5.h,
        ),
        HeadText(text: LocaleKeys.chooserPaymentType.tr()),
        SizedBox(
          height: 19.h,
        ),
        Row(
          children: [
            InkWell(
              onTap: () {},
              child: Container(
                width: 98.w,
                height: 50.54.h,
                decoration: ShapeDecoration(
                    shape: OutlineInputBorder(
                        borderSide: BorderSide(color: green),
                        borderRadius: BorderRadius.circular(10))),
                child: Row(
                  children: [
                    Image(
                        color: green,
                        height: 30.61.h,
                        width: 40.91.w,
                        image: const NetworkImage(
                            'https://jarjasdesign.com/wp-content/uploads/2021/01/money.png')),
                    SizedBox(
                      width: 6.3.w,
                    ),
                    Text(LocaleKeys.cash.tr(),
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: green))
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 15.7.w,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                width: 98.w,
                height: 50.54.h,
                decoration: ShapeDecoration(
                    shape: OutlineInputBorder(
                        borderSide: BorderSide(color: green),
                        borderRadius: BorderRadius.circular(10))),
                child: Row(
                  children: [
                    SizedBox(
                      width: 20.6.w,
                    ),
                    Image(
                        color: Colors.grey,
                        height: 19.61.h,
                        width: 63.91.w,
                        image: const NetworkImage(
                            'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d6/Visa_2021.svg/1600px-Visa_2021.svg.png'))
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 15.7.w,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                width: 98.w,
                height: 50.54.h,
                decoration: ShapeDecoration(
                    shape: OutlineInputBorder(
                        borderSide: BorderSide(color: green),
                        borderRadius: BorderRadius.circular(10.r))),
                child: Row(
                  children: [
                    Image(
                        height: 40.61.h,
                        width: 90.91.w,
                        image: const NetworkImage(
                            'https://www.seekpng.com/png/small/794-7948448_mastercard-mastercard-logo-grayscale.png'))
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 15.7.w,
            ),
          ],
        ),
        SizedBox(
          height: 16.h,
        ),
        HeadText(text: LocaleKeys.orderPref.tr()),
        SizedBox(
          height: 13.h,
        ),
        Container(
          height: 145.h,
          width: 342.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r), color: Colors.grey[200]),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(LocaleKeys.allProducts.tr(),
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            color: green)),
                    const Spacer(),
                    Text('180 ر.س',
                        style: TextStyle(
                            fontSize: 15.r,
                            fontWeight: FontWeight.bold,
                            color: green))
                  ],
                ),
                SizedBox(
                  height: 11.h,
                ),
                Row(
                  children: [
                    Text(LocaleKeys.deliveryPrice.tr(),
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            color: green)),
                    const Spacer(),
                    Text('40 ر.س',
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            color: green))
                  ],
                ),
                SizedBox(
                  height: 11.h,
                ),
                Row(
                  children: [
                    Text(LocaleKeys.discount.tr(),
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            color: green)),
                    const Spacer(),
                    Text('-40 ر.س',
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            color: green))
                  ],
                ),
                SizedBox(
                  height: 11.h,
                ),
                Row(
                  children: [
                    Text(LocaleKeys.total.tr(),
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            color: green)),
                    const Spacer(),
                    Text('180 ر.س',
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            color: green))
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 60.h,
        )
      ],
    );
  }
}
