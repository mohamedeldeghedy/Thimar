import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar/generated/locale_keys.g.dart';
import 'package:thimar/search/bloc/bloc.dart';
import 'package:thimar/shared/my_app_bar.dart';

import 'components/item_search.dart';

class SearchScreen extends StatefulWidget {
  final String word;
  final RangeValues? values;

  const SearchScreen({Key? key, required this.word,this.values,}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final bloc=KiwiContainer().resolve<SearchBloc>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc.add(GetSearchEvent(word: widget.word));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: LocaleKeys.searchOnWhatYouNeed.tr()),
      body: SingleChildScrollView(
        child: BlocBuilder(
          bloc: bloc,
          builder: (context, state) {
            if(bloc.searchModel ==null){
              return const Center(child: CircularProgressIndicator());
            }
            if(bloc.searchModel !=null){
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 163/250
                ),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) =>
                    ItemSearch(model: bloc.searchModel!.data.searchResult[index])
                ,itemCount: bloc.searchModel!.data.searchResult.length,);
            }
            else{
              return const Text('FAILED');
            }
          },

        ),
      ),


    );
  }
}
