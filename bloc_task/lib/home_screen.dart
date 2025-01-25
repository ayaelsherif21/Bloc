import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_task/cubits/counterBloc.dart';
import 'package:bloc_task/cubits/themeBloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
        backgroundColor: const Color.fromARGB(255, 176, 39, 153),
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.brightness_6),
            onPressed: () {
              context.read<ThemeCubit>().changeTheme();
            },
          ),
        ],
      ),
      body: Center(
        child: BlocConsumer<CounterCubit, int>(
          listener: (context, state) {
            if (state == 5) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Counter reached to 5')),
              );
            }
          },
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Counter value: $state',
                  style: TextStyle(fontSize: 26),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  
                  onPressed: () {
                    context.read<CounterCubit>().increase();
                  },
                  child: Text('increase Counter'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
