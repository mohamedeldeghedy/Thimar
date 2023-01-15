part of'bloc.dart';
class RegisterStates{}

class RegisterInitialState extends RegisterStates{}

class RegisterLoadingState extends RegisterStates{}
class RegisterSuccessState extends RegisterStates{
  final String msg;

  RegisterSuccessState({required this.msg});
}
class RegisterFailedState extends RegisterStates{
  final String msg;

  RegisterFailedState({required this.msg});
}

class GetCitySuccessState extends RegisterStates{}
class GetCityFailedState extends RegisterStates{}


