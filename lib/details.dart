import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final rawArgs = ModalRoute.of(context)!.settings.arguments as Map;
    Map<String, String> args = Map<String, String>.from(rawArgs);
    return Scaffold(
        appBar: AppBar(
          title: Text(args['title'] ?? 'Titulo no provisto'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image(
                image: AssetImage("assets/${args['image']}"),
              ),
              const SizedBox(height: 20),
              Container(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    args['text'] ?? 'Error: Descripcion no proporcionada',
                    style: const TextStyle(fontSize: 18),
                    textAlign: TextAlign.justify,
                  ))
            ],
          ),
        ));
  }
}
