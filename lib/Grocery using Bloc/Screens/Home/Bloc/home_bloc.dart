import 'dart:async';

import 'package:bloc_cubit_concepts/Grocery%20using%20Bloc/Screens/Home/Bloc/home_event.dart';
import 'package:bloc_cubit_concepts/Grocery%20using%20Bloc/Screens/Home/Bloc/home_state.dart';
import 'package:bloc_cubit_concepts/Grocery%20using%20Bloc/Utilities/imports.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<ProductCartButtonEvent>(productCartButtonEvent);
    on<ProductWishlistButtonEvent>(productWishlistButtonEvent);
    on<CartButtonNavigateEvent>(cartButtonNavigateEvent);
    on<WishlistButtonNavigateEvent>(wishlistButtonNavigateEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());

    await Future.delayed(const Duration(seconds: 3));

    emit(HomeSuccessState(
      products: GroceryData.groceryProducts
          .map((e) => ProductModel(
              id: e["id"],
              name: e["name"],
              description: e["description"],
              price: e["price"],
              imageUrl: e["imageUrl"],
              inCart: e["inCart"],
              inWishlist: e["inWishlist"]))
          .toList(),
    ));
  }

  FutureOr<void> productCartButtonEvent(
      ProductCartButtonEvent event, Emitter<HomeState> emit) {
    cartItems.add(event.clickedProduct);
    event.clickedProduct.inCart = true;
    emit(ProductAddedToCartActionState());
    /*emit(HomeSuccessState(
      products: GroceryData.groceryProducts
          .map((e) => ProductModel(
              id: e["id"],
              name: e["name"],
              description: e["description"],
              price: e["price"],
              imageUrl: e["imageUrl"],
              inCart: (e["name"] == event.clickedProduct.name)
                  ? event.clickedProduct.inCart
                  : e["inCart"],
              inWishlist: e["inWishlist"]))
          .toList(),
    ));*/
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
