import 'package:flutter/foundation.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSuccessState extends HomeState {}

class HomeErrorState extends HomeState {}

abstract class HomeActionState extends HomeState {}

class NavigateToCartActionState extends HomeActionState {}

class NavigateToWishlistActionState extends HomeActionState {}

class ProductAddedToCartActionState extends HomeActionState {}

class ProductAddedToWishlistActionState extends HomeActionState {}
