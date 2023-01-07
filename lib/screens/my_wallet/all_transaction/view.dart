import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:thimar/screens/my_wallet/all_transaction/bloc/bloc.dart';
import 'package:thimar/shared/my_app_bar.dart';
import '../../../generated/locale_keys.g.dart';
import 'components/item_all_transaction.dart';



class AllTransactionScreen extends StatefulWidget {
  const AllTransactionScreen({Key? key}) : super(key: key);

  @override
  State<AllTransactionScreen> createState() => _AllTransactionScreenState();
}

class _AllTransactionScreenState extends State<AllTransactionScreen> {
  final bloc=KiwiContainer().resolve<AllTransactionBloc>()..add(GetAllTransactionEvent());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:MyAppBar(
        title: LocaleKeys.allTransaction.tr(),
        leadingIcon: true,
        backOnPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SmartRefresher(
        enablePullUp: true,
        enablePullDown: true,
        controller: bloc.refreshController,
         onLoading: (){
           bloc.add(LoadingAllTransactionEvent());
         },
         onRefresh: (){
           bloc.add(RefreshAllTransactionEvent());
         },
        child: BlocBuilder(
          bloc: bloc,
          builder: (context, state) {
          if(bloc.allTransaction?.data==null){
            return const Center(child: CircularProgressIndicator());
          }
          if(bloc.allTransaction?.data !=null){
            return SizedBox(
              height: double.infinity,
              child: ListView.separated(

                  itemBuilder:(context, index) {
                    return ItemAllTransaction(allTransactionData: bloc.allTransaction!.data[index],);
                  } ,
                  separatorBuilder: (context, index) => SizedBox(height: 20.h),
                  itemCount: bloc.allTransaction!.data.length),
            );
          }
          else {
            return Text(bloc.allTransaction!.message);
          }
          },
        ),
      ),
    );
  }
}
