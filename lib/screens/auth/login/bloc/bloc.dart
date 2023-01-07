import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar/shared/end_points.dart';

import '../../../../core/cache_helper.dart';
import '../../../../core/server_gate.dart';
import 'model.dart';

part 'events.dart';
part 'states.dart';

class LoginBloc extends Bloc<LoginEvents,LoginStates>{
  LoginBloc():super(LoginInitialState()){
    on<PostLoginEvent>(postUserData);

  }

  var phoneController = TextEditingController();
  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  final serverGate = ServerGate();

  Future<void> postUserData(PostLoginEvent event, Emitter<LoginStates> emit) async {
    emit(LoginLoadingState());
    final resp = await serverGate.sendToServer(url: login
    ,body: {
          'password':passwordController.text,
          'phone':phoneController.text,
          'device_token':'vv',
          'type':'ios',
          'user_type':'client',
        });
    if(resp.success)
      {
        CacheHelper.clear();
        var model =UserData.fromJson(resp.response!.data["data"]) ;
        print(model.token);
        CacheHelper.saveToken(model.token);
        CacheHelper.savePhone(model.phone);
        CacheHelper.saveFullName(model.fullname);
        emit(LoginSuccessState(msg: resp.msg));
      }else
        {
          emit(LoginFailedState(msg: resp.msg));
        }
  }
}