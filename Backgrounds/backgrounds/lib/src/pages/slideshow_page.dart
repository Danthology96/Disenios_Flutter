import 'package:backgrounds/src/theme/theme.dart';
import 'package:backgrounds/src/widgets/slideshow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SlideshowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isLarge;

    if (MediaQuery.of(context).size.height > 500) {
      isLarge = true;
    } else {
      isLarge = false;
    }

    final children = [
      Expanded(child: _MySlideshow()),
      Expanded(child: _MySlideshow()),
    ];

    return Scaffold(
      // body: (Column(
      //   children: [],
      // ),)
      body: (isLarge) ? Column(children: children) : Row(children: children),
    );
  }
}

class _MySlideshow extends StatelessWidget {
  const _MySlideshow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    return Slideshow(
      primaryBullet: 15,
      secondaryBullet: 12,
      upButtons: false,
      primaryColor: (appTheme.darkTheme)
          ? appTheme.currentTheme.colorScheme.secondary
          : Colors.amber,
      slides: [
        SvgPicture.asset('assets/svgs/1.svg'),
        SvgPicture.asset('assets/svgs/2.svg'),
        SvgPicture.asset('assets/svgs/3.svg'),
        SvgPicture.asset('assets/svgs/4.svg'),
        SvgPicture.asset('assets/svgs/5.svg'),
      ],
    );
  }
}
