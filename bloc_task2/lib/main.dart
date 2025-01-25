import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_task2/cubits/counterBloc.dart';
import 'home_screen.dart';
void main() {
  runApp(
    MultiBlocProvider(
    providers: 
    [
    BlocProvider(create: (_)  => CounterCubit()), 
    ],
    
     child: MyApp(),
    ),
  );
    
    
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
      title: 'Counter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
      }
  
}