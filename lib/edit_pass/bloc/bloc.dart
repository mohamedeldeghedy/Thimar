import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/server_gate.dart';

part 'events.dart';
part 'states.dart';
class EditPasswordBloc extends Bloc<EditPasswordEvents,EditPasswordStates>{
  EditPasswordBloc():super(EditPasswordInitialState()){
    on<EditPasswordEvent>(editPassword);
  }
  var oldPasswordController=TextEditingController();
  var newPasswordController=TextEditingController();
  var formKey = GlobalKey<FormState>();

  final serverGate=ServerGate();
  Future<void> editPassword(EditPasswordEvent event, Emitter<EditPasswordStates> emit) async {
    emit(EditPasswordLoadingState());
      final resp=await serverGate.sendToServer(url: 'edit_password',
          body: {
        '_method':'PUT',
        'old_password':oldPasswordController.text,
            'password':newPasswordController.text,
          });
      if(resp.success) {
        emit(EditPasswordSuccessState(msg: resp.msg));
      }
      else{
        emit(EditPasswordFailedState(msg: resp.msg));
      }

    }
  }



