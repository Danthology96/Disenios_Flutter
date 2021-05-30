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
    final screenWidth = MediaQuery.of(context).size.width;
    final show = Provider.of<_MenuModel>(context).show;
    return Positioned(
        bottom: 30,
        child: Container(
          width: screenWidth,
          child: Align(
            child: PinterestMenu(
              show: show,
              activeColor: Colors.amber,
              secondaryColor: Colors.blueAccent,
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

    return new StaggeredGridView.countBuilder(
      controller: controller,
      crossAxisCount: 4,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => _PinterestItem(index),
      staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(2, index.isEven ? 2 : 3),
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
