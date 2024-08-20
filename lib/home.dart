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
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Text('Cosas de México'),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text('Verison 0.0.1 alfa'),
                    const SizedBox(
                      height: 40,
                    ),
                    ExpansionTile(
                      title: const Text(
                        '¿Calificas la app?',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      children: [
                        RatingBar.builder(
                            itemSize: 25,
                            initialRating: 0,
                            minRating: 0,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 2.0),
                            itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.cyan,
                                ),
                            onRatingUpdate: (rating) => print(rating))
                      ],
                    ),
                    BackButton(onPressed: () => Navigator.of(context).pop()),
                  ],
                ),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          IconButton(
              onPressed: makeGoto('/dates', context),
              icon: const Icon(Icons.calendar_month)),
          IconButton(
              onPressed: makeGoto('/flora', context),
              icon: const Icon(Icons.local_florist)),
          IconButton(
              onPressed: makeGoto('/maps', context),
              icon: const Icon(Icons.map)),
          IconButton(
              onPressed: () => showAboutDialog(context),
              icon: const Icon(Icons.info)),
        ],
      ),
    );
  }
}
