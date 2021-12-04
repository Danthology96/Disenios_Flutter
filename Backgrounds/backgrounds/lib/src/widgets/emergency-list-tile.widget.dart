import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EmergencyListTile extends StatelessWidget {
  const EmergencyListTile(
      {Key? key,
      this.icon = Icons.cancel,
      required this.title,
      this.color1 = const Color(0xff6989F5),
      this.color2 = const Color(0xff906EF5),
      required this.onPress})
      : super(key: key);

  final IconData? icon;
  final String title;
  final Color color1;
  final Color color2;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      margin: EdgeInsets.all(20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            _TileBackground(
              icon: icon,
              color1: color1,
              color2: color2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 140,
                  width: 40,
                ),
                FaIcon(
                  icon,
                  color: Colors.white,
                  size: 40,
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
                FaIcon(
                  FontAwesomeIcons.chevronRight,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 40,
                ),
              ],
            ),
            Material(
              type: MaterialType.transparency,
              child: InkWell(
                onTap: onPress,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TileBackground extends StatelessWidget {
  const _TileBackground({
    Key? key,
    required this.color1,
    required this.color2,
    required this.icon,
  }) : super(key: key);

  final Color color1;
  final Color color2;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.black26, offset: Offset(4, 6), blurRadius: 10),
        ],
        gradient: LinearGradient(colors: <Color>[color1, color2]),
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            right: -20,
            top: -25,
            child: FaIcon(
              icon,
              size: 150,
              color: Colors.white24,
            ),
          )
        ],
      ),
    );
  }
}
