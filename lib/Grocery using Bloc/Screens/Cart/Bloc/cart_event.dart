part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class CartInitialEvent extends CartEvent {}

class RemoveFromCartEvent extends CartEvent {
  final ProductModel productToRemove;

  RemoveFromCartEvent(this.productToRemove);
}
