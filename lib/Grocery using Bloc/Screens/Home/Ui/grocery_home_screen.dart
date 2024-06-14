import 'package:bloc_cubit_concepts/Grocery%20using%20Bloc/Screens/Cart/cart_screen.dart';
import 'package:bloc_cubit_concepts/Grocery%20using%20Bloc/Screens/Home/Bloc/home_bloc.dart';
import 'package:bloc_cubit_concepts/Grocery%20using%20Bloc/Screens/Home/Bloc/home_event.dart';
import 'package:bloc_cubit_concepts/Grocery%20using%20Bloc/Screens/Home/Bloc/home_state.dart';
import 'package:bloc_cubit_concepts/Grocery%20using%20Bloc/Utilities/Widgets/product_tile_widget.dart';
import 'package:bloc_cubit_concepts/Grocery%20using%20Bloc/Utilities/imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              Navigator.push(context, MaterialPageRoute(builder: (context) => const CartScreen()));
            } else if (state is ProductAddedToCartActionState) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Added to Cart.")));
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
              /*case ProductAddedToCartActionState : return ListView.builder(
                  itemCount: GroceryData.groceryProducts.length,
                  itemBuilder: (context, index) => ProductTileWidget(
                    homeBloc: homeBloc,
                    productModel: successState.products[index],
                  ));*/
            }
            return Container(
              height: 250,
              width: 390,
              color: Colors.red,
            );
          },
        ),
      ),
    );
  }
}
