import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar/screens/balance/bloc/bloc.dart';
import 'package:thimar/shared/res/colors.dart';
import 'package:thimar/shared/input.dart';
import 'package:thimar/shared/my_app_bar.dart';
import 'package:thimar/shared/my_button.dart';
import 'package:thimar/shared/show_toast.dart';

import '../../generated/locale_keys.g.dart';

class BalanceScreen extends StatefulWidget {
  const BalanceScreen({Key? key}) : super(key: key);

  @override
  State<BalanceScreen> createState() => _BalanceScreenState();
}

class _BalanceScreenState extends State<BalanceScreen> {
  final bloc=KiwiContainer().resolve<BalanceBloc>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
        child: BlocConsumer(
          bloc:bloc ,
          listener:(context, state) {
            if(state is PostBalanceSuccessState){
              showToast(msg: state.msg, state: ToastStates.success);
            }
            if(state is PostBalanceFailedState){
              showToast(msg: state.msg, state: ToastStates.error);

            }
          },
          builder:(context, state) {
           return MyButton(
               buttonName: LocaleKeys.payment.tr(),
               buttonColor: green,
               isLoading: state is PostBalanceLoadingState,
               fontColor: white,
               onPressed: () {
                 bloc.add(PostBalanceEvent());
               });
          },
        ),
      ),
      appBar:MyAppBar(
        title: LocaleKeys.chargeNow.tr(),
        leadingIcon: true,
        backOnPressed: (){},
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsetsDirectional.only(top: 63.h,bottom: 22.h),
                padding: EdgeInsets.symmetric(horizontal: 8.0.r),
                child: Text(textAlign: TextAlign.end,
                  LocaleKeys.moneyInfo.tr(),
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    color: green,
                  ),
                ),
              ),
              Input(
                controller: bloc.amountController,
                label: LocaleKeys.yourMoneyInfo.tr(),
                type: TextInputType.number,
                color: Colors.grey[100],
              ),



            ],
          ),
        ],
      ),
    );
  }
}

// Container(
//   margin: EdgeInsetsDirectional.only(top: 40.h,bottom: 22.h),
//   padding: EdgeInsets.symmetric(horizontal: 8.0.w),
//   child: Text(LocaleKeys.IdInfo.tr(),
//       style: TextStyle(
//           fontSize: 15.sp,
//           fontWeight: FontWeight.bold,
//           color: green)),
// ),
// Input(
//   label: LocaleKeys.name.tr(),
//   type: TextInputType.text,
//   color: Colors.grey[100],
// ),
// SizedBox(
//   height: 20.h,
// ),
// Input(
//   label: LocaleKeys.creditCardNum.tr(),
//   type: TextInputType.number,
//   color: Colors.grey[100],
// ),
// SizedBox(height: 20.h,),
// Row(
//   children: [
//     Expanded(
//       child: Input(
//         label: LocaleKeys.validDate.tr(),
//         type: TextInputType.number,
//         color: Colors.grey[100],
//       ),
//     ),
//     SizedBox(
//       width: 17.w,
//     ),
//     Expanded(
//       child: Input(
//         label: LocaleKeys.serialNumber.tr(),
//         type: TextInputType.number,
//         color: Colors.grey[100],
//       ),
//     ),
//   ],
// ),