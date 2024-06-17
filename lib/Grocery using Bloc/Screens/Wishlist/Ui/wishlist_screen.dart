import 'package:bloc_cubit_concepts/Grocery%20using%20Bloc/Screens/Cart/Bloc/cart_bloc.dart';
import 'package:bloc_cubit_concepts/Grocery%20using%20Bloc/Screens/Home/Ui/grocery_home_screen.dart';
import 'package:bloc_cubit_concepts/Grocery%20using%20Bloc/Screens/Wishlist/Bloc/wishlist_bloc.dart';
import 'package:bloc_cubit_concepts/Grocery%20using%20Bloc/Screens/Wishlist/Bloc/wishlist_event.dart';
import 'package:bloc_cubit_concepts/Grocery%20using%20Bloc/Screens/Wishlist/Bloc/wishlist_state.dart';
import 'package:bloc_cubit_concepts/Grocery%20using%20Bloc/Utilities/Widgets/wishlist_tile_widget.dart';
import 'package:bloc_cubit_concepts/Grocery%20using%20Bloc/Utilities/imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  final WishlistBloc wishlistBloc = WishlistBloc();

  @override
  void initState() {
    super.initState();
    wishlistBloc.add(WishlistInitialEvent());
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
          child: BlocConsumer<WishlistBloc, WishlistState>(
            bloc: wishlistBloc,
            listener: (context, state) {
              if (state is RemovedFromCartActionState) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Item removed from Cart."),
                    duration: Duration(seconds: 1)));
              }
            },
            builder: (context, state) {
              switch (state.runtimeType) {
                case WishlistLoadingState:
                  return const CircularProgressIndicator();
                case WishlistSuccessState:
                  final successState = state as WishlistSuccessState;
                  return successState.wishlistItems.isEmpty
                      ? const Text("Empty Cart.")
                      : ListView.builder(
                          itemCount: successState.wishlistItems.length,
                          itemBuilder: (context, index) {
                            return WishlistTileWidget(
                              wishlistBloc: wishlistBloc,
                              productModel: successState.wishlistItems[index],
                            );
                          },
                        );
              }
              return cartItems.isEmpty
                  ? const Text("Empty Cart.")
                  : ListView.builder(
                      itemCount: cartItems.length,
                      itemBuilder: (context, index) => WishlistTileWidget(
                            wishlistBloc: wishlistBloc,
                            productModel: cartItems[index],
                          ));
            },
          ),
        ),
      ),
    );
  }
}
