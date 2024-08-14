import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapSample extends StatelessWidget {
final LatLng _center =
LatLng(20.39870865644992, -101.2231068428173); // Coordenadas UTSOE
@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: Text('OpenStreetMap en Flutter'),
backgroundColor: const Color.fromARGB(255, 152, 228, 156),
),
body: FlutterMap(
options: MapOptions(
center: _center,
zoom: 17.0,
),
children: [
TileLayer(
urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
subdomains: ['a', 'b', 'c'],
),
MarkerLayer(
markers: [
Marker(
width: 80.0,
height: 80.0,
point: _center,
builder: (ctx) => Container(
child: Icon(
Icons.location_on,
color: Colors.red,
size: 40.0,
),
),
),
],
),
],
),
);
}
}