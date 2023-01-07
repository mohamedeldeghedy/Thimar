import 'package:card_swiper/card_swiper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar/core/helper_methods.dart';
import 'package:thimar/generated/locale_keys.g.dart';
import 'package:thimar/screens/home/view.dart';
import 'package:thimar/shared/res/colors.dart';
import 'package:thimar/shared/icons.dart';
import 'package:thimar/shared/my_app_bar.dart';
import 'package:thimar/shared/my_button.dart';
import 'package:thimar/shared/show_toast.dart';
import '../my_cart/view.dart';
import 'bloc.dart';
import 'components/item_details.dart';
import 'components/item_person_rate.dart';
import 'components/item_similar_product.dart';

class ProductDetailsScreen extends StatefulWidget {
  final int id;
  const ProductDetailsScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final bloc = KiwiContainer().resolve<ProductDetailsBloc>();

  @override
  void initState() {
    super.initState();

    bloc.add(GetProductDetailsEvent(id: widget.id));
    bloc.add(GetPersonRatingEvent(id: widget.id));
    bloc.add(GetSimilarProductsEvent(id: widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: bloc,
      listener:(context, state) =>{} ,
      builder:(context, state) {
        if( state is GetProductDetailsFailedState){
          return const Center(child: Text('Failed'));
        }
        if(bloc.product ==null ||state is GetProductDetailsLoadingState){
          return const Center(child: CircularProgressIndicator(backgroundColor: Colors.white,));
        }
        else{
          return   Scaffold(
        appBar: MyAppBar(
        leadingIcon: true,
        backOnPressed: () {
        Navigator.pop(context);
        },
        actionIcon: true,
        iconAction: bloc.product!.isFavorite
        ? Icon(
        Icons.favorite_border_outlined,
        size: 24.r,
        )
            : Icon(Icons.favorite, size: 24.r, color: Colors.red),
        onPressedAction: () {
        setState(() {
        bloc.product!.isFavorite = !bloc.product!.isFavorite;
        });
        if (!bloc.product!.isFavorite) {
        bloc.add(PostFavouritesEvent(id: bloc.product!.id));
        } else {
        bloc.add(RemoveFavouritesEvent(id: bloc.product!.id));
        }
        },
        title: '',
        ),
        body: SingleChildScrollView(
        child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        BlocBuilder(
        bloc: bloc,
        builder: (context, state) {
        if (bloc.product?.images == null ||
        state is GetProductDetailsLoadingState) {
        return const CircularProgressIndicator();
        }
        if (bloc.product?.images != null) {
        return SizedBox(
        height: 164.0.h,
        width: double.infinity,
        child: Swiper(
        itemBuilder: (context, index) => Image(
        image:
        NetworkImage(bloc.product!.images[index].name),
        width: double.infinity,
        fit: BoxFit.cover,
        ),
        autoplay: true,
        itemCount: bloc.product!.images.length,
        scrollDirection: Axis.horizontal,
        curve: Curves.fastOutSlowIn,
        pagination: SwiperPagination(
        alignment: Alignment.bottomCenter,
        builder: DotSwiperPaginationBuilder(
        color: Colors.white30,
        activeColor: Colors.white,
        size: 7.0.r,
        activeSize: 7.0.r),
        ),
        ),
        );
        } else {
        return const Text('Failed');
        }
        }),

        SizedBox(
        height: 300,
        child: BlocBuilder(
        bloc: bloc,
        builder: (context, state) {
        if (bloc.product == null) {
        return const CircularProgressIndicator();
        }
        if (bloc.product != null) {
        return ItemDetail(
        product: bloc.product!,
        bloc: bloc,
        );
        } else {
        return const Text('Failed');
        }
        },
        ),
        ),
        SizedBox(
        width: 345.w,
        height: 140.h,
        child: BlocBuilder(
        bloc: bloc,
        builder: (context, state) {
        if (bloc.rate == null) {
        return const CircularProgressIndicator();
        }
        if (bloc.rate != null) {
        return ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) =>
        ItemPersonRate(rate: bloc.rate![index]),
        separatorBuilder: (context, index) =>
        SizedBox(width: 1.w),
        itemCount: bloc.rate!.length);
        } else {
        return const Text('Failed');
        }
        },
        ),
        ),
        SizedBox(
        height: 14.h,
        ),
        Text(LocaleKeys.similarProducts.tr(),
        style: TextStyle(
        fontSize: 17, color: green, fontWeight: FontWeight.bold)),
        SizedBox(
        width: 374.w,
        height: 250.h,
        child: BlocBuilder(
        bloc: bloc,
        builder: (context, state) {
        if (bloc.productsList == null) {
        return const CircularProgressIndicator();
        }
        if (bloc.productsList != null) {
        return ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => ItemSimilarProduct(
        model: bloc.productsList![index]),
        separatorBuilder: (context, index) =>
        SizedBox(width: 3.w),
        itemCount: bloc.productsList!.length);
        } else {
        return const Text('Failed');
        }
        },
        ),
        ),
        ],
        ),
        ),
        ),
        bottomNavigationBar: ElevatedButton(
        onPressed: () {
        showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
        topRight: Radius.circular(40.r),
        topLeft: Radius.circular(40.r))),
        builder: (context) => Container(
        width: 376.w,
        height: 202.h,
        padding: EdgeInsetsDirectional.only(top: 10.h, start: 21.w),
        decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30.r),
        topRight: Radius.circular(50.r))),
        child: Column(children: [
        Row(
        children: [
        Image(
        image: const AssetImage(checkIcon),
        height: 16.47.h,
        width: 16.76.w),
        SizedBox(
        width: 18.2.w,
        ),
        Text('تم إضافة المنتج بنجاح',
        style: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.bold,
        color: green))
        ],
        ),
        SizedBox(
        height: 10.3.h,
        ),
        Container(
        height: 1.h,
        width: 375.w,
        color: Colors.grey[100],
        ),
        SizedBox(
        height: 11.7.h,
        ),
        Row(
        children: [
        Image(
        image: NetworkImage(bloc.product!.mainImage),
        height: 64.h,
        width: 69.w,
        ),
        Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text(bloc.product!.title,
        style: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        color: green)),
        SizedBox(
        height: 6.h,
        ),
        Text('الكمية : ${bloc.amount}',
        style: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w100,
        color: Colors.grey)),
        SizedBox(
        height: 2.2.h,
        ),
        Text('${bloc.amrTotalPrice} ر.س',
        style: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: green))
        ],
        )
        ],
        ),
        SizedBox(
        height: 10.3.h,
        ),
        Container(
        height: 1.h,
        width: 375.w,
        color: Colors.grey[100],
        ),
        SizedBox(
        height: 13.2.h,
        ),
        Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        BlocConsumer(
        listener: (context, state) {
        if (state is PostAmountSuccessState) {
        showToast(
        msg: 'Success', state: ToastStates.success);
        navigateTo(context,
        page: const MyCart(), withHistory: true);
        }
        if (state is PostAmountFailedState) {
        showToast(msg: 'FAIL', state: ToastStates.error);
        }
        },
        bloc: bloc,
        builder: (context, state) {
        return MyButton(
        buttonName: LocaleKeys.moveToCart.tr(),
        isLoading: state is PostAmountLoadingState,
        onPressed: () {
        bloc.add(PostAmountEvent(id: widget.id));
        },
        buttonHeight: 49.41.h,
        buttonWidth: 162.65.w,
        fontColor: white,
        buttonColor: green,
        );
        },
        ),
        MyButton(
        buttonName: LocaleKeys.exploreOffers.tr(),
        onPressed: () {
        navigateTo(context,
        page: const Home(), withHistory: false);
        },
        buttonHeight: 49.41.h,
        buttonWidth: 162.65.w,
        fontColor: green,
        buttonColor: white,
        )
        ],
        )
        ]),
        ),
        );
        },
        style: ElevatedButton.styleFrom(fixedSize: Size(375.w, 60.h)),
        child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
        children: [
        Container(
        width: 35.w,
        height: 32.h,
        decoration: BoxDecoration(
        color: const Color(0xff6AA431),
        borderRadius: BorderRadius.circular(10.r)),
        child: const Icon(Icons.shopping_cart_outlined)),
        SizedBox(
        width: 10.w,
        ),
        Text(LocaleKeys.addToCart.tr()),
        const Spacer(),
        BlocBuilder(
        bloc: bloc,
        builder: (context, state) {
        return Text(
        '${bloc.amrTotalPrice ?? 0} ر.س',
        style: TextStyle(
        color: white,
        fontSize: 15.sp,
        fontWeight: FontWeight.bold),
        );
        })
        ],
        ),
        )),
        );
        }
      } ,

    );
  }
}
