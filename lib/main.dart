import 'package:membuat_todolist/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'To-Do App',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}