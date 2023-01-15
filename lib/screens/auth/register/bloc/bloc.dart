import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar/screens/auth/register/bloc/city_model.dart';
import 'package:thimar/shared/end_points.dart';

import '../../../../core/server_gate.dart';
import 'model.dart';

part 'event.dart';
part 'states.dart';
class RegisterBloc extends Bloc<RegisterEvents,RegisterStates>{
  RegisterBloc():super(RegisterInitialState()){
    on<PostRegisterEvent>(postUserData);
    on<GetCityEvent>(getCity);
  }

  var nameController = TextEditingController();

  var cityController = TextEditingController();

  var emailController = TextEditingController();

  var phoneController = TextEditingController();

  var passwordController = TextEditingController();
 
  var titleController=TextEditingController();


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
            "city_id":event.id,
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
  CityModel? cityModel;
  Future<void> getCity(GetCityEvent event, Emitter<RegisterStates> emit) async {
    final resp= await serverGate.getFromServer(url: 'cities/1');
    if(resp.success){
      cityModel=CityModel.fromJson(resp.response!.data);
      emit(GetCitySuccessState());
    }
    else{
      emit(GetCityFailedState());
    }
  }
}