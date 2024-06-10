import 'package:equatable/equatable.dart';

abstract class CounterState extends Equatable {
  final int counterValue;
  final bool? wasIncremented;

  const CounterState({required this.counterValue, this.wasIncremented});

  @override
  List<Object?> get props => [counterValue];
}

class InitialState extends CounterState {
  const InitialState() : super(counterValue: 0);
}

class IncrementState extends CounterState {
  const IncrementState(int count) : super(counterValue: count);
}

class DecrementState extends CounterState {
  const DecrementState(int count) : super(counterValue: count);
}
