import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_cubit.dart';
import 'counter_state.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({Key? key, this.reset}) : super(key: key);

  final reset;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter using Bloc/Cubit"),
        centerTitle: true,
      ),
      body: BlocListener<CounterCubit, CounterState>(
        listener: (context, state) {
          if (state.wasIncremented == true) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Incremented!"),
              duration: Duration(milliseconds: 300),
            ));
          } else if (state.wasIncremented == false) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Decremented!"),
              duration: Duration(milliseconds: 300),
            ));
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              BlocBuilder<CounterCubit, CounterState>(
                builder: (context, state) {
                  /*if (state is InitialState) {
                  return Text("${state.counterValue}");
                } else if (state is IncrementState) {
                  return Text("${state.counterValue}");
                } else if (state is DecrementState) {
                  return Text("${state.counterValue}");
                }
                return Container();*/
                  return Text(
                    state.counterValue.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                      onPressed: () {
                        // BlocProvider.of<CounterCubit>(context).decrement();
                        context.read<CounterCubit>().decrement();
                      },
                      heroTag: "decrement",
                      child: const Icon(Icons.remove)),
                  FloatingActionButton(
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).increment();
                      // context.read<CounterCubit>().increment();
                    },
                    heroTag: "increment",
                    child: const Icon(Icons.add),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
