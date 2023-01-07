import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:thimar/screens/account_activation/bloc/model.dart';
import 'package:thimar/shared/end_points.dart';

import '../../../core/server_gate.dart';

part 'events.dart';
part 'states.dart';
class VerificationBloc extends Bloc<VerificationEvents,VerificationStates>{
  VerificationBloc():super(VerificationInitialState()){
    on<PostVerificationCodeEvent>(verificationCode);
    // on<GetVerificationDataEvent>(verificationData);
  }
  StreamController<ErrorAnimationType> errorController = StreamController<ErrorAnimationType>();
  var textEditingController=TextEditingController();
  final serverGate=ServerGate();
  VerificationModel? code;
  Future<void> verificationCode(PostVerificationCodeEvent event, Emitter<VerificationStates> emit) async {
    emit(PostVerificationLoadingState());
    final resp= await serverGate.sendToServer(url: verify,
        body: {
          'code':textEditingController.text,
          "phone":"",
          'device_token':'vv',
          'type':'ios'
        });


    if(resp.success){
      emit(PostVerificationSuccessState(msg: resp.msg));
    }
    else{
      emit(PostVerificationFailedState(msg: resp.msg));
    }
  }
  }
