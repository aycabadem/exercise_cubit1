import 'dart:async';

import 'package:exercise_cubit1/constants/enums.dart';
import 'package:exercise_cubit1/cubit/internet_cubit/internet_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(counterValue: 0));

  void increment() => emit(
        CounterState(
            counterValue: state.counterValue! + 1, wasIncremented: true),
      );

  void decrement() => emit(CounterState(
      counterValue: state.counterValue! - 1, wasIncremented: false));
}
