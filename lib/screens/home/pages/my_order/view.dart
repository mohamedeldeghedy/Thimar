import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:thimar/shared/res/colors.dart';

import '../../../../generated/locale_keys.g.dart';
import '../../../../shared/my_app_bar.dart';
import 'bloc/bloc.dart';
import 'components/order_finished.dart';
import 'components/order_now.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen>with TickerProviderStateMixin {
  bool isNow = true;
  final bloc=KiwiContainer().resolve<OrderBloc>();
  @override
  void initState() {
    bloc.add(GetCurrentOrderEvent());
    bloc.add(GetFinishedOrderEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  MyAppBar(
        title: LocaleKeys.my_orders.tr(),
        actionIcon: false,
        leadingIcon: false,
      ),
      backgroundColor: white,
      body: Column(
        children: [
          SizedBox(
            width: 342.w,
            height: 54.h,
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isNow = true;
                      });
                    },
                    child: Container(
                      width: 165.w,
                      height: 42.08.h,
                      decoration: BoxDecoration(
                          color: isNow ? green : white,
                          borderRadius: BorderRadius.circular(10.r)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            LocaleKeys.active.tr(),
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: !isNow ? grey : white),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                 SizedBox(
                  width: 20.w,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isNow = false;
                      });
                    },
                    child: Container(
                      width: 165.w,
                      height: 42.08.h,
                      decoration: BoxDecoration(
                          color: !isNow ? green : white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            LocaleKeys.expired.tr(),
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: isNow ? grey : white),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 20.h,),
          if (isNow)
            Expanded(
              child: SmartRefresher(
                controller: bloc.refreshController,
                enablePullDown: true,
                enablePullUp: true,
                onLoading:(){
                 bloc.add(LoadingCurrentOrderEvent());
                },
                onRefresh:(){
                 bloc.add(RefreshCurrentOrderEvent());
                } ,
                child: BlocBuilder(
                  bloc: bloc,
                  builder:(context, state) {
                   if(bloc.currentOrderList ==null){
                     return const Center(child: CircularProgressIndicator());
                   }else if(bloc.currentOrderList !=null){
                     return ListView.separated(
                     shrinkWrap: true,
                         scrollDirection: Axis.vertical,
                         itemBuilder: (context, index) =>  OrderNow(orderData:bloc.currentOrderList![index] ),
                         separatorBuilder: (context, index) =>
                             SizedBox(height: 16.h),
                         itemCount: bloc.currentOrderList!.length);
                   }else{
                     return const Center(child: Text('Failed'));

                   }


                  },
                ),
              ),
            ),
          if (!isNow)
            Expanded(
              child: SmartRefresher(
                controller: bloc.refreshController,
                enablePullDown: true,
                enablePullUp: true,
                onLoading:(){
                  bloc.add(LoadingFinishedOrderEvent());
                },
                onRefresh:(){
                  bloc.add(RefreshFinishedOrderEvent());
                } ,
                child: BlocBuilder(
                  bloc: bloc,
                  builder: (context, state) {
                    if(bloc.finishedOrderList ==null){
                      return const Center(child: CircularProgressIndicator());
                    }
                    else if(bloc.finishedOrderList !=null){
                      return SizedBox(
                        height: 650.h,
                        child: ListView.separated(
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) =>  OrderFinishedScreen(finishedOrderData: bloc.finishedOrderList![index]),
                            separatorBuilder: (context, index) =>
                                SizedBox(height: 16.h),
                            itemCount: bloc.finishedOrderList!.length),
                      );
                    }
                    else{
                      return const Center(child: Text('Failed'));
                    }
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
}
