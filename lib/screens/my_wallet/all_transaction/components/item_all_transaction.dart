import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/screens/my_wallet/all_transaction/bloc/model.dart';

import '../../../../generated/locale_keys.g.dart';
import '../../../../shared/icons.dart';
import '../../../../shared/res/colors.dart';

class ItemAllTransaction extends StatelessWidget {
  final AllTransactionData allTransactionData;
  const ItemAllTransaction({Key? key, required this.allTransactionData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 22.h),
      width: 343.w,
      height: 85.5.h,
      decoration:
      BoxDecoration(borderRadius: BorderRadius.circular(20.r)),
      padding: EdgeInsets.symmetric(horizontal: 32.w),
      child: Row(
        children: [
          Image(
            image:  const AssetImage(arrowTop),
            width: 18.w,
            height: 18.h,
          ),
          SizedBox(
            width: 9.w,
          ),
          Column(
            children: [
              Text(LocaleKeys.chargeWallet.tr(),
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: green)),
              SizedBox(
                height: 8.h,
              ),
              Text('${allTransactionData.amount} ر.س',
                  style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: green)),
            ],
          ),
          const Spacer(),
          Text(allTransactionData.date,
              style:
              TextStyle(fontSize: 14.sp, color: Colors.grey[500]))
        ],
      ),
    );

  }
}
