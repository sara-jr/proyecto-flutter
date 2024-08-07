import 'package:flutter/material.dart';
import 'package:integradora/utils.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void showAboutDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => Dialog.fullscreen(
              child: Center(
                child: Column(
                  children: [
                    const Text('Cosas de México'),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text('Verison 0.0 alfa'),
                    const SizedBox(
                      height: 40,
                    ),
                    BackButton(
                      onPressed: () => Navigator.of(context).pop(),
                    )
                  ],
                ),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: makeGoto('/dates', context),
                child: const Text('Fechas importantes')),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: makeGoto('/flora', context),
                child: const Text('Flora')),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () => showAboutDialog(context),
                child: const Text('Acerca de la app')),
            const SizedBox(height: 40),
            const Text(
              '¿Calificas nuestro servicio?',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            RatingBar.builder(
                initialRating: 0,
                minRating: 0,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) =>
                    const Icon(Icons.star, color: Colors.cyan),
                onRatingUpdate: (rating) => print(rating))
          ],
        ),
      ),
    );
  }
}
