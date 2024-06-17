import 'package:flutter/foundation.dart';

import '../../../Utilities/Models/product_model.dart';

@immutable
abstract class WishlistState {}

class WishlistInitialState extends WishlistState {}

class WishlistLoadingState extends WishlistState {}

class WishlistSuccessState extends WishlistState {
  final List<ProductModel> wishlistItems;

  WishlistSuccessState({required this.wishlistItems});
}

abstract class WishlistActionState extends WishlistState {}

class RemovedFromWishlistActionState extends WishlistActionState {}