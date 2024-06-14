/*
* Product details model
* */
class ProductModel {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  bool inCart;
  bool inWishlist;

  ProductModel(
      {required this.id,
      required this.name,
      required this.description,
      required this.price,
      required this.imageUrl,
      required this.inCart,
      required this.inWishlist,
      });
}
