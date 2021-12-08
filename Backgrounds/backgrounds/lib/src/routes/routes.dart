import 'package:backgrounds/src/pages/circular_graphics_page.dart';
import 'package:backgrounds/src/pages/slideshow_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:backgrounds/src/challenges/animated_square_page.dart';
import 'package:backgrounds/src/pages/emergency_page.dart';
import 'package:backgrounds/src/pages/headers_page.dart';
import 'package:backgrounds/src/pages/pinterest_page.dart';
import 'package:backgrounds/src/pages/sliver_list_page.dart';

final pageRoutes = <_Route>[
  _Route(FontAwesomeIcons.slideshare, 'SlideShow', SlideshowPage()),
  _Route(FontAwesomeIcons.ambulance, 'Emergency', EmergencyPage()),
  _Route(FontAwesomeIcons.heading, 'Header', HeadersPage()),
  _Route(FontAwesomeIcons.peopleCarry, 'Animated Square', AnimatedSquarePage()),
  _Route(FontAwesomeIcons.circleNotch, 'Progress Bar', CircularGraphicsPage()),
  _Route(FontAwesomeIcons.pinterest, 'Pinterest', PinterestPage()),
  _Route(FontAwesomeIcons.mobile, 'Slivers', SliverListPage()),
];

class _Route {
  final IconData icon;
  final String title;
  final Widget page;

  _Route(this.icon, this.title, this.page);
}
