import 'package:bloc_cubit_concepts/Grocery%20using%20Bloc/Screens/Home/Bloc/home_bloc.dart';
import 'package:bloc_cubit_concepts/Grocery%20using%20Bloc/Screens/Home/Bloc/home_event.dart';
import 'package:bloc_cubit_concepts/Grocery%20using%20Bloc/Utilities/imports.dart';
import 'package:flutter/material.dart';

class ProductTileWidget extends StatelessWidget {
  final ProductModel productModel;
  final HomeBloc homeBloc;

  const ProductTileWidget(
      {super.key, required this.productModel, required this.homeBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      // padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(productModel.imageUrl)),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(9), topRight: Radius.circular(9))),
          ),
          const SizedBox(height: 10),
          Text(productModel.name,
              style:
                  const TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
          Text(productModel.description),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text("₹ ${productModel.price}"),
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(productModel.inWishlist ? Icons.favorite : Icons.favorite_border),
                    onPressed: () {
                      homeBloc.add(ProductWishlistButtonEvent(
                          clickedProduct: productModel));
                    },
                  ),
                  IconButton(
                    icon: Icon(productModel.inCart ? Icons.shopping_cart : Icons.add_shopping_cart),
                    onPressed: () {
                      homeBloc.add(
                          ProductCartButtonEvent(clickedProduct: productModel));
                    },
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
