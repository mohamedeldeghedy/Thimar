part of'bloc.dart';
class NewPasswordStates{}

class NewPasswordInitialState extends NewPasswordStates{}

class NewPasswordLoadingState extends NewPasswordStates{}
class NewPasswordSuccessState extends NewPasswordStates{
  final String msg;

  NewPasswordSuccessState({required this.msg});
}
class NewPasswordFailedState extends NewPasswordStates{
  final String msg;

  NewPasswordFailedState({required this.msg});
}