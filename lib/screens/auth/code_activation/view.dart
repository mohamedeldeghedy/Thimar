import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:thimar/core/helper_methods.dart';
import 'package:thimar/shared/code_receive.dart';
import 'package:thimar/shared/res/colors.dart';
import 'package:thimar/shared/have_account_or_not.dart';
import 'package:thimar/shared/head_lines.dart';
import '../../../generated/locale_keys.g.dart';
import '../../../shared/my_button.dart';
import '../../../shared/show_toast.dart';
import '../new_password/view.dart';
import 'bloc/bloc.dart';


class CodeActivation extends StatefulWidget {
  final String phone;
  const CodeActivation({Key? key, required this.phone}) : super(key: key);

  @override
  State<CodeActivation> createState() => _CodeActivationState();
}

class _CodeActivationState extends State<CodeActivation> {
final bloc=KiwiContainer().resolve<ConfirmForgetPassCodeBloc>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AuthHeader(
              header: LocaleKeys.activeAccount.tr(),
              subtitle: LocaleKeys.enterOTPCode.tr(),
              changePhoneNum: true,
              phone:widget.phone,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.r),
              child: PinCodeTextField(
                length: 4,
                validator:(value){
                  if(value!.isEmpty){
                    return 'code must not be empty';
                  }
                  return null;
                } ,
                obscureText: false,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 60.h,
                  fieldWidth: 65.75.w,
                  activeFillColor: Colors.white,inactiveColor: white,activeColor: white,inactiveFillColor: grey.withOpacity(0.1),

                ),
                animationDuration: const Duration(milliseconds: 300),
                backgroundColor: Colors.white,
                enableActiveFill: true,
                errorAnimationController: bloc.errorController,
                controller: bloc.textEditingController,
                onCompleted: (v) {
                },
                onChanged: (value) {
                },
                beforeTextPaste: (text) {
                  if (kDebugMode) {
                    print("Allowing to paste $text");
                  }
                  return true;
                }, appContext: context,
              ),
            ),

            SizedBox(
              height: 37.h,
            ),
            BlocConsumer(
              listener: (context, state) {
                if(state is VerifyForgetPasswordSuccessState){
                  showToast(msg: state.msg, state: ToastStates.success);
                  navigateTo(context,page:NewPasswordScreen(
                    phone:widget.phone ,
                    code:bloc.textEditingController.text,
                  ),withHistory: false);
                }
                if(state is VerifyForgetPasswordFailedState){
                  showToast(msg: state.msg, state: ToastStates.error);
                }
              },
              bloc:bloc ,
              builder: (context, state) {

              return MyButton(
                    buttonName: LocaleKeys.confirmCode.tr(),
                    isLoading: state is VerifyForgetPasswordLoadingState,
                    onPressed: () {
                      bloc.add(PostVerifyForgetPasswordEvent(phone: widget.phone));
                    },
                    sizedBoxHeightBtm: 27.h);
              },

            ),
             CodeRecieve(phone: widget.phone),
            HaveAccounts(
              isHave: true,
              heightSizedBox: 45.h,
            ),
          ],
        ),
      ),
    );
  }
}
