import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar/core/cache_helper.dart';
import 'package:thimar/core/helper_methods.dart';
import 'package:thimar/core/input_validators.dart';
import 'package:thimar/edit_pass/view.dart';
import 'package:thimar/shared/icons.dart';
import 'package:thimar/shared/my_button.dart';
import 'package:thimar/shared/show_toast.dart';
import '../../generated/locale_keys.g.dart';
import '../../shared/res/colors.dart';
import '../../shared/input.dart';
import '../../shared/my_app_bar.dart';
import 'bloc/bloc.dart';

class PersonalDataScreen extends StatefulWidget {
  const PersonalDataScreen({Key? key}) : super(key: key);

  @override
  State<PersonalDataScreen> createState() => _PersonalDataScreenState();
}

class _PersonalDataScreenState extends State<PersonalDataScreen> {
  final bloc = KiwiContainer().resolve<ProfileBloc>()..add(GetProfileEvent());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: LocaleKeys.personalInfo.tr(),
        leadingIcon: true,
        backOnPressed: () {
          Navigator.pop(context);
        },
      ),
      body: BlocBuilder(
        bloc: bloc,
        builder: (context, state) {
          if (bloc.profile ==null) {
            return const CircularProgressIndicator();
          }
          if (state is GetProfileFailedState) {
            return Center(child: Text(state.msg));
          }
         else {
            return SingleChildScrollView(
            child: Form(
              key: bloc.formKey,
              child: Column(
                children: [
                  Container(
                    width: 88.w,
                    height: 83.h,
                    margin: EdgeInsets.only(top: 33.h, bottom: 2.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r)),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Image.network(CacheHelper.getImage()),
                  ),
                  Text(CacheHelper.getFullName(),
                      style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold,
                          color: green)),
                  SizedBox(
                    height: 4.h,
                  ),
                  Text(CacheHelper.getPhone(),
                      style: TextStyle(
                          fontSize: 17.sp, color: const Color(0xffA7A7A7))),
                  SizedBox(
                    height: 18.h,
                  ),
                  Input(
                    validate: validateName,
                    fontColor: green,
                    color: grey.withOpacity(0.1),
                    controller: bloc.nameController,
                    label: LocaleKeys.userName.tr(),
                    prefix: Padding(
                      padding: EdgeInsets.all(15.0.r),
                      child: Image(
                          width: 16.11.w,
                          height: 20.71.h,
                          color: green,
                          image: const AssetImage(
                            person,
                          )),
                    ),
                    hint: LocaleKeys.userName.tr(),
                  ),
                  Input(
                    validate: validateName,
                    isPhone: true,
                    fontColor: green,
                    color: grey.withOpacity(0.1),
                    controller: bloc.phoneController,
                    label: LocaleKeys.phoneNumber.tr(),
                    prefix: Padding(
                      padding: EdgeInsets.all(15.0.r),
                      child: Image(
                          height: 20.71.h,
                          width: 16.11.w,
                          color: green,
                          image: const AssetImage(
                            calling,
                          )),
                    ),
                    hint: CacheHelper.getPhone(),
                  ),
                  Input(
                    fontColor: green,
                    color: grey.withOpacity(0.1),
                    label: LocaleKeys.city.tr(),
                    prefix: Padding(
                      padding: EdgeInsets.all(15.0.r),
                      child: Image(
                          width: 16.11.w,
                          height: 20.71.h,
                          color: green,
                          image: const AssetImage(
                            flag,
                          )),
                    ),
                    hint: bloc.profile!.data.city.name,
                  ),
                  InkWell(
                    onTap: () {
                      navigateTo(context, page: const EditPasswordScreen());
                    },
                    child: Container(
                      height: 60.h,
                      width: 355.w,
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          color: grey.withOpacity(0.1)),
                      child: Row(
                        children: [
                          Image(
                              color: green,
                              height: 20.5.h,
                              width: 18.22.w,
                              image: const AssetImage(unlock)),
                          SizedBox(
                            width: 10.w,
                          ),
                          const Text('كلمة المرور'),
                          const Spacer(),
                          Image(
                              color: grey.withOpacity(0.5),
                              height: 18.h,
                              width: 18.w,
                              image: const AssetImage(arrowLeft))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  BlocConsumer(
                    listener: (context, state) {
                      if (state is EditProfileSuccessState) {
                        showToast(msg: state.msg, state: ToastStates.success);
                      }
                      if (state is EditProfileFailedState) {
                        showToast(msg: state.msg, state: ToastStates.error);
                      }
                    },
                    bloc: bloc,
                    builder: (context, state) {
                      return MyButton(
                        buttonName: LocaleKeys.editDetails.tr(),
                        isLoading: state is EditProfileLoadingState,
                        onPressed: () {
                          if (bloc.formKey.currentState!.validate()) {
                            bloc.add(EditUserDataEvent());
                          }
                        },
                      );
                    },
                  )
                ],
              ),
            ),
          );
          }
        },
      ),
    );
  }
}
