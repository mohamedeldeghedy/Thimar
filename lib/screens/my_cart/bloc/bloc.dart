import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar/core/server_gate.dart';
import 'package:thimar/screens/my_cart/bloc/model.dart';

part 'events.dart';

part 'states.dart';

class CartBloc extends Bloc<CartEvents, CartStates> {
  CartBloc() : super(CartInitialState()) {
    on<GetCartEvent>(getCart);
    on<PostCopounEvent>(postCopoun);
    on<DeleteProductEvent>(deleteProduct);
    on<UpdateCartEvent>(updateCart);
  }

  var copounController = TextEditingController();
  final serverGate = ServerGate();
  List<CartProduct>? data;
  CartProduct? cart;
  CartModel? cartModel;
  int? total;

  Future<void> getCart(GetCartEvent event, Emitter<CartStates> emit) async {
    if (event.isLoading) {
      emit(GetCartLoadingState());
    }

    final resp = await serverGate.getFromServer(url: 'client/cart');

    if (resp.success) {
      cartModel = CartModel.fromJson(resp.response!.data);
      data = cartModel!.data;
      cart = CartProduct.fromJson(resp.response!.data);
      total = cartModel!.totalPriceWithVat - cartModel!.totalDiscount;
      emit(GetCartSuccessState());
    } else {
      emit(GetCartFailedState());
    }
  }

  Future<void> postCopoun(
      PostCopounEvent event, Emitter<CartStates> emit) async {
    emit(PostCopounLoadingState());
    final resp = await serverGate.sendToServer(
        url: 'client/cart/apply_coupon', body: {'code': copounController.text});
    if (resp.success) {
      emit(PostCopounSuccessState(msg: resp.msg));
    } else {
      if (kDebugMode) {
        print("failed msg -==-=-=-=-=-  ${resp.msg}");
      }
      emit(PostCopounFailedState(msg: resp.msg));
    }
  }

  Future<void> deleteProduct(
      DeleteProductEvent event, Emitter<CartStates> emit) async {
    emit(DeleteProductLoadingState());
    final resp = await serverGate
        .sendToServer(url: 'client/cart/delete_item/${event.id}', body: {
      '_method': 'DELETE',
    });
    if (resp.success) {
      emit(DeleteProductSuccessState());
    } else {
      emit(DeleteProductFailedState());
    }
  }

  Future<void> updateCart(
      UpdateCartEvent event, Emitter<CartStates> emit) async {
    emit(UpdateCartLoadingState());
    final resp =
        await serverGate.sendToServer(url: 'client/cart/${event.id}', body: {
      '_method': 'PUT',
      'amount': event.amount,
    });
    if (resp.success) {
      emit(UpdateCartSuccessState());
    } else {
      emit(UpdateCartSuccessState());
    }
  }
}
