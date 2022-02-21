import 'package:exercise_cubit1/cubit/counter_cubit.dart';
import 'package:exercise_cubit1/presentation/home_page.dart';
import 'package:exercise_cubit1/presentation/second_screen.dart';
import 'package:exercise_cubit1/presentation/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  final CounterCubit _counterCubit = CounterCubit();

  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) =>
                BlocProvider.value(value: _counterCubit, child: HomePage()));

        break;
      case '/second':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                value: _counterCubit, child: SecondScreen()));

        break;
      case '/third':
        return MaterialPageRoute(
            builder: (_) =>
                BlocProvider.value(value: _counterCubit, child: ThirdScreen()));

        break;
      default:
        return null;
    }
  }

  void dispose() {
    _counterCubit.close();
  }
}
