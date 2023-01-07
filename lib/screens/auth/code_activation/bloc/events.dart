part of'bloc.dart';

class VerifyForgetPasswordEvents{}
class PostVerifyForgetPasswordEvent extends VerifyForgetPasswordEvents{
  final String phone;

  PostVerifyForgetPasswordEvent({required this.phone});
}

class ResendCodeEvent extends VerifyForgetPasswordEvents{
  final String phone;

  ResendCodeEvent({required this.phone});
}