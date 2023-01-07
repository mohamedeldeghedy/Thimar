import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar/core/server_gate.dart';

import 'model.dart';
part 'states.dart';
part 'events.dart';
class BalanceBloc extends Bloc<BalanceEvents,BalanceStates>{
  BalanceBloc():super(BalanceInitialState()){
    on<PostBalanceEvent>(postBalance);
  }
  
  final serverGate=ServerGate();
  var amountController=TextEditingController();
  BalanceModel? balance;
  Future<void>postBalance(PostBalanceEvent event, Emitter<BalanceStates> emit) async {
    emit(PostBalanceLoadingState());
    final resp=await serverGate.sendToServer(url: 'wallet/charge',
    body: {
      'amount':amountController.text,
      'transaction_id':'1111',
    });
    if(resp.success){
       final model=BalanceModel.fromJson(resp.response!.data);
       balance=model;
       emit(PostBalanceSuccessState(msg: resp.msg));
    }
    else{
      emit(PostBalanceFailedState(msg: resp.msg));
    }
  }
}