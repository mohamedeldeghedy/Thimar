part of'bloc.dart';

class VerifyForgetPasswordStates{}
class VerifyForgetPasswordInitialState extends VerifyForgetPasswordStates{}

class VerifyForgetPasswordLoadingState extends VerifyForgetPasswordStates{}
class VerifyForgetPasswordSuccessState extends VerifyForgetPasswordStates{
  final String msg;

  VerifyForgetPasswordSuccessState({required this.msg});
}
class VerifyForgetPasswordFailedState extends VerifyForgetPasswordStates{
  final String msg;

  VerifyForgetPasswordFailedState({required this.msg});
}

class ResendCodeLoadingState extends VerifyForgetPasswordStates{}
class ResendCodeSuccessState extends VerifyForgetPasswordStates{
  final String msg;

  ResendCodeSuccessState({required this.msg});
}
class ResendCodeFailedState extends VerifyForgetPasswordStates{
  final String msg;

  ResendCodeFailedState({required this.msg});
}