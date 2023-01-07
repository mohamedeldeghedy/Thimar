import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar/generated/locale_keys.g.dart';
import 'package:thimar/shared/res/colors.dart';
import 'package:thimar/shared/show_toast.dart';

import '../screens/auth/code_activation/bloc/bloc.dart';

class CodeRecieve extends StatelessWidget {
  final String? phone;
   CodeRecieve({Key? key,this.phone}) : super(key: key);
final bloc=KiwiContainer().resolve<ConfirmForgetPassCodeBloc>();
final countDownController=CountDownController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         Text(LocaleKeys.notHaveCode.tr()),
         Text(LocaleKeys.youCanSendCodeAgainAfter.tr()),
        CircularCountDownTimer(
          width: 75.w,
          height: 75.h,
          duration: 65,
          initialDuration:0,
          isReverse: true,
          fillColor: white,
          ringColor: green,
          autoStart: true,
          controller:countDownController ,
        ),
        SizedBox(height: 19.8.h,),
        BlocConsumer(
          listener:(context, state) {
            if(state is ResendCodeSuccessState){
              showToast(msg: state.msg, state: ToastStates.success);
              countDownController.reset();
              countDownController.restart();

            }
            if(state is ResendCodeFailedState){
              showToast(msg: state.msg, state: ToastStates.error);
            }
          },
          bloc:bloc ,
          builder:(context, state) {
            return   SizedBox(
            width: 133.w,height: 47.h,
            child: ElevatedButton(
            onPressed: () {
              bloc.add(ResendCodeEvent(phone: phone!));
            },
            style: ElevatedButton.styleFrom(
            fixedSize:  Size(343.w,60.h), backgroundColor: white,
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r)
            )
            ),
            child: Text(LocaleKeys.resend.tr(),
            style: TextStyle(
            color: green, fontSize: 15.sp, fontWeight: FontWeight.bold)),
            ),
            );
          },

        )
      ],
    );
  }
}
