part of'bloc.dart';

class NewPasswordEvents{}

class PostNewPasswordEvent extends NewPasswordEvents{
  String phone;
  String code;
  PostNewPasswordEvent({required this.phone,required this.code});
}