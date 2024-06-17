part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSuccessState extends HomeState {
  final List<ProductModel> products;

  HomeSuccessState({required this.products});
}

class HomeErrorState extends HomeState {}

abstract class HomeActionState extends HomeState {}

class NavigateToCartActionState extends HomeActionState {}

class NavigateToWishlistActionState extends HomeActionState {}

class ProductAddedToCartActionState extends HomeActionState {}

class ProductRemovedFromCartActionState extends HomeActionState {}

class ProductAddedToWishlistActionState extends HomeActionState {}
