import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/generated/locale_keys.g.dart';
import 'package:thimar/screens/product_details/model.dart';
import 'package:thimar/shared/res/colors.dart';

import '../bloc.dart';

class ItemDetail extends StatefulWidget {
  final ProductData product;
  final ProductDetailsBloc bloc;
  const ItemDetail({Key? key, required this.product, required this.bloc}) : super(key: key);

  @override
  State<ItemDetail> createState() => _ItemDetailState();
}

class _ItemDetailState extends State<ItemDetail> {


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 14.h,
        ),
        Row(
          children: [
            Text(
              widget.product.title,
              style: TextStyle(
                  color: green, fontSize: 22.sp, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Text('${widget.product.discount}%',
                style:  TextStyle(
                  color: const Color(0xffFF0000),
                  fontSize: 13.sp,
                )),
            const SizedBox(
              width: 5,
            ),
            Text('${widget.product.price}ر.س',
                style: TextStyle(
                    color: green, fontSize: 17.sp, fontWeight: FontWeight.bold)),
            const SizedBox(
              width: 5,
            ),
            Text(
              '${widget.product.priceBeforeDiscount}ر.س',
              style: TextStyle(
                  fontSize: 14.sp,
                  color: green,
                  decoration: TextDecoration.lineThrough),
            )
          ],
        ),
        SizedBox(
          height: 4.h,
        ),
        Row(
          children: [
            Text(
              '${LocaleKeys.price.tr()}/ 1${LocaleKeys.kg.tr()}',
              style: TextStyle(color: grey),
            ),
            const Spacer(),
            Container(alignment: Alignment.center,padding: EdgeInsets.symmetric(horizontal: 5.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[300]),
              height: 35.h,
              width: 105.w,
              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: ()
                    {
                      widget.bloc.add(ChangeAmountEvent(isPlus: true));
                    },
                    child: CircleAvatar(
                      radius: 15.r,
                      backgroundColor: white,
                      child: Icon(Icons.add, size: 20, color: green),
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                    child: BlocBuilder(
                      bloc: widget.bloc,
                      builder: (context,state) {
                        return Text('${widget.bloc.amount}',textAlign: TextAlign.center,
                            style: TextStyle(color: green, fontSize: 15.sp));
                      }
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  InkWell(
                    onTap: () {
                      widget.bloc.add(ChangeAmountEvent(isPlus: false));
                    },
                    child: CircleAvatar(
                      radius: 15.r,
                      backgroundColor: white,
                      child: Icon(Icons.remove, size: 20, color: green),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        SizedBox(
          height: 14.h,
        ),
        Container(
          color: Colors.grey[300],
          height: 0.4.h,
          width: 376.w,
        ),
        SizedBox(
          height: 14.h,
        ),
        Row(
          children: [
            Text(
              LocaleKeys.productCode.tr(),
              style: TextStyle(
                  color: green, fontWeight: FontWeight.bold, fontSize: 17),
            ),
            SizedBox(
              width: 14.w,
            ),
            Text(
              widget.product.code,
              style: TextStyle(fontSize: 19.sp, color: grey),
            )
          ],
        ),
        SizedBox(
          height: 14.h,
        ),
        Container(
          color: Colors.grey[300],
          height: 0.4.h,
          width: 376.w,
        ),
        SizedBox(
          height: 14.h,
        ),
        Text(
          LocaleKeys.productDetails.tr(),
          style: TextStyle(
              fontSize: 17, fontWeight: FontWeight.bold, color: green),
        ),
        Text(
          widget.product.description,
          style: TextStyle(
            color: grey,
            fontSize: 14.sp,
          ),
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
          softWrap: true,
        ),
        SizedBox(
          height: 16.h,
        ),
        Container(
          color: Colors.grey[300],
          height: 0.4.h,
          width: 376.w,
        ),
        SizedBox(
          height: 14.h,
        ),
        Column(
          children: [
            Row(
              children: [
                Text(
                  LocaleKeys.rates.tr(),
                  style: TextStyle(
                      fontSize: 17, fontWeight: FontWeight.bold, color: green),
                ),
                const Spacer(),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      LocaleKeys.seeAll.tr(),
                      style: TextStyle(color: green, fontSize: 15.sp),
                    ))
              ],
            ),
          ],
        )
      ],
    );
  }
}
