import 'package:exercise_cubit1/cubit/counter/counter_cubit.dart';
import 'package:exercise_cubit1/presentation/home_page.dart';
import 'package:exercise_cubit1/presentation/second_screen.dart';
import 'package:exercise_cubit1/presentation/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomePage());

      case '/second':
        return MaterialPageRoute(builder: (_) => SecondScreen());

        break;
      case '/third':
        return MaterialPageRoute(builder: (_) => ThirdScreen());

        break;
      default:
        return null;
    }
  }
}
