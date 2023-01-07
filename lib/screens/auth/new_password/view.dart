import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar/core/helper_methods.dart';
import 'package:thimar/core/input_validators.dart';
import 'package:thimar/shared/head_lines.dart';
import 'package:thimar/shared/input.dart';
import 'package:thimar/shared/show_toast.dart';

import '../../../generated/locale_keys.g.dart';
import '../../../shared/have_account_or_not.dart';
import '../../../shared/my_button.dart';
import '../login/view.dart';
import 'bloc/bloc.dart';

class NewPasswordScreen extends StatefulWidget {
  final String phone;
  final String code;
  const NewPasswordScreen({Key? key, required this.phone, required this.code})
      : super(key: key);

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  final bloc = KiwiContainer().resolve<NewPasswordBloc>();
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
                  subtitle: LocaleKeys.enterNewPassword.tr(),
                  changePhoneNum: false),
              Input(
                prefix: const Icon(Icons.lock_open_outlined),
                label: LocaleKeys.password.tr(),
                type: TextInputType.text,
                controller: bloc.passController,
                validate: validatePassword,
              ),
              Input(
                prefix: const Icon(Icons.lock_open_outlined),
                label: LocaleKeys.password.tr(),
                validate: validatePassword,
              ),
              BlocConsumer(
                listener: (context, state) {
                  if (state is NewPasswordSuccessState) {
                    showToast(msg: state.msg, state: ToastStates.success);
                    navigateTo(context,
                        page: const LoginScreen(), withHistory: false);
                  }
                  if (state is NewPasswordFailedState) {
                    showToast(msg: state.msg, state: ToastStates.error);
                  }
                },
                bloc: bloc,
                builder: (context, state) {
                  return MyButton(
                    buttonName: LocaleKeys.changePassword.tr(),
                    isLoading: state is NewPasswordLoadingState,
                    sizedBoxHeight: 25.h,
                    onPressed: () {
                      if (bloc.formKey.currentState!.validate()) {
                        bloc.add(PostNewPasswordEvent(
                            phone: widget.phone, code: widget.code));
                      }
                    },
                  );
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
