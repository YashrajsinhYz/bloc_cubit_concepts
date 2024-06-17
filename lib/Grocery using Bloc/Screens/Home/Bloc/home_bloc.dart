import 'dart:async';
import 'package:bloc_cubit_concepts/Grocery%20using%20Bloc/Utilities/Data/grocery_list.dart';
import 'package:bloc_cubit_concepts/Grocery%20using%20Bloc/Utilities/imports.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<ProductCartButtonEvent>(productCartButtonEvent);
    on<ProductWishlistButtonEvent>(productWishlistButtonEvent);
    on<CartButtonNavigateEvent>(cartButtonNavigateEvent);
    on<WishlistButtonNavigateEvent>(wishlistButtonNavigateEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());

    await Future.delayed(const Duration(milliseconds: 1300));

    // Convert json to List<ProductModel>
    if (groceryList.isEmpty) {
      groceryList = GroceryData.groceryProducts
        .map((e) => ProductModel(
            id: e["id"],
            name: e["name"],
            description: e["description"],
            price: e["price"],
            imageUrl: e["imageUrl"],
            inCart: e["inCart"],
            inWishlist: e["inWishlist"]))
        .toList();
    }

    emit(HomeSuccessState(products: groceryList));
  }

  FutureOr<void> productCartButtonEvent(
      ProductCartButtonEvent event, Emitter<HomeState> emit) {
    if (cartItems.contains(event.clickedProduct))
      {
        cartItems.remove(event.clickedProduct);
        event.clickedProduct.inCart = false;
        emit(ProductRemovedFromCartActionState());
      } else {
      cartItems.add(event.clickedProduct);
      event.clickedProduct.inCart = true;
      emit(ProductAddedToCartActionState());
    }

    // update groceryList's cart flag
    groceryList.map((e) {
      if (e.name == event.clickedProduct.name) {
        e.inCart = event.clickedProduct.inCart;
      }
    }).toList();

    emit(HomeSuccessState(products: groceryList));
  }

  FutureOr<void> productWishlistButtonEvent(
      ProductWishlistButtonEvent event, Emitter<HomeState> emit) {
    wishListItems.add(event.clickedProduct);
    emit(ProductAddedToWishlistActionState());
  }

  FutureOr<void> cartButtonNavigateEvent(
      CartButtonNavigateEvent event, Emitter<HomeState> emit) {
    emit(NavigateToCartActionState());
  }

  FutureOr<void> wishlistButtonNavigateEvent(
      WishlistButtonNavigateEvent event, Emitter<HomeState> emit) {}
}
