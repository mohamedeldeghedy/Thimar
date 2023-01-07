part of'bloc.dart';
class BalanceStates{}

class BalanceInitialState extends BalanceStates{}
class PostBalanceLoadingState extends BalanceStates{}
class PostBalanceSuccessState extends BalanceStates{
  String msg;
  PostBalanceSuccessState({required this.msg});
}
class PostBalanceFailedState extends BalanceStates{
  String msg;
  PostBalanceFailedState({required this.msg});
}