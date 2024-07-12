import 'dart:convert';
import 'dart:io';
import 'dart:js_interop';
import 'dart:nativewrappers/_internal/vm/lib/internal_patch.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      final rawJson =
          await json.decode(await rootBundle.loadString('hollydays.json'));
      newHollydays = List.from(rawJson.map((e) => Map<String, String>.from(e)));
    } catch (exception) {
      return;
    }
    setState(() {
      hollydays = newHollydays;
    });
  }

  Widget buildEntry(BuildContext context, int index) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.calendar_today),
        title: Text(hollydays[index]['date'] ?? 'Error'),
        subtitle: Text(hollydays[index]['name'] ?? 'Error'),
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
