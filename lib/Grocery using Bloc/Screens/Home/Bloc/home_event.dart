import 'package:flutter/foundation.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class ProductWishlistButtonEvent extends HomeEvent {}

class ProductCartButtonEvent extends HomeEvent {}

class WishlistButtonNavigateEvent extends HomeEvent {}

class CartButtonNavigateEvent extends HomeEvent {}
