import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/Login/presentation/cubit/login_cubit.dart';
import 'features/Login/presentation/views/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => LoginCubit()),

        // BlocProvider(create: (context) => RegisterCubit()),
        // BlocProvider(create: (context) => AppCubit()),
        // BlocProvider(create: (context) => OnBoardingCubit()),
        // BlocProvider(create: (context) => RecipeCubit()),
        // BlocProvider(create: (context) => WorkOutsCubit()),
        // BlocProvider(create: (context) => ProfileCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        darkTheme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xF234CC2) , brightness: Brightness.dark),
          useMaterial3: true,
        ),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xF234CC2) ,  brightness: Brightness.light),
          useMaterial3: true,
        ),
        home: const LoginScreen(),
      ),
    );
  }
}