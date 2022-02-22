import 'package:exercise_cubit1/constants/enums.dart';
import 'package:exercise_cubit1/cubit/counter/counter_cubit.dart';
import 'package:exercise_cubit1/cubit/counter/counter_state.dart';
import 'package:exercise_cubit1/cubit/internet_cubit/internet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './second_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<InternetCubit, InternetState>(
      listener: (context, state) {
        if (state is InternetConnected &&
            state.connectionType == ConnectionType.Wifi) {
          context.read<CounterCubit>().increment();
          //context.bloc<CounterCubit>().incremenet();
        } else if (state is InternetConnected &&
            state.connectionType == ConnectionType.Mobile) {
          context.read<CounterCubit>().decrement();
        }
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text("Counter Cubit Example"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<InternetCubit, InternetState>(
                  builder: (context, state) {
                    if (state is InternetConnected &&
                        state.connectionType == ConnectionType.Wifi) {
                      return Text("WİFİ");
                    } else if (state is InternetConnected &&
                        state.connectionType == ConnectionType.Mobile) {
                      return Text("MOBİLE");
                    } else if (state is InternetDisconnected) {
                      return Text("DISCONNECTED");
                    }
                    return CircularProgressIndicator();
                  },
                ),
                SizedBox(
                  height: 25,
                ),
                BlocConsumer<CounterCubit, CounterState>(
                  listener: (context, state) {
                    if (state.wasIncremented == true) {
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text("INCREMENTED"),
                          duration: Duration(milliseconds: 300),
                        ),
                      );
                    }
                    if (state.wasIncremented == false) {
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text("DECREMENTED"),
                          duration: Duration(milliseconds: 300),
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Counter Value ",
                            style: TextStyle(fontSize: 25),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Icon(Icons.arrow_circle_down_rounded),
                          SizedBox(
                            height: 25,
                          ),
                          Text(
                            state.counterValue.toString(),
                            style: TextStyle(fontSize: 50),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              FloatingActionButton(
                                onPressed: () {
                                  BlocProvider.of<CounterCubit>(context)
                                      .decrement();
                                },
                                child: Icon(Icons.remove),
                              ),
                              FloatingActionButton(
                                onPressed: () {
                                  BlocProvider.of<CounterCubit>(context)
                                      .increment();
                                },
                                child: Icon(Icons.add),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          MaterialButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed('/second');
                            },
                            color: Colors.black,
                            child: Text(
                              'Go to Second Screen',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          MaterialButton(
                            color: Colors.black,
                            onPressed: () {
                              Navigator.of(context).pushNamed('/third');
                            },
                            child: Text(
                              'Go to Third Screen',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          )),
    );
  }
}
