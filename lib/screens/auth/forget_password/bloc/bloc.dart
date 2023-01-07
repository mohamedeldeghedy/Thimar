import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar/shared/end_points.dart';

import '../../../../core/server_gate.dart';

part 'events.dart';
part 'states.dart';
class ForgetPasswordBloc extends Bloc<ForgetPasswordEvents,ForgetPasswordStates> {
  ForgetPasswordBloc() :super(ForgetPasswordInitialState()) {
    on<PostPhoneNumberEvent>(sendPhoneNumber);
  }

  var phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  final serverGate = ServerGate();

  Future<void> sendPhoneNumber(PostPhoneNumberEvent event,
      Emitter<ForgetPasswordStates> emit) async {
    emit(ForgetPasswordLoadingState());
    final resp = await serverGate.sendToServer(url: forgetPass,
        body: {
          'phone': phoneController.text,
        });
    if (resp.success) {
      emit(ForgetPasswordSuccessState(msg: resp.msg));
    }
    else {
      emit(ForgetPasswordFailedState(msg: resp.msg));
    }
  }
}