part of'bloc.dart';
class VerificationStates{}
class VerificationInitialState extends VerificationStates{}

class PostVerificationLoadingState extends VerificationStates{}
class PostVerificationSuccessState extends VerificationStates{
  final String msg;

  PostVerificationSuccessState({required this.msg});
}
class PostVerificationFailedState extends VerificationStates{
  final String msg;

  PostVerificationFailedState({required this.msg});
}

class GetUserDataLoadingState extends VerificationStates{}
class GetUserDataSuccessState extends VerificationStates{}
class GetUserDataFailedState extends VerificationStates{}