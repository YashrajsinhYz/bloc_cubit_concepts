import 'package:bloc_cubit_concepts/Git%20Profile/Cubit/github_profile_cubit.dart';
import 'package:bloc_cubit_concepts/Grocery%20using%20Bloc/Screens/Home/Ui/grocery_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Grocery using Bloc/Screens/Home/Bloc/home_bloc.dart';
import 'counter/counter_cubit.dart';
import 'home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterCubit>(
          create: (context) => CounterCubit(),
        ),
        BlocProvider<GithubProfileCubit>(
          create: (context) => GithubProfileCubit(),
        ),
        BlocProvider(create: (context) => HomeBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
