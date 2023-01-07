import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar/screens/home/pages/feeds/bloc/bloc.dart';
import 'package:thimar/shared/my_app_bar.dart';

import '../../../../generated/locale_keys.g.dart';
import 'components/item_product.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final bloc =KiwiContainer().resolve<FeedsBloc>()..add(GetFavouritesEvent());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  MyAppBar(
        title: LocaleKeys.favorites.tr(),
        leadingIcon: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
             BlocConsumer(
               listener: (context, state) {

               },
               bloc: bloc,
               builder: (context, state) {
                 if(bloc.data ==null|| state is GetFavouritesLoadingState){

                   return const Center(child: CircularProgressIndicator());
                 }
                 if(bloc.data !=null) {
                  return GridView.builder(
                     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                         crossAxisCount: 2,
                         childAspectRatio: 165/250
                     ),
                     shrinkWrap: true,
                     physics: const NeverScrollableScrollPhysics(),
                     itemBuilder: (context, index) =>  ItemProduct(favouritesData: bloc.data![index]),
                     itemCount: bloc.data!.length);
                 }
                 else if(state is GetFavouritesFailedState){
                   return  Center(child: Text(state.msg));
                 }
                 else{
                   return const Text('');
                 }
               },
             ),

          ],
        ),
      ),
    );
  }
}
