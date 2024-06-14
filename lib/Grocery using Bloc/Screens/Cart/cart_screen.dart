import 'package:bloc_cubit_concepts/Grocery%20using%20Bloc/Utilities/Widgets/product_tile_widget.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Your Cart")),
      body: Center(
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            // return ProductTileWidget(productModel: productModel, homeBloc: homeBloc);
            return Container();
          },
        ),
      ),
    );
  }
}
