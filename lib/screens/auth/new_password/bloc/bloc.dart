import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar/shared/end_points.dart';

import '../../../../core/server_gate.dart';

part 'events.dart';
part 'states.dart';
class NewPasswordBloc extends Bloc<NewPasswordEvents,NewPasswordStates>{
  NewPasswordBloc():super(NewPasswordInitialState()){
    on<PostNewPasswordEvent>(postNewPassword);
  }
  var passController=TextEditingController();
  var formKey=GlobalKey<FormState>();
  final serverGate=ServerGate();
  Future<void> postNewPassword(PostNewPasswordEvent event, Emitter<NewPasswordStates> emit) async {
    emit(NewPasswordLoadingState());
      final resp=await serverGate.sendToServer(url: resetPass,
          body: {
        'phone':event.phone,
        'code':event.code,
        'password':passController.text,
          });
      if(resp.success){
        emit(NewPasswordSuccessState(msg: resp.msg));
      }
      else{
        emit(NewPasswordFailedState(msg: resp.msg));
      }

  }
}