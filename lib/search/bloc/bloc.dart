import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar/core/server_gate.dart';
import 'package:thimar/search/bloc/model.dart';
part 'events.dart';
part 'states.dart';
class SearchBloc extends Bloc<SearchEvents,SearchStates>{
  SearchBloc():super(SearchInitialState()){
    on<GetSearchEvent>(getSearch);
  }
  var searchController=TextEditingController();
  SearchModel? searchModel;
  final serverGate=ServerGate();
  Future<void> getSearch(GetSearchEvent event, Emitter<SearchStates> emit) async {
    emit(GetSearchLoadingState());
    final resp=await serverGate.getFromServer(url: 'search',params: {
      'keyword':event.word
    },
   );
    if(resp.success){
      searchModel=SearchModel.fromJson(resp.response!.data);
      emit(GetSearchSuccessState());
    }
    else{
      emit(GetSearchFailedState());
    }
    
  }
}