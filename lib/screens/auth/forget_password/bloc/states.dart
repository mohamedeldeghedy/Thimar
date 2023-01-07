part of'bloc.dart';
class ForgetPasswordStates{}

class ForgetPasswordInitialState extends ForgetPasswordStates{}

class ForgetPasswordLoadingState extends ForgetPasswordStates{}
class ForgetPasswordSuccessState extends ForgetPasswordStates{
  final String msg;

  ForgetPasswordSuccessState({required this.msg});
}
class ForgetPasswordFailedState extends ForgetPasswordStates{
  final String msg;

  ForgetPasswordFailedState({required this.msg});
}
