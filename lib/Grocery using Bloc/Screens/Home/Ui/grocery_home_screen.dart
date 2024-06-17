import 'package:bloc_cubit_concepts/Grocery%20using%20Bloc/Screens/Cart/Ui/cart_screen.dart';
import 'package:bloc_cubit_concepts/Grocery%20using%20Bloc/Screens/Home/Bloc/home_bloc.dart';
import 'package:bloc_cubit_concepts/Grocery%20using%20Bloc/Utilities/Widgets/product_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Utilities/Data/grocery_list.dart';

class GroceryHomeScreen extends StatefulWidget {
  const GroceryHomeScreen({super.key});

  @override
  State<GroceryHomeScreen> createState() => _GroceryHomeScreenState();
}

class _GroceryHomeScreenState extends State<GroceryHomeScreen> {
  final HomeBloc homeBloc = HomeBloc();

  @override
  void initState() {
    super.initState();
    homeBloc.add(HomeInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Grocery Store"),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite),
              tooltip: "Wishlist"),
          IconButton(
              onPressed: () {
                homeBloc.add(CartButtonNavigateEvent());
              },
              icon: const Icon(Icons.shopping_cart),
              tooltip: "Cart"),
        ],
      ),
      body: Center(
        child: BlocConsumer<HomeBloc, HomeState>(
          bloc: homeBloc,
          // buildWhen: (previous, current) => ,
          // listenWhen: (previous, current) => ,
          listener: (context, state) {
            if (state is NavigateToCartActionState) {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const CartScreen()));
            } else if (state is ProductAddedToCartActionState) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Added to Cart."),
                  duration: Duration(seconds: 1)));
            } else if (state is ProductRemovedFromCartActionState) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Removed from Cart."),
                  duration: Duration(seconds: 1)));
            }
          },
          builder: (context, state) {
            switch (state.runtimeType) {
              case HomeLoadingState:
                return const CircularProgressIndicator();
              case HomeSuccessState:
                final successState = state as HomeSuccessState;
                return ListView.builder(
                    itemCount: successState.products.length,
                    itemBuilder: (context, index) => ProductTileWidget(
                          homeBloc: homeBloc,
                          productModel: successState.products[index],
                        ));
            }
            return ListView.builder(
                itemCount: groceryList.length,
                itemBuilder: (context, index) => ProductTileWidget(
                      homeBloc: homeBloc,
                      productModel: groceryList[index],
                    ));
          },
        ),
      ),
    );
  }
}
