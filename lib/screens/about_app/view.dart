import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar/screens/home/pages/my_account/bloc/bloc.dart';
import 'package:thimar/shared/icons.dart';
import 'package:thimar/shared/my_app_bar.dart';

import '../../generated/locale_keys.g.dart';

class AboutAppScreen extends StatefulWidget {
  const AboutAppScreen({Key? key}) : super(key: key);

  @override
  State<AboutAppScreen> createState() => _AboutAppScreenState();
}

class _AboutAppScreenState extends State<AboutAppScreen> {
  final bloc=KiwiContainer().resolve<MyAccountBloc>()..add(AboutEvent());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: LocaleKeys.aboutApp.tr(),
        leadingIcon: true,
        backOnPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 26.5.h,
          ),
          Image(
              height: 157.h,
              width: 159.w,
              image: const AssetImage(appLogo)),
          SizedBox(
            height: 24.5.h,
          ),
          BlocBuilder(
            bloc: bloc,
            builder: (context, state) {
              if(bloc.aboutAppModel ==null){
                return const Center(child: CircularProgressIndicator());
              }
              if(bloc.aboutAppModel !=null){
                return Text(bloc.aboutAppModel!.data.about,
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff828282)),
                );
              }
              else{
                return const Center(child: Text('Failed'));
              }
            },
          ),
        ],
      ),
    );
  }
}
