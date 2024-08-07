import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final rawArgs = ModalRoute.of(context)!.settings.arguments as Map;
    Map<String, String> args = Map<String, String>.from(rawArgs);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            args['title'] ?? 'Titulo no provisto',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.orangeAccent,
              letterSpacing: 2,
              fontSize: 20,
            ),
          )
              .animate()
              .fadeIn(duration: 600.ms, curve: Curves.easeOutQuad)
              .scale(
                begin: Offset(0.5, 0.5),
                end: Offset(1, 1),
                duration: 600.ms,
                curve: Curves.easeOutBack,
              )
              .shimmer(
                duration: 1200.ms,
                color: Colors.blue.withOpacity(0.3),
              ),
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
