import 'package:flutter/material.dart';

void Function() makeGoto(String route, dynamic context, {Object? args}) {
  return () {
    Navigator.of(context).pushNamed(route, arguments: args);
  };
}

AppBar makeAppbar(String title) {
  return AppBar(title: Text(title), backgroundColor: Colors.orangeAccent);
}
