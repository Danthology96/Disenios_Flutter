import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppbarWidget extends StatelessWidget {
  const CustomAppbarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: const [
          Icon(FontAwesomeIcons.chevronLeft),
          Spacer(),
          Icon(FontAwesomeIcons.commentAlt),
          SizedBox(
            width: 20,
          ),
          Icon(FontAwesomeIcons.headphonesAlt),
          SizedBox(
            width: 20,
          ),
          Icon(FontAwesomeIcons.externalLinkAlt),
        ],
      ),
    );
  }
}
