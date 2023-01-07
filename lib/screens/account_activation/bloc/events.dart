part of'bloc.dart';
class VerificationEvents{}
class PostVerificationCodeEvent extends VerificationEvents{
  final String phone;

  PostVerificationCodeEvent({required this.phone});
}
class GetVerificationDataEvent extends VerificationEvents{}