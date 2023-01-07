import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar/screens/home/pages/my_notification/bloc/bloc.dart';
import 'package:thimar/shared/my_app_bar.dart';

import '../../../../generated/locale_keys.g.dart';
import 'components/item_notification.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final bloc=KiwiContainer().resolve<NotificationBloc>()..add(GetNotificationEvent());
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:MyAppBar(
        title: LocaleKeys.notifications.tr(),
        leadingIcon: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder(
              bloc: bloc,
              builder: (context, state) {
                if(state is NotificationLoadingState){
                  return const Center(child: CircularProgressIndicator());
                }
                if(state is NotificationSuccessState ){
                  return Center(child: Text(bloc.notificationModel!.message));
                }
                 // return SizedBox(
                 //    height: 650.h,
                 //    width: 360.w,
                 //    child: ListView.separated(
                 //        itemBuilder: (context, index) =>  ItemNotification(notificationData:bloc.notificationData! ),
                 //        separatorBuilder: (context, index) => SizedBox(height: 22.h),
                 //        itemCount: 10),
                 //  );

                else{
                  return Center(child: Text(bloc.notificationModel!.message));
                }

              },

            )
          ],
        ),
      ),
    );
  }
}
