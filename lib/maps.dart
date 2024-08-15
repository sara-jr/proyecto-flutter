import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:integradora/utils.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';

class MapSample extends StatefulWidget {
  const MapSample({super.key});
  @override
  State<StatefulWidget> createState() {
    return _MapSampleState();
  }
}

class _MapSampleState extends State<MapSample> {
  final LatLng _destination =
      const LatLng(20.39870865644992, -101.2231068428173); // Coordenadas UTSOE
  late LatLng _position;
  late Location _location;
  List<LatLng> _routePoints = [];

  @override
  void initState() {
    super.initState();
    _location = Location();
    //_position = LatLng(0, 0);
    _getLocation();
  }

  Future<void> _getRoute() async {
    final url =
        'http://router.project-osrm.org/route/v1/driving/${_position.longitude},${_position.latitude};${_destination.longitude},${_destination.latitude}?geometries=geojson';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode != 200) {
      print('Error al obtener la ruta: ${response.statusCode}');
    }

    final data = json.decode(response.body);
    final route = data['routes'][0]['geometry']['coordinates'] as List;
    setState(() {
      _routePoints = route
          .map((point) => LatLng(point[1] as double, point[0] as double))
          .toList();
    });
  }

  Future<void> _getLocation() async {
    final locationData = await _location.getLocation();
    setState(() {
      _position = LatLng(locationData.latitude!, locationData.longitude!);
    });
    await _getRoute();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: makeAppbar('OpenStreetMap en Flutter'),
      body: _position == null
          ? const Center(child: CircularProgressIndicator())
          : FlutterMap(
              options: MapOptions(
                center: _position,
                zoom: 17.0,
              ),
              children: [
                TileLayer(
                  urlTemplate:
                      "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: const ['a', 'b', 'c'],
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      width: 80.0,
                      height: 80.0,
                      point: _destination,
                      builder: (ctx) => const Column(children: [
                        Text('UTSOE'),
                        Icon(
                          Icons.location_on,
                          color: Colors.orange,
                          size: 40.0,
                        ),
                      ]),
                    ),
                    Marker(
                      width: 80.0,
                      height: 80.0,
                      point: _position,
                      builder: (ctx) => const Column(children: [
                        Text('Estas aqui'),
                        Icon(
                          Icons.location_on,
                          color: Colors.blue,
                          size: 40.0,
                        ),
                      ]),
                    ),
                  ],
                ),
                PolylineLayer(
                  polylines: [
                    Polyline(
                        points: _routePoints,
                        strokeWidth: 4.0,
                        color: Colors.green)
                  ],
                )
              ],
            ),
    );
  }
}
