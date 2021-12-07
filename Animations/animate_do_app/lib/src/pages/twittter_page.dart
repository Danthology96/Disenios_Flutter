import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TwitterPage extends StatefulWidget {
  const TwitterPage({Key? key}) : super(key: key);

  @override
  State<TwitterPage> createState() => _TwitterPageState();
}

class _TwitterPageState extends State<TwitterPage> {
  bool activated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            print('$activated');
            activated = true;
            print('pressed');
            print('$activated');
          });
        },
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.play_arrow,
          color: Color(0xff1DA1F2),
          size: 40,
        ),
      ),
      backgroundColor: const Color(0xff1DA1F2),
      body: Center(
        child: ZoomOut(
          animate: activated,
          // delay: const Duration(seconds: 2),
          duration: const Duration(seconds: 2),
          from: 30,
          child: const FaIcon(
            FontAwesomeIcons.twitter,
            color: Colors.white,
            size: 60,
          ),
        ),
      ),
    );
  }
}
