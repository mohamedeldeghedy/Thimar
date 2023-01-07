import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:thimar/core/server_gate.dart';
import 'package:thimar/screens/home/pages/my_order/model.dart';
part 'states.dart';
part 'events.dart';
class OrderBloc extends Bloc<OrderEvents,OrderStates>{
  OrderBloc():super(OrderInitialState()){
    on<GetCurrentOrderEvent>(getCurrentOrder);
    on<GetFinishedOrderEvent>(getFinishedOrder);
    on<RefreshCurrentOrderEvent>(refreshCurrent);
    on<LoadingCurrentOrderEvent>(loadingCurrent);
    on<RefreshFinishedOrderEvent>(refreshFinished);
    on<LoadingFinishedOrderEvent>(loadingFinished);
  }
  var refreshController=RefreshController(initialRefresh: false);
  int pageNumber=1;
  final serverGate=ServerGate();
  List<OrderData>? currentOrderList=[];
  List<OrderData>? currentNewOrderList=[];
  Future<void> getCurrentOrder(GetCurrentOrderEvent event, Emitter<OrderStates> emit) async {
    emit(GetCurrentOrderLoadingState());
    final resp=await serverGate.getFromServer(url: 'client/orders/current?page=$pageNumber');
    if(resp.success){
      final model=OrderModel.fromJson(resp.response!.data);
      currentNewOrderList=model.data;
      currentOrderList!.addAll(currentNewOrderList!);
      emit(GetCurrentOrderSuccessState());
    }
    else{
      emit(GetCurrentOrderFailedState());
    }
  }
  List<OrderData>? finishedOrderList=[];
  List<OrderData>? finishedNewOrderList=[];
  Future<void> getFinishedOrder(GetFinishedOrderEvent event, Emitter<OrderStates> emit) async {
    emit(GetFinishedOrderLoadingState());
    final resp=await serverGate.getFromServer(url: 'client/orders/finished?page=$pageNumber');
    if(resp.success){
      final model=OrderModel.fromJson(resp.response!.data);
      finishedNewOrderList=model.data;
      finishedOrderList!.addAll(finishedNewOrderList!);
      emit(GetFinishedOrderSuccessState());
    }
    else{
      emit(GetFinishedOrderFailedState());
    }
  }
  Future<void> refreshCurrent(RefreshCurrentOrderEvent event, Emitter<OrderStates> emit)async{
    await Future.delayed(const Duration(milliseconds: 1000));
    pageNumber=1;
    currentOrderList!.clear();
     add(GetCurrentOrderEvent());
    refreshController.refreshCompleted();
    print('zzzzzzzzz=-=z-z-=z-z-=-=-=z-=-=-${currentOrderList.toString()}');
    emit(RefreshCurrentOrderState());
  }

  Future<void> loadingCurrent(LoadingCurrentOrderEvent event, Emitter<OrderStates> emit) async {
    pageNumber++;
    add(GetCurrentOrderEvent());
    refreshController.loadComplete();
    print('x--=x-x=-xx=-x=x-x=x-x=x-x=-x=-xx-=x-=x${currentOrderList.toString()}');
    emit(LoadingCurrentOrderState());
  }


  Future<void> refreshFinished(RefreshFinishedOrderEvent event, Emitter<OrderStates> emit)async{
    await Future.delayed(const Duration(milliseconds: 1000));
    pageNumber=1;
    finishedOrderList!.clear();
    add(GetFinishedOrderEvent());
    refreshController.refreshCompleted();
    print('zzzzzzzzz=-=z-z-=z-z-=-=-=z-=-=-${finishedOrderList.toString()}');
    emit(RefreshFinishedOrderState());
  }

  Future<void> loadingFinished(LoadingFinishedOrderEvent event, Emitter<OrderStates> emit) async {
    pageNumber++;
    add(GetFinishedOrderEvent());
    refreshController.loadComplete();
    print('x--=x-x=-xx=-x=x-x=x-x=x-x=-x=-xx-=x-=x${finishedOrderList.toString()}');
    emit(LoadingFinishedOrderState());
  }
}