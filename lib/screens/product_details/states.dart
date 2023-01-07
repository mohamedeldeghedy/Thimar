part of'bloc.dart';
class ProductDetailsStates{}
class ProductDetailsInitialState extends ProductDetailsStates{}

class ProductDetailsSuccessState extends ProductDetailsStates{}
class ProductDetailsLoadingState extends ProductDetailsStates{}
class ProductDetailsFailedState extends ProductDetailsStates{}

class GetProductDetailsLoadingState extends ProductDetailsStates {}
class GetProductDetailsSuccessState extends ProductDetailsStates {
  final String msg;

  GetProductDetailsSuccessState({required this.msg});
}
class GetProductDetailsFailedState extends ProductDetailsStates {
  final String msg;

  GetProductDetailsFailedState({required this.msg});
}

class GetCarousalLoadingState extends ProductDetailsStates {}
class GetCarousalSuccessState extends ProductDetailsStates {
  final String msg;

  GetCarousalSuccessState({required this.msg});
}
class GetCarousalFailedState extends ProductDetailsStates {
  final String msg;

  GetCarousalFailedState({required this.msg});
}

class GetPersonRateLoadingState extends ProductDetailsStates{}
class GetPersonRateSuccessState extends ProductDetailsStates{
  final String msg;

  GetPersonRateSuccessState({required this.msg});
}
class GetPersonRateFailedState extends ProductDetailsStates{
  final String msg;

  GetPersonRateFailedState({required this.msg});
}

class GetSimilarProductLoadingState extends ProductDetailsStates{}
class GetSimilarProductSuccessState extends ProductDetailsStates{
  final String msg;

  GetSimilarProductSuccessState({required this.msg});
}
class GetSimilarProductFailedState extends ProductDetailsStates{
  final String msg;

  GetSimilarProductFailedState({required this.msg});
}
class PostAmountLoadingState extends ProductDetailsStates{}
class PostAmountSuccessState extends ProductDetailsStates{

}
class PostAmountFailedState extends ProductDetailsStates{}


class ChangeAmountState extends ProductDetailsStates{
}
class PostFavouritesLoadingState extends ProductDetailsStates{}
class PostFavouritesSuccessState extends ProductDetailsStates{
  String msg;
  PostFavouritesSuccessState({required this.msg});
}
class PostFavouritesFailedState extends ProductDetailsStates{
  String msg;
  PostFavouritesFailedState({required this.msg});
}

class RemoveFavouritesLoadingState extends ProductDetailsStates{}
class RemoveFavouritesSuccessState extends ProductDetailsStates{
  String msg;
  RemoveFavouritesSuccessState({required this.msg});
}
class RemoveFavouritesFailedState extends ProductDetailsStates{
  String msg;
  RemoveFavouritesFailedState({required this.msg});
}

