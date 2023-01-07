part of'bloc.dart';
class FeedsEvents{}
class GetFeedsEvent extends FeedsEvents{}
class GetCategoriesEvent extends FeedsEvents{

}
class GetCategoryProductsEvent extends FeedsEvents{
  int id;
  GetCategoryProductsEvent({required this.id});
}
class GetFavouritesEvent extends FeedsEvents{}
class GetSliderEvent extends FeedsEvents{}



