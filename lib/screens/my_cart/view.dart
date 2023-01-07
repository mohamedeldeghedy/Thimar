import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar/core/helper_methods.dart';
import 'package:thimar/screens/order_complete/view.dart';
import 'package:thimar/shared/res/colors.dart';
import 'package:thimar/shared/show_toast.dart';
import '../../generated/locale_keys.g.dart';
import '../../shared/my_app_bar.dart';
import '../../shared/my_button.dart';
import 'bloc/bloc.dart';
import 'components/item_cart.dart';

class MyCart extends StatefulWidget {
  const MyCart({Key? key}) : super(key: key);

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  final bloc = KiwiContainer().resolve<CartBloc>()
    ..add(GetCartEvent(isLoading: true));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: LocaleKeys.cart.tr(),
        backOnPressed: () {
          Navigator.pop(context);
        },
      ),
      bottomNavigationBar: MyButton(
        buttonName: LocaleKeys.completeOrder.tr(),
        sizedBoxHeight: 20.h,
        onPressed: () {
          navigateTo(context, page: const OrderCompleteScreen());
        },
      ),
      body: SingleChildScrollView(
        child: BlocConsumer(
          bloc: bloc,
          listener: (context, state) {
            if (state is PostCopounSuccessState) {
              showToast(
                  msg: state.msg,
                  state: ToastStates.success);
            }
            if (state is PostCopounFailedState) {
              print("state msg -=-=-=-=-=- ${state.msg}");
              showToast(
                  msg: state.msg, state: ToastStates.error);
            }
          },
          builder: (context, state) {
            if (state is GetCartLoadingState || bloc.cartModel == null) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is GetCartFailedState) {
              return const Center(child: Text('FAILED'));
            } else {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.r),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    SizedBox(
                      width: 342.w,
                      height: 406.h,
                      child: ListView.separated(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => ItemCart(
                                model: bloc.data![index],
                                bloc: bloc,
                              ),
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 10.h),
                          itemCount: bloc.data?.length ?? 0),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      height: 55.h,
                      width: 342.w,
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                          border:
                              Border.all(color: Colors.grey.withOpacity(0.4))),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10.w,
                          ),
                          SizedBox(
                            height: 20.h,
                            width: 220.w,
                            child: TextFormField(
                                keyboardType: TextInputType.text,
                                controller: bloc.copounController,
                                decoration: InputDecoration(
                                    border: const OutlineInputBorder(
                                        borderSide: BorderSide.none),
                                    labelText: LocaleKeys
                                        .haveCouponEnterCouponNum
                                        .tr(),
                                    labelStyle: TextStyle(
                                      fontSize: 15.sp,
                                      color: Colors.grey[300],
                                    ))),
                          ),
                          const Spacer(),
                          MyButton(
                            onPressed: () {
                              bloc.add(PostCopounEvent());
                            },
                            isLoading: state is PostCopounLoadingState,
                            buttonHeight: 39.h,
                            buttonWidth: 79.w,
                            buttonName: LocaleKeys.app.tr(),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text('${LocaleKeys.allPricesContain.tr()} 15%',
                        style: TextStyle(fontSize: 15, color: green)),
                    SizedBox(
                      height: 14.h,
                    ),
                    Container(
                      height: 115.h,
                      width: 342.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[200]),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(LocaleKeys.allProducts.tr(),
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: green)),
                                const Spacer(),
                                Text('${bloc.cartModel?.totalPriceBeforeDiscount}ر.س',
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold,
                                        color: green))
                              ],
                            ),
                            Row(
                              children: [
                                Text(LocaleKeys.discount.tr(),
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold,
                                        color: green)),
                                const Spacer(),
                                Text('${bloc.cartModel?.totalDiscount} ر.س',
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold,
                                        color: green))
                              ],
                            ),
                            Row(
                              children: [
                                Text(LocaleKeys.total.tr(),
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold,
                                        color: green)),
                                const Spacer(),
                                Text('${bloc.cartModel!.totalPriceBeforeDiscount-bloc.cartModel!.totalDiscount} ر.س',
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold,
                                        color: green))
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
