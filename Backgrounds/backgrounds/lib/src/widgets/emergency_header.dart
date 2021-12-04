import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EmergencyHeader extends StatelessWidget {
  EmergencyHeader(
      {Key? key,
      required this.icon,
      required this.title,
      this.subtitle = "Has solicitado",
      this.primaryColor = const Color(0xff526BF6),
      this.secondaryColor = const Color(0xff67ACF2)})
      : super(key: key);

  //  this.primaryColor = primaryColor ??  Color(0xff526BF6),
  //   this.secondaryColor = Color(0xff67ACF2),
  final IconData icon;
  final String title;
  final String subtitle;
  final Color primaryColor;
  final Color secondaryColor;

  @override
  Widget build(BuildContext context) {
    const Color whiteColor = Colors.white70;

    return Stack(children: [
      _EmergencyHeaderBackground(
        primaryColor: primaryColor,
        secondaryColor: secondaryColor,
      ),
      Positioned(
        top: -50,
        left: -70,
        child: FaIcon(
          icon,
          size: 250,
          color: Colors.white24,
        ),
      ),
      Center(
        child: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            Text(subtitle, style: TextStyle(color: whiteColor, fontSize: 20)),
            SizedBox(
              height: 20,
            ),
            Text(
              title,
              style: TextStyle(
                  color: whiteColor, fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            FaIcon(
              icon,
              size: 80,
              color: Colors.white,
            ),
          ],
        ),
      )
    ]);
  }
}

class _EmergencyHeaderBackground extends StatelessWidget {
  _EmergencyHeaderBackground({
    Key? key,
    required this.primaryColor,
    required this.secondaryColor,
  }) : super(key: key);

  final Color primaryColor;
  final Color secondaryColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100)),
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[primaryColor, secondaryColor]),
      ),
    );
  }
}
