import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar/core/server_gate.dart';

import 'model.dart';

part 'events.dart';
part 'states.dart';
class WalletBloc extends Bloc<WalletEvents,WalletStates>{
  WalletBloc():super(WalletInitialState()){
    on<GetWalletEvent>(getWallet);
  }
  
  final serverGate=ServerGate();
  // List<WalletData>? wallet;
  WalletModel? wallet;
  Future<void> getWallet(GetWalletEvent event, Emitter<WalletStates> emit) async {
    emit(GetWalletLoadingState());
    final resp=await serverGate.getFromServer(url: 'wallet');
    if(resp.success){
      final model=WalletModel.fromJson(resp.response!.data);
      wallet=model;
      emit(GetWalletSuccessState());
    }
    else{
      emit(GetWalletFailedState());
    }
  }
}