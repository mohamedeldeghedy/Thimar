
import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar/screens/about_app/model.dart';
import 'package:thimar/screens/home/pages/my_account/bloc/model.dart';
import 'package:thimar/shared/end_points.dart';
import '../../../../../core/server_gate.dart';

part 'events.dart';
part 'states.dart';

class MyAccountBloc extends Bloc<MyAccountEvents,MyAccountStates> {
  MyAccountBloc() :super(MyAccountInitialState()) {
    on<GetMyAccountEvent>(getUserData);
    on<LogOutEvent>(logOut);
    on<AboutEvent>(aboutApp);
  }

  Data? data;
  City? city;
  final serverGate =ServerGate();
  Future<void> getUserData(GetMyAccountEvent event, Emitter<MyAccountStates> emit) async {
    emit(GetMyAccountLoadingState());
      final resp = await serverGate.getFromServer(url: userData,);
      if(resp.success){
        final model = Data.fromJson(resp.response!.data['data']);
        data = model;
        emit(GetMyAccountSuccessState(msg: resp.msg));
      }
      else
        {
          emit(GetMyAccountFailedState(msg: resp.msg));
        }

    }


  void logOut(LogOutEvent event, Emitter<MyAccountStates> emit) async{
    emit(LogOutLoadingState());
    final resp=await serverGate.sendToServer(url: 'logout');
    if(resp.success){
      emit(LogOutSuccessState());
    }
  }
  AboutAppModel? aboutAppModel;
  Future<void> aboutApp(AboutEvent event, Emitter<MyAccountStates> emit) async {
    emit(AboutAppLoadingState());
    final resp=await serverGate.getFromServer(url: 'about');
    if(resp.success){
       aboutAppModel=AboutAppModel.fromJson(resp.response!.data);
      emit(AboutAppSuccessState());
    }
    else{
      emit(AboutAppFailedState());
    }
  }
}


