import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar/core/helper_methods.dart';
import 'package:thimar/generated/locale_keys.g.dart';
import 'package:thimar/screens/home/pages/feeds/bloc/bloc.dart';
import 'package:thimar/search/view.dart';
import 'package:thimar/shared/input.dart';
import 'package:thimar/shared/my_app_bar.dart';
import 'package:thimar/shared/my_button.dart';
import 'package:thimar/shared/res/colors.dart';
import '../gen/assets.gen.dart';
import '../screens/home/pages/feeds/components/item_category_product.dart';
import '../search/bloc/bloc.dart';

class CategoryProductsScreen extends StatefulWidget {
  final int id;
  final String title;

  const CategoryProductsScreen({
    Key? key,
    required this.id,
    required this.title,
  }) : super(key: key);

  @override
  State<CategoryProductsScreen> createState() => _CategoryProductsScreenState();
}

class _CategoryProductsScreenState extends State<CategoryProductsScreen> {
  final bloc = KiwiContainer().resolve<FeedsBloc>();
  final searchBloc=KiwiContainer().resolve<SearchBloc>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc.add(GetCategoryProductsEvent(id: widget.id));

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: widget.title),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Input(
              label: LocaleKeys.searchOnWhatYouNeed.tr(),
              prefix: const Icon(Icons.search),
              suffix: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(40.r),
                              topLeft: Radius.circular(40.r))),
                      builder: (context) => Container(
                        width: 375.5.w,
                        height: 334.h,
                        padding:
                            EdgeInsetsDirectional.only(top: 10.h, bottom: 17.h),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30.r),
                                topRight: Radius.circular(50.r))),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'تصفية',
                                style: TextStyle(
                                    color: green,
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              Column(crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(LocaleKeys.price.tr(),
                                      style: TextStyle(
                                          fontSize:15.sp ,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black)),
                                ],
                              ),
                              BlocBuilder(
                                bloc: bloc,
                                builder: (context, state) {
                                  return  RangeSlider(
                                    values: bloc.currentRangeValues,
                                    max: 2000,
                                    divisions: 200,
                                    labels: RangeLabels(
                                      bloc.currentRangeValues.start.round().toString(),
                                      bloc.currentRangeValues.end.round().toString(),
                                    ),
                                    onChanged: (RangeValues values) {
                                      bloc.currentRangeValues = values;
                                      bloc.add(PostPriceEvent(values: bloc.currentRangeValues, word: searchBloc.searchController.text));
                                    },
                                  );
                                },

                              ),
                              const Spacer(),
                              BlocBuilder(
                                bloc: bloc,
                                builder: (context, state) {
                                  return  MyButton(buttonName: 'تطبيق', onPressed: () {
                                   navigateTo(context, page: SearchScreen(word: searchBloc.searchController.text,values: bloc.currentRangeValues),withHistory: true);
                                  });
                                },

                              ),
                            ]),
                      ),
                    );
                  },
                  child: Assets.icons.setting.image(
                    height: 20.h,
                    width: 20.w,
                    color: Colors.black,
                  )),
              controller: searchBloc.searchController,
              onSubmit: (v){
                navigateTo(context, page: SearchScreen(word: searchBloc.searchController.text));
              },
            ),
            BlocBuilder(
                bloc: bloc,
                builder: (context, state) {
                  if (bloc.categoryProducts == null) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (bloc.categoryProducts != null) {
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 163 / 250),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => ItemCategoryProduct(
                          model: bloc.categoryProducts!.data[index]),
                      itemCount: bloc.categoryProducts!.data.length
                      //bloc.productsList!.length
                      ,
                    );
                  } else {
                    return const Center(child: Text('Failed'));
                  }
                }),
          ],
        ),
      ),
    );
  }
}
