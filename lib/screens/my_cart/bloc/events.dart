part of'bloc.dart';
class CartEvents{}

class GetCartEvent extends CartEvents{
   bool isLoading=true;
  GetCartEvent({required this.isLoading});
}
class PostCopounEvent extends CartEvents{}
class DeleteProductEvent extends CartEvents{
  int id;
  DeleteProductEvent({required this.id});
}
class UpdateCartEvent extends CartEvents{
  int id;
  int amount;
  UpdateCartEvent({required this.id,required this.amount});
}
class ChangeAmountsEvent extends CartEvents{
  final bool isPlus;

  ChangeAmountsEvent({required this.isPlus});
}
