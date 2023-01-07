import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/screens/my_cart/bloc/bloc.dart';
import 'package:thimar/screens/my_cart/bloc/model.dart';
import 'package:thimar/shared/res/colors.dart';
import 'package:thimar/shared/show_toast.dart';

class ItemCart extends StatefulWidget {
  final CartProduct model;
  final CartBloc bloc;

  const ItemCart({
    Key? key,
    required this.model,
    required this.bloc,
  }) : super(key: key);

  @override
  State<ItemCart> createState() => _ItemCartState();
}

class _ItemCartState extends State<ItemCart> {
  int count = 0;

  @override
  void initState() {
    super.initState();
    count = widget.model.amount;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
        bloc: widget.bloc,
        listener: (context, state) {
          if(state is UpdateCartSuccessState)
            {
              widget.bloc
                  .add(GetCartEvent(isLoading: false));
            }
          if (state is DeleteProductSuccessState) {
            showToast(msg: 'SUCCESS', state: ToastStates.success);
          }
          if (state is DeleteProductFailedState) {
            showToast(msg: 'FAILED', state: ToastStates.error);
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: SizedBox(
              width: 310.w,
              height: 126.h,
              child: Row(
                children: [
                  Container(
                      width: 80.w,
                      height: 80.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.grey[100]),
                      child: Image(
                          width: 50.w,
                          height: 50.h,
                          image: NetworkImage(widget.model.image))),
                  SizedBox(
                    width: 10.w,
                  ),
                  SizedBox(
                    height: 105.h,
                    width: 120.w,
                    child: Column(
                      children: [
                        Text(
                          widget.model.title,
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: green),
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        Text('${widget.model.price} ر.س',
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                                color: green)),
                        Container(
                          width: 103.w,
                          height: 37.h,
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.r, vertical: 8.r),
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(15.r)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  if (state is! UpdateCartLoadingState) {
                                    count++;
                                    widget.bloc.add(UpdateCartEvent(
                                        id: widget.model.id, amount: count));

                                  }
                                },
                                child: Container(
                                    height: 27.h,
                                    width: 27.w,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(15.r),
                                        color: white),
                                    child: Icon(
                                      Icons.add,
                                      color: green,
                                      size: 18.r,
                                    )),
                              ),
                              Text('$count',
                                  style:
                                      TextStyle(fontSize: 13.sp, color: green)),
                              InkWell(
                                onTap: () {
                                  if (state is! UpdateCartLoadingState) {
                                    count--;
                                    widget.bloc.add(UpdateCartEvent(
                                        id: widget.model.id, amount: count));
                                  }
                                },
                                child: Container(
                                    width: 27.w,
                                    height: 27.h,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(15.r),
                                        color: white),
                                    child: Icon(
                                      Icons.remove,
                                      color: green,
                                      size: 18.r,
                                    )),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      widget.bloc.add(DeleteProductEvent(id: widget.model.id));
                      widget.bloc.add(GetCartEvent(isLoading: false));
                    },
                    child: Container(
                      width: 24.w,
                      height: 24.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          color: Colors.red[100]),
                      child: Image(
                          height: 13.48.h,
                          width: 13.48.w,
                          color: Colors.red,
                          image: const NetworkImage(
                              'https://cdn.icon-icons.com/icons2/3544/PNG/128/trash_icon_224597.png')),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
