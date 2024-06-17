import 'package:bloc_cubit_concepts/Grocery%20using%20Bloc/Utilities/imports.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class WishlistEvent {}

class WishlistInitialEvent extends WishlistEvent{}

class RemoveFromWishlistEvent extends WishlistEvent{
  final ProductModel productToRemove;

  RemoveFromWishlistEvent(this.productToRemove);
}