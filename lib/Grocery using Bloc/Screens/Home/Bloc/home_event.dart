part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class ProductWishlistButtonEvent extends HomeEvent {
  final ProductModel clickedProduct;

  ProductWishlistButtonEvent({required this.clickedProduct});
}

class ProductCartButtonEvent extends HomeEvent {
  final ProductModel clickedProduct;

  ProductCartButtonEvent({required this.clickedProduct});
}

class WishlistButtonNavigateEvent extends HomeEvent {}

class CartButtonNavigateEvent extends HomeEvent {}
