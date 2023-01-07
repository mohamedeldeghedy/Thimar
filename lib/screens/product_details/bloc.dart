import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar/core/server_gate.dart';
import 'package:thimar/screens/product_details/model.dart';

import '../home/pages/feeds/model.dart';
import 'components/product_rate/model.dart';
part 'states.dart';
part 'events.dart';
class ProductDetailsBloc extends Bloc<ProductDetailsEvents,ProductDetailsStates>{
  ProductDetailsBloc():super(ProductDetailsInitialState()){
    on<GetProductDetailsEvent>(getProductDetails);
    on<GetPersonRatingEvent>(getPersonRate);
    on<GetSimilarProductsEvent>(getSimilarProducts);
    on<PostAmountEvent>(postAmount);
    on<ChangeAmountEvent>(changeAmount);
    on<PostFavouritesEvent>(postFavourites);
    on<RemoveFavouritesEvent>(removeFavourites);
  }
  
  final serverGate=ServerGate();
  ProductData? product;
  int amount = 1;
  num? totalPrice;

  Future<void> postAmount(
      PostAmountEvent event, Emitter<ProductDetailsStates> emit) async {
    emit(PostAmountLoadingState());
    final resp = await serverGate.sendToServer(
      url: 'client/cart',
      body: {
        'product_id': event.id,
        'amount': amount,
      },
    );
    if (resp.success) {
      if (kDebugMode) {
        print('z-z-z-z===z=---$amount');
      }
      final model = ProductData.fromJson(resp.response!.data);
      product = model;
      emit(PostAmountSuccessState());
    } else {
      emit(PostAmountFailedState());
    }
  }

  double? amrTotalPrice;
  void changeAmount(ChangeAmountEvent event, Emitter<ProductDetailsStates> emit) {
    if ((event.isPlus?amount >= 1:amount>1) && amount <= product!.amount) {
      if (event.isPlus) {
        amount++;
      } else {
        amount--;
      }

      amrTotalPrice = amount * product!.price.toDouble();
      emit(ChangeAmountState());
    }
  }

  Future<void> getProductDetails(GetProductDetailsEvent event, Emitter<ProductDetailsStates> emit) async {
    emit(GetProductDetailsLoadingState());
    final resp = await serverGate.getFromServer(
        url: 'https://thimar.amr.aait-d.com/public/api/products/${event.id}');
    if (resp.success) {
      product = ProductData.fromJson(resp.response!.data['data']);
      emit(GetProductDetailsSuccessState(msg: resp.msg));
    } else {
      emit(GetProductDetailsFailedState(msg: resp.msg));
    }
  }



  List<Rate>? rate;

  Future<void> getPersonRate(
      GetPersonRatingEvent event, Emitter<ProductDetailsStates> emit) async {
    emit(GetPersonRateLoadingState());
    final resp = await serverGate.getFromServer(
        url: 'https://thimar.amr.aait-d.com/public/api/products/2/rates');
    if (resp.success) {
      final model = RateData.fromJson(resp.response!.data);
      rate = model.list;
      emit(GetPersonRateSuccessState(msg: resp.msg));
    } else {
      emit(GetPersonRateFailedState(msg: resp.msg));
    }
  }
  List<Product>? productsList;

  Future<void> getSimilarProducts(GetSimilarProductsEvent event, Emitter<ProductDetailsStates> emit) async {
    emit(GetSimilarProductLoadingState());
    final resp = await serverGate.getFromServer(
        url: 'https://thimar.amr.aait-d.com/public/api/products');
    if (resp.success) {
      final model = FeedsModel.fromJson(resp.response!.data);
      productsList = model.list;
      emit(GetSimilarProductSuccessState(msg: resp.msg));
    } else {
      emit(GetSimilarProductFailedState(msg: resp.msg));
    }
  }
  Future<void> postFavourites(PostFavouritesEvent event, Emitter<ProductDetailsStates> emit) async {
    emit(PostFavouritesLoadingState());
    final resp=await serverGate.sendToServer(url: 'client/products/${event.id}/add_to_favorite',
    );
    if(resp.success){
      emit(PostFavouritesSuccessState(msg: resp.msg));
    }
    else{
      emit(PostFavouritesFailedState(msg: resp.msg));
    }

  }
  Future<void> removeFavourites(RemoveFavouritesEvent event, Emitter<ProductDetailsStates> emit) async {
    emit(RemoveFavouritesLoadingState());
    final resp=await serverGate.sendToServer(url: 'client/products/${event.id}/remove_from_favorite',
    );
    if(resp.success){
      emit(RemoveFavouritesSuccessState(msg: resp.msg));
    }
    else{
      emit(RemoveFavouritesFailedState(msg: resp.msg));
    }

  }


}