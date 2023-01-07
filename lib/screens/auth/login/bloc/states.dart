part of'bloc.dart';
class LoginStates{}

class LoginInitialState extends LoginStates{}

class LoginLoadingState extends LoginStates{}
class LoginSuccessState extends LoginStates{
  final String msg;

  LoginSuccessState({required this.msg});
}
class LoginFailedState extends LoginStates{
  final String msg;

  LoginFailedState({required this.msg});
}


