import 'dart:async';

import 'package:exercise_cubit1/constants/enums.dart';
import 'package:exercise_cubit1/cubit/internet_cubit/internet_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> with HydratedMixin {
  CounterCubit() : super(CounterState(counterValue: 0));

  void increment() => emit(
        CounterState(
            counterValue: state.counterValue! + 1, wasIncremented: true),
      );

  void decrement() => emit(CounterState(
      counterValue: state.counterValue! - 1, wasIncremented: false));

  @override
  CounterState? fromJson(Map<String, dynamic> json) {
    return CounterState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(CounterState state) {
    return state.toMap();
  }
}
