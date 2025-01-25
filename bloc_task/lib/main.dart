import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_task/cubits/counterBloc.dart';
import 'package:bloc_task/cubits/themeBloc.dart';
import 'home_screen.dart';
void main() {
  runApp(
    MultiBlocProvider(
    providers: 
    [
    BlocProvider(create: (_)  => CounterCubit()), 
    BlocProvider(create: (_)  => ThemeCubit()),
    ],
    
     child: MyApp(),
    ),
  );
    
    
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeData>(
    builder: (context, theme) {
      return MaterialApp(
      title: 'Counter',
      // theme: theme,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
      },
    );
  }
}