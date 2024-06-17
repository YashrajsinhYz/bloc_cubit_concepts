import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Utilities/Data/grocery_list.dart';
import '../../../Utilities/imports.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitialState()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<RemoveFromCartEvent>(removeFromCartEvent);
  }

  FutureOr<void> cartInitialEvent(
      CartInitialEvent event, Emitter<CartState> emit) async {
    emit(CartLoadingState());

    await Future.delayed(const Duration(seconds: 1));

    emit(CartSuccessState(cartItems: cartItems));
  }

  FutureOr<void> removeFromCartEvent(
      RemoveFromCartEvent event, Emitter<CartState> emit) async {
    emit(CartLoadingState());

    cartItems.remove(event.productToRemove);
    event.productToRemove.inCart = false;
    await Future.delayed(const Duration(seconds: 1));

    emit(RemovedFromCartActionState());

    // update groceryList's cart flag
    groceryList.map((e) {
      if (e.name == event.productToRemove.name) {
        e.inCart = event.productToRemove.inCart;
      }
    }).toList();
  }
}
