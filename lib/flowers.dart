import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart' as CarouselPkg;

class FlowersGalery extends StatefulWidget {
  FlowersGalery({super.key});
  @override
  _FlowersGaleryState createState() => _FlowersGaleryState();
}

class _FlowersGaleryState extends State<FlowersGalery> {
  final List<String> imgList = [
    "assets/campanilla.jpg",
    "assets/cempazuchil.jpg",
    "assets/dahlia.jpg",
    "assets/magnolia.jpg",
    "assets/nochebuena.jpg",
  ];

  int _current = 0;
  CarouselPkg.CarouselSliderController _controller =
      CarouselPkg.CarouselSliderController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flora'),
      ),
      body: Column(
        children: [
          CarouselPkg.CarouselSlider(
            carouselController: _controller,
            options: CarouselPkg.CarouselOptions(
              height: 120.0,
              enlargeCenterPage: true,
              aspectRatio: 4 / 3,
              enableInfiniteScroll: true,
              viewportFraction: 0.8,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
            ),
            items: imgList
                .map((item) => Container(
                      child: Center(
                        child: Image.asset(
                          item,
                          fit: BoxFit.cover,
                          height: 120.0,
                        ),
                      ),
                    ))
                .toList(),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () => _controller.previousPage(),
                icon: const Icon(Icons.arrow_back),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imgList.asMap().entries.map((entry) {
                  return Container(
                    width: 5.0,
                    height: 5.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 2.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _current == entry.key
                          ? Color.fromRGBO(0, 0, 0, 0.9)
                          : Color.fromRGBO(0, 0, 0, 0.3),
                    ),
                  );
                }).toList(),
              ),
              IconButton(
                onPressed: () => _controller.nextPage(),
                icon: const Icon(Icons.arrow_forward),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
