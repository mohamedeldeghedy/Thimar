import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar/core/cache_helper.dart';
import 'package:thimar/shared/end_points.dart';

import '../../../core/server_gate.dart';
import 'model.dart';

part 'event.dart';
part 'states.dart';
class ProfileBloc extends Bloc<EditProfileEvents,EditProfileStates>{
  ProfileBloc():super(EditProfileInitialState()){
    on<EditUserDataEvent>(postUserData);
    on<GetProfileEvent>(getProfileData);
  }
  var nameController = TextEditingController(text: CacheHelper.getFullName());
  var cityController = TextEditingController();
  var phoneController = TextEditingController(text: CacheHelper.getPhone());
  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  final serverGate=ServerGate();
ProfileModel? profile;
  Future<void> postUserData(EditUserDataEvent event, Emitter<EditProfileStates> emit) async {
    emit(EditProfileLoadingState());

      final resp=await serverGate.sendToServer(
          url: editProfile,
          body:{
            'fullname':nameController.text,
            'phone':phoneController.text,
            "city_id":12,
          }
      );
          if(resp.success){
            if (kDebugMode) {
              print(resp.response!.data['data']);
            }
            final model=ProfileModel.fromJson(resp.response!.data);
            profile=model;
            nameController.text=model.data.fullname;
            phoneController.text=model.data.phone;
            emit(EditProfileSuccessState(msg: resp.msg));
          }
          else{
            emit(EditProfileFailedState(msg: resp.msg));
          }
    }


  Future<void> getProfileData(GetProfileEvent event, Emitter<EditProfileStates> emit) async {
    emit(GetProfileLoadingState());
    final resp=await serverGate.sendToServer(url: editProfile);
    if(resp.success){
       profile=ProfileModel.fromJson(resp.response!.data);

      emit(GetProfileSuccessState(msg: resp.msg));
    }
    else{
      emit(GetProfileFailedState(msg: resp.msg));
    }


  }

}