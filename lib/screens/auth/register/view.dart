import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar/core/helper_methods.dart';
import 'package:thimar/screens/account_activation/view.dart';
import 'package:thimar/screens/auth/register/bloc/bloc.dart';
import 'package:thimar/shared/show_toast.dart';
import '../../../core/input_validators.dart';
import '../../../generated/locale_keys.g.dart';
import '../../../shared/have_account_or_not.dart';
import '../../../shared/head_lines.dart';
import '../../../shared/input.dart';
import '../../../shared/my_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final bloc = KiwiContainer().resolve<RegisterBloc>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Form(
        key: bloc.formKey,
        child: Column(
          children: [
            AuthHeader(
              header: LocaleKeys.helloAgain.tr(),
              subtitle: LocaleKeys.youCanRegisterNow.tr(),
            ),
            Input(
              validate: validateName,
              controller: bloc.nameController,
              label: LocaleKeys.userName.tr(),
              prefix: const Icon(Icons.person),
            ),
            Input(
              validate: validatePhone,
              type: TextInputType.number,
              controller: bloc.phoneController,
              label: LocaleKeys.phoneNumber.tr(),
              isPhone: true,
              prefix: const Icon(Icons.phone),
            ),
            Input(
              validate: validatePassword,
              type: TextInputType.number,
              label: LocaleKeys.password.tr(),
              controller: bloc.passwordController,
              prefix: const Icon(Icons.lock_open),
            ),
            // Input(
            //   validate: (String? value){
            //     if(value!.isEmpty) {
            //       return 'city must not be empty';
            //     }
            //     return null;
            //     },
            //   prefix: Icons.flag,
            //   label: LocaleKeys.city.tr(),
            //   controller: bloc.cityController,
            //   type: TextInputType.text,
            //   onSubmit: (value)
            //   {
            //     bloc.cityController.text=value;
            //     print(bloc.cityController.text);
            //   },
            // ),
            Input(
              validate: validatePassword,
              prefix: const Icon(Icons.lock_open_outlined),
              label: LocaleKeys.confirmPassword.tr(),
              controller: bloc.passwordController,
            ),
            BlocConsumer(
              listener: (context, state) {
                if (state is RegisterSuccessState) {
                  showToast(msg: state.msg, state: ToastStates.success);
                  navigateTo(context,
                      page: AccountActivation(
                        phone: bloc.phoneController.text,
                      ),
                      withHistory: false);
                }
                if (state is RegisterFailedState) {
                  showToast(msg: state.msg, state: ToastStates.error);
                }
              },
              bloc: bloc,
              builder: (context, state) {
                return MyButton(
                    buttonName: LocaleKeys.register.tr(),
                    isLoading: state is RegisterLoadingState,
                    onPressed: () {
                      if (bloc.formKey.currentState!.validate()) {
                        bloc.add(PostRegisterEvent());
                      }
                    });
              },
            ),
            HaveAccounts(
              isHave: true,
              heightSizedBox: 45.h,
            ),
          ],
        ),
      ),
    ));
  }
}
