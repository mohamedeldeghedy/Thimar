part of'bloc.dart';


class FeedsStates{}
class FeedsInitialState extends FeedsStates{}

class GetFeedsLoadingState extends FeedsStates{}
class GetFeedsSuccessState extends FeedsStates {
  final String msg;

  GetFeedsSuccessState({required this.msg});
}
class GetFeedsFailedState extends FeedsStates{
  final String msg;

  GetFeedsFailedState({required this.msg});
}

class GetCategoriesLoadingState extends FeedsStates{}
class GetCategoriesSuccessState extends FeedsStates {
  final String msg;

  GetCategoriesSuccessState({required this.msg});
}
class GetCategoriesFailedState extends FeedsStates{
  final String msg;

  GetCategoriesFailedState({required this.msg});
}
class GetCategoryProductsLoadingState extends FeedsStates{}
class GetCategoryProductsSuccessState extends FeedsStates {
  final String msg;

  GetCategoryProductsSuccessState({required this.msg});
}
class GetCategoryProductsFailedState extends FeedsStates{
  final String msg;

  GetCategoryProductsFailedState({required this.msg});
}

class GetFavouritesLoadingState extends FeedsStates{}
class GetFavouritesSuccessState extends FeedsStates{}
class GetFavouritesFailedState extends FeedsStates{
  String msg;
  GetFavouritesFailedState({required this.msg});
}
class GetSliderLoadingState extends FeedsStates{}
class GetSliderSuccessState extends FeedsStates{}
class GetSliderFailedState extends FeedsStates{}






