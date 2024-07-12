import 'package:flutter/material.dart';
import 'package:integradora/utils.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void showAboutDialog(BuildContext context) {
    showDialog(context: context, builder: (context) => const AboutDialog());
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
          ],
        ),
      ),
    );
  }
}
