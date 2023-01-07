part of'bloc.dart';
class MyAccountStates{}
class MyAccountInitialState extends MyAccountStates{}

class GetMyAccountLoadingState extends MyAccountStates{}
class GetMyAccountSuccessState extends MyAccountStates{
  final String msg;

  GetMyAccountSuccessState({required this.msg});
}
class GetMyAccountFailedState extends MyAccountStates{
  final String msg;

  GetMyAccountFailedState({required this.msg});
}

class LogOutLoadingState extends MyAccountStates{}
class LogOutSuccessState extends MyAccountStates{}
class LogOutFailedState extends MyAccountStates{}

class AboutAppLoadingState extends MyAccountStates{}
class AboutAppSuccessState extends MyAccountStates{}
class AboutAppFailedState extends MyAccountStates{}