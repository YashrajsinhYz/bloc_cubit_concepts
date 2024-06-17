import 'package:bloc_cubit_concepts/Grocery%20using%20Bloc/Screens/Cart/Bloc/cart_bloc.dart';
import 'package:bloc_cubit_concepts/Grocery%20using%20Bloc/Screens/Home/Ui/grocery_home_screen.dart';
import 'package:bloc_cubit_concepts/Grocery%20using%20Bloc/Utilities/Widgets/cart_tile_widget.dart';
import 'package:bloc_cubit_concepts/Grocery%20using%20Bloc/Utilities/imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final CartBloc cartBloc = CartBloc();

  @override
  void initState() {
    super.initState();
    cartBloc.add(CartInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const GroceryHomeScreen(),
            ));
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(title: const Text("Your Cart")),
        body: Center(
          child: BlocConsumer<CartBloc, CartState>(
            bloc: cartBloc,
            listener: (context, state) {
              if (state is RemovedFromCartActionState) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Item removed from Cart."),
                    duration: Duration(seconds: 1)));
              }
            },
            builder: (context, state) {
              switch (state.runtimeType) {
                case CartLoadingState:
                  return const CircularProgressIndicator();
                case CartSuccessState:
                  final successState = state as CartSuccessState;
                  return successState.cartItems.isEmpty
                      ? const Text("Empty Cart.")
                      : ListView.builder(
                          itemCount: successState.cartItems.length,
                          itemBuilder: (context, index) {
                            return CartTileWidget(
                              cartBloc: cartBloc,
                              productModel: successState.cartItems[index],
                            );
                          },
                        );
              }
              return cartItems.isEmpty
                  ? const Text("Empty Cart.")
                  : ListView.builder(
                      itemCount: cartItems.length,
                      itemBuilder: (context, index) => CartTileWidget(
                            cartBloc: cartBloc,
                            productModel: cartItems[index],
                          ));
            },
          ),
        ),
      ),
    );
  }
}
