import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:thimar/generated/locale_keys.g.dart';
import 'package:thimar/screens/account_activation/bloc/bloc.dart';
import 'package:thimar/shared/show_toast.dart';

import '../../core/helper_methods.dart';
import '../../shared/code_receive.dart';
import '../../shared/res/colors.dart';
import '../../shared/have_account_or_not.dart';
import '../../shared/head_lines.dart';
import '../../shared/my_button.dart';
import '../auth/login/view.dart';

class AccountActivationScreen extends StatefulWidget {
  final String phone;
  const AccountActivationScreen({Key? key, required this.phone}) : super(key: key);

  @override
  State<AccountActivationScreen> createState() => _AccountActivationState();
}

class _AccountActivationState extends State<AccountActivationScreen> {
  final bloc = KiwiContainer().resolve<VerificationBloc>();
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
              phone: widget.phone,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.r),
              child: PinCodeTextField(
                length: 4,
                obscureText: false,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 60.h,
                  fieldWidth: 65.75.w,
                  activeFillColor: Colors.white,
                  inactiveColor: white,
                  activeColor: white,
                  inactiveFillColor: grey.withOpacity(0.1),
                ),
                animationDuration: const Duration(milliseconds: 300),
                backgroundColor: Colors.white,
                enableActiveFill: true,
                errorAnimationController: bloc.errorController,
                controller: bloc.textEditingController,
                onCompleted: (v) {
                  if (kDebugMode) {
                    print("Completed");
                  }
                  bloc.add(PostVerificationCodeEvent(phone: widget.phone));
                },
                onChanged: (value) {},
                beforeTextPaste: (text) {
                  if (kDebugMode) {
                    print("Allowing to paste $text");
                  }
                  return true;
                },
                appContext: context,
              ),
            ),
            SizedBox(
              height: 37.h,
            ),
            BlocConsumer(
              listener: (context, state) {
                if (state is PostVerificationSuccessState) {
                  showToast(
                      msg: state.msg, state: ToastStates.success);
                  navigateTo(context,
                      page: const LoginScreen(), withHistory: false);
                }
                if (state is PostVerificationFailedState) {
                  showToast(msg: state.msg, state: ToastStates.error);
                }
              },
              bloc: bloc,
              builder: (context, state) {

                return MyButton(
                    buttonName: LocaleKeys.confirmCode.tr(),
                    isLoading: state is PostVerificationLoadingState ,
                    onPressed: () {
                      bloc.add(PostVerificationCodeEvent(phone: widget.phone));
                    });
              },
            ),
            SizedBox(
              height: 27.h,
            ),
            CodeRecieve(),
            HaveAccounts(
              isHave: true,
              heightSizedBox: 45.h,
            )
          ],
        ),
      ),
    );
  }
}
