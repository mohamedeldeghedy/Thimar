part of'bloc.dart';
class EditPasswordStates{}

class EditPasswordInitialState extends EditPasswordStates{}

class EditPasswordLoadingState extends EditPasswordStates{}
class EditPasswordSuccessState extends EditPasswordStates{
  final String msg;

  EditPasswordSuccessState({required this.msg});
}
class EditPasswordFailedState extends EditPasswordStates{
  final String msg;

  EditPasswordFailedState({required this.msg});
}