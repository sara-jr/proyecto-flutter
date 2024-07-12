import 'package:flutter/material.dart';

class HollydayList extends StatelessWidget {
  HollydayList({super.key});
  final hollydays = <Map>[
    <String, String>{'date': '16/09', 'name': 'Día de inicio de independencia'},
    <String, String>{
      'date': '27/09',
      'name': 'Consumación de la independencia'
    },
    <String, String>{'date': '02/10', 'name': 'Día de muertos'},
    <String, String>{
      'date': '20/10',
      'name': 'Conmemoración de la revolución mexicana'
    },
    <String, String>{'date': '01/05', 'name': 'Día del trabajador'},
  ];

  Widget buildEntry(BuildContext context, int index) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.calendar_today),
        title: Text(hollydays[index]['date']),
        subtitle: Text(hollydays[index]['name']),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: buildEntry,
        itemCount: hollydays.length,
      ),
    );
  }
}
