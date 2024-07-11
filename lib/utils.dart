import 'package:flutter/material.dart';

void Function() makeGoto(String route, dynamic context, {Object? args}) {
  return () {
    Navigator.of(context).pushNamed(route, arguments: args);
  };
}
