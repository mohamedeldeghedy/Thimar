import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar/core/server_gate.dart';
import 'package:thimar/screens/home/pages/my_notification/bloc/model.dart';
part 'events.dart';
part 'states.dart';
class NotificationBloc extends Bloc<NotificationEvents,NotificationStates>{
  NotificationBloc():super(NotificationInitialState()){
    on<GetNotificationEvent>(getNotification);
  }
  NotificationData? notificationData;
  NotificationModel? notificationModel;
  final serverGate=ServerGate();
  Future<void> getNotification(GetNotificationEvent event, Emitter<NotificationStates> emit) async {
    emit(NotificationLoadingState());
    final resp=await serverGate.getFromServer(url: 'notifications');
    if(resp.success){
      final model=NotificationModel.fromJson(resp.response!.data);
      notificationModel=model;
      print('zz=-z=zz-=-=z-z=-=-=-=z${model.message}');
      emit(NotificationSuccessState(msg: resp.msg));
    }
    else{
      emit(NotificationFailedState());
    }
  }
}