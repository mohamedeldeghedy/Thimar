part of'bloc.dart';
class ProductDetailsEvents{}
class GetProductDetailsEvent extends ProductDetailsEvents{
  final int id;
  GetProductDetailsEvent({required this.id});
}
class GetCarousalEvent extends ProductDetailsEvents{
  final int id;

  GetCarousalEvent({required this.id});
}
class GetPersonRatingEvent extends ProductDetailsEvents{
  final int id;
  GetPersonRatingEvent({required this.id,});

}
class GetSimilarProductsEvent extends ProductDetailsEvents{
  final int id;
  GetSimilarProductsEvent({required this.id});
}
class PostAmountEvent extends ProductDetailsEvents{
  final int id;
  PostAmountEvent({required this.id});
}

class ChangeAmountEvent extends ProductDetailsEvents{
  final bool isPlus;

  ChangeAmountEvent({required this.isPlus});
}
class PostFavouritesEvent extends ProductDetailsEvents{
  int id;
  PostFavouritesEvent({required this.id});
}
class RemoveFavouritesEvent extends ProductDetailsEvents{
  int id;
  RemoveFavouritesEvent({required this.id});
}

