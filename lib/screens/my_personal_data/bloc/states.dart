part of'bloc.dart';
class EditProfileStates{}

class EditProfileInitialState extends EditProfileStates{}

class EditProfileLoadingState extends EditProfileStates{}
class EditProfileSuccessState extends EditProfileStates{
  final String msg;

  EditProfileSuccessState({required this.msg});
}
class EditProfileFailedState extends EditProfileStates{
  final String msg;

  EditProfileFailedState({required this.msg});
}

class GetProfileLoadingState extends EditProfileStates{}
class GetProfileSuccessState extends EditProfileStates{
  final String msg;

  GetProfileSuccessState({required this.msg});
}
class GetProfileFailedState extends EditProfileStates{
  final String msg;

  GetProfileFailedState({required this.msg});
}



