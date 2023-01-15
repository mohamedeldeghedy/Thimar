import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar/screens/home/pages/feeds/bloc/slider_model.dart';
import '../../../../../core/server_gate.dart';
import '../../favorites/model.dart';
import '../category_product_model.dart';
import '../model.dart';

part 'events.dart';

part 'states.dart';

class FeedsBloc extends Bloc<FeedsEvents, FeedsStates> {
  FeedsBloc() : super(FeedsInitialState()) {
    on<GetFeedsEvent>(getFeeds);
    on<GetCategoriesEvent>(getCategories);
    on<GetFavouritesEvent>(getFavourites);
    on<GetSliderEvent>(getSlider);
    on<GetCategoryProductsEvent>(getCategoryProducts);
    on<PostPriceEvent>(postPrice);

  }

  final serverGate = ServerGate();
  double slider=120;

  FeedsModel? products;
  Future<void> getFeeds(GetFeedsEvent event, Emitter<FeedsStates> emit) async {
    emit(GetFeedsLoadingState());
    final resp = await serverGate.getFromServer(
        url: 'https://thimar.amr.aait-d.com/public/api/products');
    if (resp.success) {
      final model = FeedsModel.fromJson(resp.response!.data);
      products = model;
      emit(GetFeedsSuccessState(msg: resp.msg));
    } else {
      emit(GetFeedsFailedState(msg: resp.msg));
    }
  }

  FeedsModel? categories;

  Future<void> getCategories(GetCategoriesEvent event, Emitter<FeedsStates> emit) async {
    emit(GetCategoriesLoadingState());
    final resp = await serverGate.getFromServer(
        url: 'https://thimar.amr.aait-d.com/public/api/categories');
    if (resp.success) {
      final model = FeedsModel.fromJson(resp.response!.data);
      categories = model;
      emit(GetCategoriesSuccessState(msg: resp.msg));
    } else {
      emit(GetCategoriesFailedState(msg: resp.msg));
    }
  }

  CategoryProductsModel? categoryProducts;
  Future<void> getCategoryProducts(GetCategoryProductsEvent event, Emitter<FeedsStates> emit) async {
    emit(GetCategoryProductsLoadingState());
    final resp = await serverGate.getFromServer(
        url: 'https://thimar.amr.aait-d.com/public/api/categories/${event.id}');
    if (resp.success) {
      final model = CategoryProductsModel.fromJson(resp.response!.data);
      categoryProducts = model;
      emit(GetCategoryProductsSuccessState(msg: resp.msg));
    } else {
      emit(GetCategoryProductsFailedState(msg: resp.msg));
    }
  }


  FavouritesData? favouritesData;
  List<FavouritesData>? data;
  Future<void> getFavourites(GetFavouritesEvent event, Emitter<FeedsStates> emit) async {
    emit(GetFavouritesLoadingState());
    final resp=await serverGate.getFromServer(url: 'client/products/favorites');
    if(resp.success){
      final s=FavouritesModel.fromJson(resp.response!.data);
      final model=FavouritesData.fromJson(resp.response!.data);
      favouritesData=model;
      data=s.data;
      emit(GetFavouritesSuccessState());
    }
    else{
      emit(GetFavouritesFailedState(msg: resp.msg));
    }
  }

  SliderModel? sliderModel;
  Future<void> getSlider(GetSliderEvent event, Emitter<FeedsStates> emit) async {
    emit(GetSliderLoadingState());
    final resp=await serverGate.getFromServer(url: 'sliders');
    if(resp.success){
      sliderModel=SliderModel.fromJson(resp.response!.data);
      emit(GetFavouritesSuccessState());
    }
    else{
      emit(GetSliderFailedState());
    }
  }

  RangeValues currentRangeValues = const RangeValues(5, 80);


  Future<void> postPrice(PostPriceEvent event, Emitter<FeedsStates> emit) async {
    emit(PostPriceLoadingState());

    final resp=await serverGate.sendToServer(url: 'search/?keyword=${event.word}&filter=asc&min_price=${currentRangeValues.start}&max_price=${currentRangeValues.end}',
    body: {
      'keyword':event.word
    });
    if(resp.success){
      final model = CategoryProductsModel.fromJson(resp.response!.data);
      categoryProducts = model;
      emit(PostPriceSuccessState());
    }
    else{
      emit(PostPriceFailedState());
    }

  }
}
