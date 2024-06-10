import 'package:bloc_cubit_concepts/Git%20Profile/Cubit/github_profile_cubit.dart';
import 'package:bloc_cubit_concepts/Git%20Profile/Cubit/github_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter/counter_cubit.dart';
import 'counter/counter_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text("Bloc/Cubit Concepts"), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            customElevatedButton(
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CounterScreen(
                      reset: context.read<CounterCubit>().initialValue(),
                    ),
                  ),
                );
              },
              "Counter",
            ),
            const SizedBox(height: 20),
            customElevatedButton(
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GithubProfileScreen(reset: context.read<GithubProfileCubit>().initialState()),
                  ),
                );
              },
              "GET api using Cubit",
            )
          ],
        ),
      ),
    );
  }

  customElevatedButton(VoidCallback func, String buttonLabel) {
    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.75,
        height: MediaQuery.of(context).size.height * 0.05,
        child: ElevatedButton(
          onPressed: func,
          child: Text(buttonLabel, style: const TextStyle(fontSize: 20)),
        )
        /*child: ElevatedButton(onPressed: (){
          Navigator.push(widget., MaterialPageRoute(builder: (context) => routeTo,));
        }, child: Text(buttonLabel, style: const TextStyle(fontSize: 20))),*/
        );
  }
}
