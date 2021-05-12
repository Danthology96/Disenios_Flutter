import 'package:backgrounds/src/challenges/animated_square_page.dart';
import 'package:backgrounds/src/pages/animations_page.dart';
import 'package:backgrounds/src/pages/headers_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      home: AnimatedSquarePage(),
    );
  }
}
