import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:exercise_cubit1/cubit/counter/counter_state.dart';
import 'package:exercise_cubit1/presentation/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/counter/counter_cubit.dart';
import 'cubit/internet_cubit/internet_cubit.dart';
import 'presentation/home_page.dart';

void main() {
  runApp(MyApp(
    appRouter: AppRouter(),
    connectivity: Connectivity(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  final Connectivity connectivity;
  const MyApp({Key? key, required this.appRouter, required this.connectivity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
          create: (context) => InternetCubit(connectivity: connectivity),
        ),
        BlocProvider<CounterCubit>(
          create: (context) => CounterCubit(),
        ),
      ],
      child: MaterialApp(
        onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
  }
}
