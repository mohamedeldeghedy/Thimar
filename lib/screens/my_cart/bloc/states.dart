part of'bloc.dart';
class CartStates{}
class CartInitialState extends CartStates{}

class GetCartLoadingState extends CartStates{}
class GetCartSuccessState extends CartStates{}
class GetCartFailedState extends CartStates{}

class PostCopounLoadingState extends CartStates{}
class PostCopounSuccessState extends CartStates{
  String msg;
  PostCopounSuccessState({required this.msg});
}
class PostCopounFailedState extends CartStates{
  String msg;
  PostCopounFailedState({required this.msg});
}

class DeleteProductLoadingState extends CartStates{}
class DeleteProductSuccessState extends CartStates{}
class DeleteProductFailedState extends CartStates{}

class UpdateCartSuccessState extends CartStates{}
class UpdateCartLoadingState extends CartStates{}
class UpdateCartFailedState extends CartStates{}

class ChangeAmountsState extends CartStates{}


