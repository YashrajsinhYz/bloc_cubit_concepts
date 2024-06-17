import 'dart:async';

import 'package:bloc_cubit_concepts/Grocery%20using%20Bloc/Screens/Wishlist/Bloc/wishlist_event.dart';
import 'package:bloc_cubit_concepts/Grocery%20using%20Bloc/Screens/Wishlist/Bloc/wishlist_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Utilities/Data/grocery_list.dart';
import '../../../Utilities/Data/wishlist_items.dart';

class WishlistBloc extends Bloc<WishlistEvent,WishlistState>{
  WishlistBloc():super(WishlistInitialState()){
   on<WishlistInitialEvent>(wishlistInitialEvent);
   on<RemoveFromWishlistEvent>(removeFromWishlistEvent);
  }

  FutureOr<void> wishlistInitialEvent(WishlistInitialEvent event, Emitter<WishlistState> emit) async {
    emit(WishlistLoadingState());

    await Future.delayed(const Duration(seconds: 1));

    emit(WishlistSuccessState(wishlistItems: wishListItems));
  }

  FutureOr<void> removeFromWishlistEvent(RemoveFromWishlistEvent event, Emitter<WishlistState> emit) async {
    emit(WishlistLoadingState());

    wishListItems.remove(event.productToRemove);

    event.productToRemove.inWishlist = false;
    await Future.delayed(const Duration(seconds: 1));

    emit(RemovedFromWishlistActionState());

    // update groceryList's cart flag
    groceryList.map((e) {
      if (e.name == event.productToRemove.name) {
        e.inWishlist = event.productToRemove.inWishlist;
      }
    }).toList();

  }
}