import 'package:backgrounds/src/theme/theme.dart';
import 'package:backgrounds/src/widgets/pinterest_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class PinterestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (_) => new _MenuModel(),
        child: Stack(
          children: [
            PinterestGrid(),
            _PinterestMenuPosition(),
          ],
        ),
      ),
    );
  }
}

class _PinterestMenuPosition extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final show = Provider.of<_MenuModel>(context).show;
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    if (screenWidth > 500) {
      screenWidth = screenWidth - 250;
    }

    return Positioned(
        bottom: 30,
        child: Container(
          width: screenWidth,
          child: Row(
            children: [
              Spacer(),
              PinterestMenu(
                show: show,
                activeColor: appTheme.colorScheme.secondary,
                backgroundColor: appTheme.scaffoldBackgroundColor,
                items: [
                  PinterestButton(
                      onPressed: () {
                        print('Icon pie_chart');
                      },
                      icon: Icons.pie_chart),
                  PinterestButton(
                      onPressed: () {
                        print('Icon search');
                      },
                      icon: Icons.search),
                  PinterestButton(
                      onPressed: () {
                        print('Icon notifications');
                      },
                      icon: Icons.notifications),
                  PinterestButton(
                      onPressed: () {
                        print('Icon supervised_user_circle');
                      },
                      icon: Icons.supervised_user_circle),
                ],
              ),
              Spacer(),
            ],
          ),
        ));
  }
}

class PinterestGrid extends StatefulWidget {
  @override
  _PinterestGridState createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {
  ScrollController controller = new ScrollController();
  @override
  void initState() {
    double earlierScroll = 0;
    controller.addListener(() {
      if (controller.offset > earlierScroll && controller.offset > 0) {
        Provider.of<_MenuModel>(context, listen: false).show = false;
      } else {
        Provider.of<_MenuModel>(context, listen: false).show = true;
      }
      earlierScroll = controller.offset;
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<int> items = List.generate(200, (index) => index);
    int count;
    if (MediaQuery.of(context).size.width > 500) {
      count = 3;
    } else {
      count = 2;
    }
    return new StaggeredGridView.countBuilder(
      controller: controller,
      crossAxisCount: count,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => _PinterestItem(index),
      staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(1, index.isEven ? 1 : 2),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}

class _PinterestItem extends StatelessWidget {
  final int index;

  const _PinterestItem(this.index);

  @override
  Widget build(BuildContext context) {
    return new Container(
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        child: new Center(
          child: new CircleAvatar(
            backgroundColor: Colors.white,
            child: new Text('$index'),
          ),
        ));
  }
}

class _MenuModel with ChangeNotifier {
  bool _show = true;

  bool get show => this._show;

  set show(bool value) {
    this._show = value;
    notifyListeners();
  }
}
