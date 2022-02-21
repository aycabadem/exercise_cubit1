import 'package:exercise_cubit1/cubit/counter_cubit.dart';
import 'package:exercise_cubit1/cubit/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './second_screen.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Third Screen"),
        ),
        body: BlocConsumer<CounterCubit, CounterState>(
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
                          BlocProvider.of<CounterCubit>(context).decrement();
                        },
                        child: Icon(Icons.remove),
                      ),
                      FloatingActionButton(
                        onPressed: () {
                          BlocProvider.of<CounterCubit>(context).increment();
                        },
                        child: Icon(Icons.add),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
            );
          },
        ));
  }
}
