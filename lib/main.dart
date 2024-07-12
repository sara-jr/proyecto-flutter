import 'package:flutter/material.dart';
import 'package:integradora/home.dart';
import 'package:integradora/hollydays.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/dates': (context) => const HollydayList(),
      },
    );
  }
}
