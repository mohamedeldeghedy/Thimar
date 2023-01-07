import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar/core/helper_methods.dart';
import 'package:thimar/shared/res/colors.dart';
import 'package:thimar/shared/my_app_bar.dart';
import '../../generated/locale_keys.g.dart';
import '../balance/view.dart';
import 'all_transaction/view.dart';
import 'bloc/bloc.dart';
import 'components/item_transaction.dart';

class WalletScreen extends StatefulWidget {

  const WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  final bloc=KiwiContainer().resolve<WalletBloc>()..add(GetWalletEvent());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            MyAppBar(
              title: LocaleKeys.wallet.tr(),
              leadingIcon: true,
              backOnPressed: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(
              height: 29.h,
            ),
            Container(
              height: 168.h,
              width: 343.w,
              alignment: AlignmentDirectional.center,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20.r)),
              child: Column(
                children: [
                  Text(LocaleKeys.yourMoney.tr(),
                      style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: green)),
                  SizedBox(
                    height: 17.h,
                  ),
                  BlocBuilder(
                    bloc: bloc,
                    builder: (context, state) {
                      if(bloc.wallet?.wallet ==null){
                        return const CircularProgressIndicator();
                      }
                      return    Text('${bloc.wallet?.wallet} ر.س',
                      style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: green));
                    },

                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            InkWell(
              onTap: () {
                navigateTo(context,page: const BalanceScreen());
              },
              child: SizedBox(
                width: 343.w,
                height: 54.h,
                child: DottedBorder(
                  color: green,
                  radius:  Radius.circular(20.r),
                  borderType: BorderType.RRect,
                  strokeWidth: 1,
                  padding: const EdgeInsets.all(15),
                  child: Center(
                    child: Text(
                      LocaleKeys.chargeNow.tr(),
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: green),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 59.h),
              padding:  EdgeInsets.symmetric(horizontal: 28.r),
              child: Row(
                children: [
                  Text(LocaleKeys.transactionsHistory.tr(),
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: green)),
                  const Spacer(),
                  TextButton(
                      onPressed: () {
                        navigateTo(context,page: const AllTransactionScreen());
                      },
                      child: Text(LocaleKeys.seeAll.tr(),
                          style: TextStyle(fontSize: 15.sp, color: green)))
                ],
              ),
            ),
            BlocBuilder(
              bloc: bloc,
              builder: (context, state) {
                if(bloc.wallet==null){
                  return const CircularProgressIndicator();
                }
                else if(state is GetWalletFailedState){
                  return  const Text('failed');
                }
                else{
                  return  SizedBox(
                    height: 300.h,
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ItemTransaction(walletData:bloc.wallet!.list[index] ,);
                      },
                      separatorBuilder:(context, index) =>  SizedBox(
                        height: 20.h,
                      ),
                      itemCount:bloc.wallet!.list.length ,
                    ),
                  );
                }

              },

            ),
          ],
        ),
      ),
    );
  }
}
