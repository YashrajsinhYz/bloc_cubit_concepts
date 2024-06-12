import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GroceryHomeScreen extends StatefulWidget {
  const GroceryHomeScreen({super.key});

  @override
  State<GroceryHomeScreen> createState() => _GroceryHomeScreenState();
}

class _GroceryHomeScreenState extends State<GroceryHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Grocery Store")),
      body: Center(
        child: BlocConsumer(
          // bloc: ,
          // buildWhen: (previous, current) => ,
          // listenWhen: (previous, current) => ,
          builder: (context, state) {
            return Container();
          },
          listener: (context, state) {},
        ),
      ),
    );
  }
}
