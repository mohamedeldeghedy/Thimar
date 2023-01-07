import 'package:card_swiper/card_swiper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar/core/helper_methods.dart';
import 'package:thimar/screens/my_cart/view.dart';
import 'package:thimar/shared/icons.dart';
import '../../../../category_products/view.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../../search/bloc/bloc.dart';
import '../../../../search/view.dart';
import '../../../../shared/res/colors.dart';
import '../../../../shared/input.dart';
import 'bloc/bloc.dart';
import 'components/item_category.dart';
import 'components/item_product.dart';

class FeedsScreen extends StatefulWidget {
  const FeedsScreen({Key? key,}) : super(key: key);

  @override
  State<FeedsScreen> createState() => _FeedsScreenState();
}

class _FeedsScreenState extends State<FeedsScreen> {
  final bloc=KiwiContainer().resolve<FeedsBloc>()..add(GetFeedsEvent())..add(GetCategoriesEvent())..add(GetSliderEvent());
  final searchBloc=KiwiContainer().resolve<SearchBloc>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        leadingWidth: 140.w,
        leading: Row(
          children: [

            Assets.icons.appLogo.image( height: 31.h, width: 31.w,),

            Text(
              LocaleKeys.thimarCart.tr(),
              style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.bold,
                  color: green),
            ),
          ],
        ),
        title: Column(
          children: [
            Text(LocaleKeys.deliverTo.tr(),
                style: TextStyle(color: green, fontSize: 12.sp)),
            Text(
              'شارع الملك فهد - جدة',
              style: TextStyle(fontSize: 14.r, color: green),
            )
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(8.r),
            child: InkWell(
              onTap: () {
                navigateTo(context, page: const MyCart(),withHistory: true);
              },
              child: Stack(
                alignment: AlignmentDirectional.topStart,
                children: [
                   CircleAvatar(
                    radius: 20.r,
                    backgroundColor: Colors.grey,
                    child: const Icon(Icons.notifications),
                  ),
                  CircleAvatar(
                    radius: 7,
                    child: Text('3', style: TextStyle(fontSize: 13.sp)),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 21.h,
            ),
            Input(
              label: LocaleKeys.searchOnWhatYouNeed.tr(),
              prefix: const Icon(Icons.search),
              textInputAction: TextInputAction.search,
              controller: searchBloc.searchController,
              onChanged: (v){
                searchBloc.add(GetSearchEvent(word: searchBloc.searchController.text));
              },
              onSubmit: (v){
                navigateTo(context, page:  SearchScreen(word: searchBloc.searchController.text),withHistory: true);
              },

            ),
            BlocBuilder(
                bloc: bloc,
                builder: (context, state) {
                  if (bloc.sliderModel != null) {
                    return SizedBox(
                      height: 164.0.h,
                      width: double.infinity,
                      child: Swiper(
                        itemBuilder: (context, index) => Image(
                          image: NetworkImage(
                              bloc.sliderModel!.data[index].media),
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        autoplay: true,
                        itemCount: bloc.sliderModel!.data.length,
                        scrollDirection: Axis.horizontal,
                        curve: Curves.fastOutSlowIn,
                        pagination:  SwiperPagination(
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
                    return const CircularProgressIndicator();
                  }
                }),

            Padding(
              padding:  EdgeInsetsDirectional.only(end: 16.r, start: 16.r),
              child: Row(
                children: [
                  Text(LocaleKeys.sections.tr()),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text(LocaleKeys.seeAll.tr()),
                  )
                ],
              ),
            ),
            BlocBuilder(
              bloc: bloc,
              builder:(context, state) {
                if (state is GetCategoriesFailedState){
                return  Text(state.msg);
                }
                if(bloc.categories ==null)
                {
                  return const CircularProgressIndicator();
                }
                  return  SizedBox(
                    height: 100.h,
                    child: ListView.builder(scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => InkWell(
                        onTap: (){
                          navigateTo(context, page: CategoryProductsScreen(
                              id:bloc.categories!.categoryData[index].id,
                              title: bloc.categories!.categoryData[index].name,
                          ),withHistory: true);
                        },
                          child: ItemCategory(model: bloc.categories!.categoryData[index],))
                      ,itemCount: bloc.categories!.categoryData.length,),
                  );


              },
            ),
            SizedBox(height: 20.h,),
            BlocBuilder(
              bloc: bloc,
              builder:(context, state) {
                if(bloc.products==null)
                {
                  return const CircularProgressIndicator();
                }
                if(bloc.products!=null)
                {
                   return GridView.builder(
                     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                       crossAxisCount: 2,
                       childAspectRatio: 163/250
                     ),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) =>
                        ItemProduct(model: bloc.products!.list[index])
                    ,itemCount: bloc.products!.list.length,);
                }
                else{
                  return const Text('Failed');
                }
              },
            )

          ],
        ),
      ),
    );
  }
}
