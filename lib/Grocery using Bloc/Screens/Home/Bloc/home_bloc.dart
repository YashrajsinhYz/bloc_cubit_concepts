import 'dart:async';

import 'package:bloc_cubit_concepts/Grocery%20using%20Bloc/Screens/Home/Bloc/home_event.dart';
import 'package:bloc_cubit_concepts/Grocery%20using%20Bloc/Screens/Home/Bloc/home_state.dart';
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
      HomeInitialEvent event, Emitter<HomeState> emit) {}

  FutureOr<void> productCartButtonEvent(
      ProductCartButtonEvent event, Emitter<HomeState> emit) {}

  FutureOr<void> productWishlistButtonEvent(
      ProductWishlistButtonEvent event, Emitter<HomeState> emit) {}

  FutureOr<void> cartButtonNavigateEvent(
      CartButtonNavigateEvent event, Emitter<HomeState> emit) {}

  FutureOr<void> wishlistButtonNavigateEvent(
      WishlistButtonNavigateEvent event, Emitter<HomeState> emit) {}
}
