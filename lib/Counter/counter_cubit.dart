import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(const InitialState());

  initialValue() => emit(const InitialState());

  void increment() => emit(IncrementState(state.counterValue + 1));

  void decrement() => emit(DecrementState(state.counterValue - 1));
}
