import 'package:bloc_cubit_concepts/Grocery%20using%20Bloc/Screens/Cart/Bloc/cart_bloc.dart';
import 'package:bloc_cubit_concepts/Grocery%20using%20Bloc/Utilities/imports.dart';
import 'package:flutter/material.dart';

class CartTileWidget extends StatelessWidget {
  final ProductModel productModel;
  final CartBloc cartBloc;

  const CartTileWidget(
      {super.key, required this.productModel, required this.cartBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
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
                    icon: Icon(productModel.inWishlist
                        ? Icons.favorite
                        : Icons.favorite_border),
                    onPressed: null
                    /*() {
                      // cartBloc.add();
                    }*/
                    ,
                  ),
                  IconButton(
                    icon: const Icon(Icons.shopping_cart),
                    onPressed: () {
                      cartBloc.add(
                          RemoveFromCartEvent(productToRemove: productModel));
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
