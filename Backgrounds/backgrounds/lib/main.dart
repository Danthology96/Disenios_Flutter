import 'package:backgrounds/src/pages/pinterest_page.dart';
import 'package:backgrounds/src/widgets/pinterest_menu.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      home: PinterestPage(),
      // home: PinterestMenu(),
    );
  }
}
