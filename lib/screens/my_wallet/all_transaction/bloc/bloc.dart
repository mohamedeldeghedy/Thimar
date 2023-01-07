import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:thimar/core/server_gate.dart';

import 'model.dart';
part 'events.dart';
part 'states.dart';
class AllTransactionBloc extends Bloc<AllTransactionEvents,AllTransactionStates>{
  AllTransactionBloc():super(AllTransactionInitialState()){
    on<GetAllTransactionEvent>(getAllTransaction);
    on<RefreshAllTransactionEvent>(refreshAllTransaction);
    on<LoadingAllTransactionEvent>(loadingAllTransaction);
  }

  final serverGate=ServerGate();
  int pageNumber=1;
  var refreshController=RefreshController(initialRefresh: false);
  AllTransactionModel? allTransaction;
  List<AllTransactionData>? transaction=[];
  List<AllTransactionData>? newTransaction=[];

  Future<void> getAllTransaction(GetAllTransactionEvent event, Emitter<AllTransactionStates> emit) async {
    emit(GetAllTransactionLoadingState());
    final resp=await serverGate.getFromServer(url: 'wallet/get_wallet_transactions?page=$pageNumber');
    if(resp.success){
      final model=AllTransactionModel.fromJson(resp.response!.data);
      allTransaction=model;
      newTransaction=model.data;
      transaction!.addAll(newTransaction!);
      emit(GetAllTransactionSuccessState());
    }
    else{
      emit(GetAllTransactionFailedState());
    }
  }
  Future<void> refreshAllTransaction(RefreshAllTransactionEvent event, Emitter<AllTransactionStates> emit)async{
    await Future.delayed(const Duration(milliseconds: 1000));
    pageNumber=1;
    transaction!.clear();
    add(GetAllTransactionEvent());
    refreshController.refreshCompleted();
    emit(RefreshAllTransactionState());
  }

  Future<void> loadingAllTransaction(LoadingAllTransactionEvent event, Emitter<AllTransactionStates> emit) async {
    pageNumber++;
    add(GetAllTransactionEvent());
    refreshController.loadComplete();
    print('x--=x-x=-xx=-x=x-x=x-x=x-x=-x=-xx-=x-=x${transaction.toString()}');
    emit(LoadingAllTransactionState());
  }
}