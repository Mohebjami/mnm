import 'package:flutter/material.dart';
import 'package:mnm/View/HomePage.dart';

void main() async {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'start',
    routes: {
      'start': (context) => const HomePage(),
    },
  ));
}