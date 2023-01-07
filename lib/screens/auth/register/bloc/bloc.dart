import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar/shared/end_points.dart';

import '../../../../core/server_gate.dart';
import 'model.dart';

part 'event.dart';
part 'states.dart';
class RegisterBloc extends Bloc<RegisterEvents,RegisterStates>{
  RegisterBloc():super(RegisterInitialState()){
    on<PostRegisterEvent>(postUserData);
  }
  var nameController = TextEditingController();

  var cityController = TextEditingController();

  var emailController = TextEditingController();

  var phoneController = TextEditingController();

  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  final serverGate=ServerGate();
  RegisterModel? userData;
  Future<void> postUserData(PostRegisterEvent event, Emitter<RegisterStates> emit) async {
    emit(RegisterLoadingState());

      final resp=await serverGate.sendToServer(url: register,
          body:{
            'fullname':nameController.text,
            'password':passwordController.text,
            'phone':phoneController.text,
            "city_id":12,
            "country_id":1,
            'password_confirmation':passwordController.text,
          }
          );
      if(resp.success){
        final model= RegisterModel.fromJson(resp.response!.data);
        userData=model;
        emit(RegisterSuccessState(msg: resp.msg));
      }
      else{
        emit(RegisterFailedState(msg: resp.msg));
      }
  }
}