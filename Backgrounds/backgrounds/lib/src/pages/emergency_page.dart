import 'package:animate_do/animate_do.dart';
import 'package:backgrounds/src/widgets/emergency-list-tile.widget.dart';
import 'package:backgrounds/src/widgets/emergency_header.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ItemBoton {
  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;

  ItemBoton(this.icon, this.texto, this.color1, this.color2);
}

class EmergencyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isLarge;

    if (MediaQuery.of(context).size.height > 550) {
      isLarge = true;
    } else {
      isLarge = false;
    }

    final items = <ItemBoton>[
      new ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident',
          Color(0xff6989F5), Color(0xff906EF5)),
      new ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency',
          Color(0xff66A9F2), Color(0xff536CF6)),
      new ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
          Color(0xffF2D572), Color(0xffE06AA3)),
      new ItemBoton(FontAwesomeIcons.biking, 'Awards', Color(0xff317183),
          Color(0xff46997D)),
      new ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident',
          Color(0xff6989F5), Color(0xff906EF5)),
      new ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency',
          Color(0xff66A9F2), Color(0xff536CF6)),
      new ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
          Color(0xffF2D572), Color(0xffE06AA3)),
      new ItemBoton(FontAwesomeIcons.biking, 'Awards', Color(0xff317183),
          Color(0xff46997D)),
      new ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident',
          Color(0xff6989F5), Color(0xff906EF5)),
      new ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency',
          Color(0xff66A9F2), Color(0xff536CF6)),
      new ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
          Color(0xffF2D572), Color(0xffE06AA3)),
      new ItemBoton(FontAwesomeIcons.biking, 'Awards', Color(0xff317183),
          Color(0xff46997D)),
    ];

    List<Widget> itemMap = items
        .map((e) => FadeInLeft(
              duration: Duration(milliseconds: 500),
              child: EmergencyListTile(
                title: e.texto,
                color1: e.color1,
                color2: e.color2,
                onPress: () => print('on clicked'),
                icon: e.icon,
              ),
            ))
        .toList();

    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: (isLarge) ? 220 : 10),
            child: SafeArea(
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  if (isLarge)
                    SizedBox(
                      height: 80,
                    ),
                  ...itemMap
                ],
              ),
            ),
          ),
          if (isLarge) _Header(),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        EmergencyHeader(
          icon: FontAwesomeIcons.plus,
          title: 'Asistencia médica',
          subtitle: 'Has solicitado',
          primaryColor: Color(0xff536CF6),
          secondaryColor: Color(0xff66A9F2),
        ),
        Positioned(
            child: RawMaterialButton(
                onPressed: () {},
                shape: CircleBorder(),
                padding: EdgeInsets.all(15),
                child: FaIcon(
                  FontAwesomeIcons.ellipsisV,
                  color: Colors.white,
                )),
            right: 0,
            top: 40),
      ],
    );
  }
}

class TileTemp extends StatelessWidget {
  const TileTemp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EmergencyListTile(
      title: 'Motor accident',
      icon: FontAwesomeIcons.carCrash,
      onPress: () {
        print('On click');
      },
    );
  }
}
