import 'package:flutter/material.dart';

class FlowersGalery extends StatelessWidget {
  const FlowersGalery({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Galeria de flores'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/campanilla.jpg'),
                  fit: BoxFit.cover),
            ),
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/cempazuchil.jpg'),
                  fit: BoxFit.cover),
            ),
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/dahlia.jpg'), fit: BoxFit.cover),
            ),
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/magnolia.jpg'), fit: BoxFit.cover),
            ),
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/nochebuena.jpg'),
                  fit: BoxFit.cover),
            ),
            width: double.infinity,
            height: double.infinity,
          ),
        ],
      ),
    );
  }
}
