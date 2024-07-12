import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final rawArgs = ModalRoute.of(context)!.settings.arguments as Map;
    Map<String, String> args = Map<String, String>.from(rawArgs);
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Image(image: AssetImage(args['image']!)),
          const SizedBox(height: 20),
          Text(args['text'] ?? 'Error: Descripcion no proporcionada')
        ],
      ),
    ));
  }
}
