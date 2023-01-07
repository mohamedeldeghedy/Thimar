
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../core/server_gate.dart';
import '../../../../shared/end_points.dart';
import '../../../account_activation/bloc/model.dart';

part 'events.dart';
part 'states.dart';

class ConfirmForgetPassCodeBloc extends Bloc<VerifyForgetPasswordEvents,VerifyForgetPasswordStates>{
  ConfirmForgetPassCodeBloc():super(VerifyForgetPasswordInitialState()){
    on<PostVerifyForgetPasswordEvent>(verifyForgetPassword);
    on<ResendCodeEvent>(resentCode);
  }
  StreamController<ErrorAnimationType> errorController = StreamController<ErrorAnimationType>();
  var textEditingController=TextEditingController();
  final serverGate=ServerGate();
  VerificationModel? verificationModel;
  Future<void> verifyForgetPassword(PostVerifyForgetPasswordEvent event, Emitter<VerifyForgetPasswordStates> emit) async {
    emit(VerifyForgetPasswordLoadingState());
      // print(textEditingController.text);
      // print(event.phone);

       final resp= await serverGate.sendToServer(url: checkCode,
           body: {
            'code':textEditingController.text,
             "phone":event.phone,
           });
       if(resp.success){

       emit(VerifyForgetPasswordSuccessState(msg: resp.msg));
       }
       else{
         emit(VerifyForgetPasswordFailedState(msg: resp.msg));
       }
  }

  Future<void> resentCode(ResendCodeEvent event, Emitter<VerifyForgetPasswordStates> emit) async {
    emit(ResendCodeLoadingState());
      final resp= await serverGate.sendToServer(url: resendCode,
          body: {
        "phone":event.phone,
          });
      if(resp.success){
        final model=VerificationModel.fromJson(resp.response!.data);
        verificationModel=model;
        emit(ResendCodeSuccessState(msg: resp.msg));
      }
      else{
        emit(ResendCodeFailedState(msg: resp.msg));
      }
  }
}

