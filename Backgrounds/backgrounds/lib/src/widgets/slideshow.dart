import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {
  final List<Widget> slides;
  final bool upButtons;
  final Color primaryColor;
  final Color secondaryColor;
  final double primaryBullet;
  final double secondaryBullet;

  const Slideshow({
    required this.slides,
    this.upButtons = false,
    this.primaryColor = Colors.blue,
    this.secondaryColor = Colors.grey,
    this.primaryBullet = 12,
    this.secondaryBullet = 12,
  });
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _SlideshowModel(),
      child: SafeArea(
        child: Center(
          child: Builder(
            builder: (BuildContext context) {
              Provider.of<_SlideshowModel>(context).primaryColor =
                  this.primaryColor;
              Provider.of<_SlideshowModel>(context).secondaryColor =
                  this.secondaryColor;

              Provider.of<_SlideshowModel>(context).primaryBullet =
                  this.primaryBullet;
              Provider.of<_SlideshowModel>(context).secondaryBullet =
                  this.secondaryBullet;

              return _CreateSlideshowStructure(
                  upButtons: upButtons, slides: slides);
            },
          ),
        ),
      ),
    );
  }
}

class _CreateSlideshowStructure extends StatelessWidget {
  const _CreateSlideshowStructure({
    Key? key,
    required this.upButtons,
    required this.slides,
  }) : super(key: key);

  final bool upButtons;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (this.upButtons) _Dots(this.slides.length),
        Expanded(child: _Slides(slides)),
        if (!this.upButtons) _Dots(this.slides.length),
      ],
    );
  }
}

class _Dots extends StatelessWidget {
  final amount;

  _Dots(this.amount);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(amount, (index) => _Dot(index)),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;

  const _Dot(this.index);

  @override
  Widget build(BuildContext context) {
    final slideshowModel = Provider.of<_SlideshowModel>(context);
    double tamanio;
    Color color;
    if (slideshowModel.currentPage >= (index - 0.5) &&
        slideshowModel.currentPage < index + 0.5) {
      tamanio = slideshowModel.primaryBullet;
      color = slideshowModel.primaryColor;
    } else {
      tamanio = slideshowModel.secondaryBullet;
      color = slideshowModel.secondaryColor;
    }

    return AnimatedContainer(
      //TODO: Tarea
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: tamanio,
      height: tamanio,

      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;

  const _Slides(this.slides);

  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {
  final pageViewController = new PageController();

  @override
  void initState() {
    pageViewController.addListener(() {
      Provider.of<_SlideshowModel>(context, listen: false).currentPage =
          pageViewController.page!;
    });
    super.initState();
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: PageView(
      controller: pageViewController,
      children: widget.slides.map((slide) => _Slide(slide)).toList(),
    ));
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;

  _Slide(this.slide);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(30),
      child: slide,
    );
  }
}

class _SlideshowModel with ChangeNotifier {
  double _currentPage = 0;
  Color _primaryColor = Colors.blue;
  Color _secondaryColor = Colors.grey;
  double _primaryBullet = 12;
  double _secondaryBullet = 12;

  double get currentPage => this._currentPage;

  set currentPage(double currentPage) {
    this._currentPage = currentPage;
    notifyListeners();
  }

  Color get primaryColor => this._primaryColor;

  set primaryColor(Color color) {
    this._primaryColor = color;
  }

  Color get secondaryColor => this._secondaryColor;

  set secondaryColor(Color color) {
    this._secondaryColor = color;
  }

  double get primaryBullet => this._primaryBullet;

  set primaryBullet(double size) {
    this._primaryBullet = size;
  }

  double get secondaryBullet => this._secondaryBullet;

  set secondaryBullet(double size) {
    this._secondaryBullet = size;
  }
}
