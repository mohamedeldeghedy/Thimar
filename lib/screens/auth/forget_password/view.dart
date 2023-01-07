import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar/core/helper_methods.dart';
import 'package:thimar/screens/auth/code_activation/view.dart';
import 'package:thimar/screens/auth/forget_password/bloc/bloc.dart';
import 'package:thimar/shared/have_account_or_not.dart';
import 'package:thimar/shared/head_lines.dart';
import 'package:thimar/shared/input.dart';
import 'package:thimar/shared/show_toast.dart';
import '../../../core/input_validators.dart';
import '../../../generated/locale_keys.g.dart';
import '../../../shared/my_button.dart';
class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key,}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final bloc=KiwiContainer().resolve<ForgetPasswordBloc>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: bloc.formKey,
          child: Column(
            children: [
              AuthHeader(
                header: LocaleKeys.forgetPassword.tr(),
                subtitle: LocaleKeys.enterConnectedPhone.tr(),
                changePhoneNum: false,
              ),
              Input(
                validate:validatePhone,
                isPhone: true,
                controller:bloc.phoneController,
                prefix: const Icon(Icons.phone),
                label: LocaleKeys.phoneNumber.tr(),
                type: TextInputType.number,
              ),
              BlocConsumer(
                listener:(context, state) {
                  if(state is ForgetPasswordSuccessState){
                    showToast(msg: state.msg, state: ToastStates.success);
                    navigateTo(context,page: CodeActivation(phone: bloc.phoneController.text,),);
                  }
                  if(state is ForgetPasswordFailedState){
                    showToast(msg: state.msg, state: ToastStates.error);
                  }
                },
                bloc:bloc ,
                builder:(context, state) {
                return MyButton(
                      buttonName: LocaleKeys.confirmPhoneNumber.tr(),
                      isLoading: state is ForgetPasswordLoadingState,
                      onPressed: () {
                        if(bloc.formKey.currentState!.validate()) {
                          bloc.add(PostPhoneNumberEvent());
                        }


                      });
                },

              ),
              HaveAccounts(
                isHave: true,
                heightSizedBox: 45.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
