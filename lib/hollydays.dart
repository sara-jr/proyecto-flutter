import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:integradora/utils.dart';

class HollydayList extends StatefulWidget {
  const HollydayList({super.key});

  @override
  State<StatefulWidget> createState() => HollydayListState();
}

class HollydayListState extends State<HollydayList> {
  List<Map<String, String>> hollydays = [];

  @override
  void initState() {
    super.initState();
    loadHollydays();
  }

  void loadHollydays() async {
    List<Map<String, String>> newHollydays;
    try {
      final rawJson = await json.decode(await DefaultAssetBundle.of(context)
          .loadString('assets/hollydays.json'));
      newHollydays = List.from(rawJson.map((e) => Map<String, String>.from(e)));
    } catch (exception) {
      print(exception);
      return;
    }
    setState(() {
      hollydays = newHollydays;
    });
  }

  Widget buildEntry(BuildContext context, int index) {
    return GestureDetector(
      onDoubleTap: makeGoto('/details', context, args: {
        'text': hollydays[index]['description'],
        'image': hollydays[index]['image'],
        'title': hollydays[index]['name']
      }),
      child: Card(
        child: ListTile(
          leading: const Icon(Icons.calendar_today),
          title: Text(hollydays[index]['date'] ?? 'Error'),
          subtitle: Text(hollydays[index]['name'] ?? 'Error'),
        ),
      ),
    );
  }

  void sortItems(bool? value) {
    if (value == null) {
      return;
    }
    final sign = value ? 1 : -1;

    setState(() {
      hollydays.sort((Map<String, String> a, Map<String, String> b) =>
          a['name']!.compareTo(b['name'] ?? '') * sign);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Fechas'),
        ),
        body: Column(
          children: [
            DropdownButton(
              borderRadius: BorderRadius.circular(10),
              hint: const Text('Orden'),
              items: const [
                DropdownMenuItem<bool>(value: true, child: Text('Ascendente')),
                DropdownMenuItem<bool>(
                    value: false, child: Text('Descendente')),
              ],
              onChanged: sortItems,
            ),
            const SizedBox(height: 20),
            ListView.builder(
              itemBuilder: buildEntry,
              itemCount: hollydays.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
            ),
          ],
        ));
  }
}
