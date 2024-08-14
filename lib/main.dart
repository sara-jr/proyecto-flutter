import 'package:flutter/material.dart';
import 'package:integradora/details.dart';
import 'package:integradora/flowers.dart';
import 'package:integradora/home.dart';
import 'package:integradora/hollydays.dart';
import 'package:integradora/maps.dart';

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
        '/details': (context) => const DetailsScreen(),
        '/flora': (context) =>  FlowersGalery(),
        '/maps' : (context) => MapSample()
      },
    );
  }
}
