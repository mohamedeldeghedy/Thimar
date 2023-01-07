import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/screens/order_complete/components/order_detail.dart';
import '../../core/helper_methods.dart';
import '../../generated/locale_keys.g.dart';
import '../../shared/my_app_bar.dart';
import '../../shared/my_button.dart';
import '../../shared/res/colors.dart';
import '../../shared/text.dart';
import '../home/pages/my_order/components/order.dart';
import '../home/view.dart';
class OrderCompleteScreen extends StatefulWidget {
  const OrderCompleteScreen({Key? key}) : super(key: key);

  @override
  State<OrderCompleteScreen> createState() => _OrderCompleteScreenState();
}

class _OrderCompleteScreenState extends State<OrderCompleteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar:  MyAppBar(
        title: LocaleKeys.completeOrder.tr(),
       backOnPressed: (){
          Navigator.pop(context);
       },
      ),
     bottomNavigationBar: MyButton(
       buttonName: LocaleKeys.finishOrder.tr(),

       onPressed: () {
         showModalBottomSheet(
           context: context,
           shape:  RoundedRectangleBorder(
             borderRadius: BorderRadius.only(
               topRight: Radius.circular(40.r),
               topLeft: Radius.circular(40.r),
             ),
           ),
           builder: (context) => SingleChildScrollView(
             child: Column(
               children: [
                  Padding(
                   padding: EdgeInsets.only(
                     right: 62.r,
                     left: 65.r,
                     top: 17.r,
                   ),
                   child: const Image(image: AssetImage('assets/icons/thanks.png')),
                 ),
                 SizedBox(
                   height: 22.3.h,
                 ),
                 HeadText(
                   text: LocaleKeys.thanksOrderDone.tr(),
                 ),
                 SizedBox(
                   height: 13.h,
                 ),
                 Text(LocaleKeys.youCanFollowTheOrderAndFinish.tr(),
                     style: TextStyle(fontSize: 17.sp, color: Colors.grey)),
                 SizedBox(
                   height: 31.h,
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     MyButton(
                       buttonName: LocaleKeys.my_orders.tr(),
                       onPressed: () {
                         navigateTo(context,page: const OrderScreen(),withHistory: false );
                       },
                       buttonWidth: 163.w,
                       buttonHeight: 60.h,
                     ),
                     SizedBox(
                       width: 16.w,
                     ),
                     MyButton(
                       buttonName: LocaleKeys.home.tr(),
                       onPressed: () {
                         navigateTo(context,page: const Home(),withHistory: false);
                       },
                       buttonWidth: 163.w,
                       buttonHeight: 60.h,
                       buttonColor: white,
                       fontColor: green,
                     ),
                   ],
                 ),
                 SizedBox(
                   height: 20.h,
                 )
               ],
             ),
           ),
         );
       },
     ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.all(16.0.r),
              child: Column(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                   OrderDetail(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
