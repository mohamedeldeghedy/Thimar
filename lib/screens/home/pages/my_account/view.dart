import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar/core/cache_helper.dart';
import 'package:thimar/core/helper_methods.dart';
import 'package:thimar/screens/about_app/view.dart';
import 'package:thimar/screens/add_new_addresse/view.dart';
import 'package:thimar/screens/my_personal_data/view.dart';
import 'package:thimar/screens/payment/view.dart';
import 'package:thimar/shared/res/colors.dart';
import 'package:thimar/shared/icons.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../auth/login/view.dart';
import '../../../my_wallet/view.dart';
import 'bloc/bloc.dart';
import 'components/my_account_buttons.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final bloc = KiwiContainer().resolve<MyAccountBloc>()
    ..add(GetMyAccountEvent());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              BlocBuilder(
                bloc: bloc,
                builder: (context, state) {
                  if (state is GetMyAccountLoadingState) {
                    return const CircularProgressIndicator();
                  } else if (state is GetMyAccountSuccessState) {
                    return Container(
                      height: 217.h,
                      width: 375.w,
                      decoration: BoxDecoration(
                          color: green,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(25.r),
                              bottomRight: Radius.circular(25.r))),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 43.h,
                          ),
                          Text(LocaleKeys.my_account.tr(),
                              style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                  color: white)),
                          SizedBox(
                            height: 10.h,
                          ),
                          Container(
                            width: 76.w,
                            height: 71.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.r)),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Image(
                              image: NetworkImage(
                                CacheHelper.getImage(),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Text(CacheHelper.getFullName(),
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                  color: white)),
                          SizedBox(
                            height: 4.h,
                          ),
                          Text(CacheHelper.getPhone(),
                              style: TextStyle(
                                  fontSize: 14.sp, color: Colors.grey[500])),
                        ],
                      ),
                    );
                  } else {
                    return const Text('Failed');
                  }
                },
              ),
              SizedBox(
                height: 19.h,
              ),
              SizedBox(
                width: 342.w,
                height: 222.h,
                child: Column(
                  children: [
                    MyAccountButton(
                      image: person,
                      text: LocaleKeys.personalInfo.tr(),
                      onTap: () {
                        navigateTo(context, page: const PersonalDataScreen());
                      },
                      width: 14.w,
                    ),
                    MyAccountButton(
                      image: wallet,
                      text: LocaleKeys.wallet.tr(),
                      onTap: () {
                        navigateTo(context, page: const WalletScreen());
                      },
                      width: 18.w,
                    ),
                    MyAccountButton(
                      image: location,
                      text: LocaleKeys.addAddress.tr(),
                      onTap: () {
                        navigateTo(context, page: const AddNewAddresseScreen());
                      },
                      width: 16.w,
                    ),
                    MyAccountButton(
                      image: dollar,
                      text: LocaleKeys.payment.tr(),
                      onTap: () {
                        navigateTo(context, page: const PaymentScreen());
                      },
                      width: 19.w,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                width: 342.w,
                height: 277.h,
                child: Column(
                  children: [
                    MyAccountButton(
                      image: question,
                      text: LocaleKeys.knownQuestions.tr(),
                      onTap: () {},
                      width: 16.w,
                    ),
                    MyAccountButton(
                      image: check,
                      text: LocaleKeys.privacyPolicy.tr(),
                      onTap: () {},
                      width: 18.w,
                    ),
                    MyAccountButton(
                      image: calling,
                      text: LocaleKeys.contactWithUs.tr(),
                      onTap: () {},
                      width: 18.w,
                    ),
                    MyAccountButton(
                      image: edit,
                      text: LocaleKeys.suggestions.tr(),
                      onTap: () {},
                      width: 18.w,
                    ),
                    MyAccountButton(
                      image: share,
                      text: LocaleKeys.shareApp.tr(),
                      onTap: () {},
                      width: 18.w,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                width: 342.w,
                height: 222.h,
                child: Column(
                  children: [
                    MyAccountButton(
                      image: info,
                      text: LocaleKeys.aboutApp.tr(),
                      onTap: () {
                        navigateTo(context, page: const AboutAppScreen());
                      },
                      width: 18.w,
                    ),
                    MyAccountButton(
                      image: lang,
                      text: LocaleKeys.changeLanguage.tr(),
                      onTap: () {},
                      width: 18.w,
                    ),
                    MyAccountButton(
                      image: condition,
                      text: LocaleKeys.conditions.tr(),
                      onTap: () {},
                      width: 18.w,
                    ),
                    MyAccountButton(
                      image: star,
                      text: LocaleKeys.rateApp.tr(),
                      onTap: () {},
                      width: 18.w,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              ElevatedButton(
                  onPressed: () {
                    CacheHelper.saveToken('');
                    navigateTo(context,
                        page: const LoginScreen(), withHistory: false);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: white,
                      fixedSize: Size(342.w, 50.h),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.r))),
                  child: Row(
                    children: [
                      Text(LocaleKeys.logout.tr(),
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: green)),
                      const Spacer(),
                      Image(
                          image: const AssetImage(turnOff),
                          width: 18.w,
                          height: 18.h,
                          color: green),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
