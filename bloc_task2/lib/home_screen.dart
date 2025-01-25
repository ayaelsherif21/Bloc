import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_task2/cubits/counterBloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
        title: Text('Counter App'),
        backgroundColor: const Color.fromARGB(255, 176, 39, 153),
        foregroundColor: Colors.white,
      ),
      body: BlocConsumer<CounterCubit, int>(
        listener: (context, state) {
          if (state == 10 || state == -10) {
            final message = state == 10
                ? 'Counter reached 10'
                : 'Counter reached -10';
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(message)),
            );
          } else if (state == -1) {
            showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: Text('Negative Value'),
                content: Text('Now the Counter is negative: $state'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text('OK'),
                  ),
                ],
              ),
            );
          }
        },
        builder: (context, state) {
          return Center(
            child: Text(
              'Counter Value: $state',
              style: TextStyle(fontSize: 22),
            ),
          );
        },
      ),
 floatingActionButton:  Row(
    mainAxisAlignment: MainAxisAlignment.center, // Center the buttons
    children: [
      FloatingActionButton(
        onPressed: () => context.read<CounterCubit>().increment(),
        child: Icon(Icons.add),
      ),
      SizedBox(width: 5),
      FloatingActionButton(
        onPressed: () => context.read<CounterCubit>().decrement(),
        child: Icon(Icons.remove),
      ),
    ],
  ),


    );
  }
}
