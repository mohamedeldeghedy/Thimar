import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar/core/helper_methods.dart';
import 'package:thimar/core/input_validators.dart';
import 'package:thimar/screens/auth/login/bloc/bloc.dart';
import 'package:thimar/screens/home/view.dart';
import 'package:thimar/shared/have_account_or_not.dart';
import 'package:thimar/shared/head_lines.dart';
import 'package:thimar/shared/input.dart';
import '../../../generated/locale_keys.g.dart';
import '../../../shared/res/colors.dart';
import '../../../shared/my_button.dart';
import '../../../shared/show_toast.dart';
import '../forget_password/view.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final bloc = KiwiContainer().resolve<LoginBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: bloc.formKey,
          child: Column(
            children: [
              AuthHeader(
                header: LocaleKeys.helloAgain.tr(),
                subtitle: LocaleKeys.loginNow.tr(),
                changePhoneNum: false,
              ),
              Input(
                validate: validatePhone,
                controller: bloc.phoneController,
                type: TextInputType.number,
                label: LocaleKeys.phoneNumber.tr(),
                isPhone: true,
                prefix: const Icon(Icons.phone),
              ),
              Input(
                validate: validatePassword,
                controller: bloc.passwordController,
                type: TextInputType.number,
                label: LocaleKeys.password.tr(),
                prefix: const Icon(Icons.lock_open),
              ),
              Container(
                  alignment: AlignmentDirectional.topEnd,
                  child: TextButton(
                      onPressed: () {
                        navigateTo(context, page: const ForgetPassword());
                      },
                      child: Text(
                        LocaleKeys.forgetPassword.tr(),
                        style: TextStyle(color: grey),
                      ))),
              BlocConsumer(
                bloc: bloc,
                listener: (context, state) {
                  if (state is LoginSuccessState) {
                    showToast(
                        msg: state.msg, state: ToastStates.success);
                    navigateTo(context, page: const Home(), withHistory: false);
                  }
                  if (state is LoginFailedState) {
                    showToast(msg: state.msg, state: ToastStates.error);
                  }
                },
                builder: (context, state) {
                  return MyButton(
                      buttonName: LocaleKeys.login.tr(),
                      isLoading: state is LoginLoadingState,
                      onPressed: () {
                        if (bloc.formKey.currentState!.validate()) {
                          bloc.add(PostLoginEvent());
                        }
                      });
                },
              ),
              HaveAccounts(
                heightSizedBox: 45.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
