part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

class CartInitialState extends CartState {}

class CartLoadingState extends CartState {}

class CartSuccessState extends CartState {
  final List<ProductModel> cartItems;

  CartSuccessState({required this.cartItems});
}

abstract class CartActionState extends CartState {}

class RemovedFromCartActionState extends CartActionState {}
