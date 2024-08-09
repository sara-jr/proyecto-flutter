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
CarouselPkg.CarouselSliderController _controller = CarouselPkg.CarouselSliderController();
@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: Text('Mi Galeria'),
),
body: Column(
children: [
CarouselPkg.CarouselSlider(
carouselController: _controller,
options: CarouselPkg.CarouselOptions(
height: 300.0,
enlargeCenterPage: true,
aspectRatio: 16 / 9,
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
height: 400,
),
),
))
.toList(),
),
SizedBox(height: 20),
Row(
mainAxisAlignment: MainAxisAlignment.center,
children: [
ElevatedButton(
onPressed: () => _controller.previousPage(),
child: Icon(Icons.arrow_back),
),
SizedBox(width: 20),
ElevatedButton(
onPressed: () => _controller.nextPage(),
child: Icon(Icons.arrow_forward),
),
],
),
SizedBox(height: 20),
Row(
mainAxisAlignment: MainAxisAlignment.center,
children: imgList.asMap().entries.map((entry) {
return Container(
width: 8.0,
height: 8.0,
margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
decoration: BoxDecoration(
shape: BoxShape.circle,
color: _current == entry.key
? Color.fromRGBO(0, 0, 0, 0.9)
: Color.fromRGBO(0, 0, 0, 0.4),
),
);
}).toList(),
),
],
),
);
}
}



