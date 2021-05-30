import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  //En lugar de usar Function, usar VoidCallback
  final VoidCallback onPressed;
  final IconData icon;
  PinterestButton({required this.onPressed, required this.icon});
}

class PinterestMenu extends StatelessWidget {
  final bool show;

  final Color backgroundColor;
  final Color activeColor; //black
  final Color secondaryColor;
  final List<PinterestButton> items;
  //bluegrey

  PinterestMenu(
      {this.show = true,
      this.backgroundColor = Colors.white,
      this.activeColor = Colors.blue,
      this.secondaryColor = Colors.blueGrey,
      required this.items});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _MenuModel(),
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 250),
        opacity: (show) ? 1 : 0,
        child: Builder(
          builder: (BuildContext context) {
            Provider.of<_MenuModel>(context).backgroundColor =
                this.backgroundColor;
            Provider.of<_MenuModel>(context).activeColor = this.activeColor;
            Provider.of<_MenuModel>(context).secondaryColor =
                this.secondaryColor;

            return _PinterestMenuBackground(
              child: _MenuItems(
                menuItems: items,
              ),
            );
          },
        ),
      ),
    );
  }
}

class _PinterestMenuBackground extends StatelessWidget {
  final Widget child;

  _PinterestMenuBackground({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Provider.of<_MenuModel>(context).backgroundColor;
    return Container(
      child: child,
      width: 250,
      height: 60,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(30)),
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 10,
            spreadRadius: -5,
          )
        ],
      ),
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List<PinterestButton> menuItems;

  const _MenuItems({
    required this.menuItems,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
          menuItems.length,
          (index) => _PinterestMenuButton(
                index: index,
                item: menuItems[index],
              )),
    );
  }
}

class _PinterestMenuButton extends StatelessWidget {
  final int index;
  final PinterestButton item;

  _PinterestMenuButton({required this.index, required this.item});

  @override
  Widget build(BuildContext context) {
    final menuModel = Provider.of<_MenuModel>(context);

    return GestureDetector(
      onTap: () {
        Provider.of<_MenuModel>(context, listen: false).selectedItem = index;
        item.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon(item.icon,
            size: (menuModel.selectedItem == index) ? 35 : 25,
            color: (menuModel.selectedItem == index)
                ? menuModel.activeColor
                : menuModel.secondaryColor),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  int _selectedItem = 0;
  Color backgroundColor = Colors.white;
  Color activeColor = Colors.blue; //black
  Color secondaryColor = Colors.blueGrey; //

  int get selectedItem => this._selectedItem;

  set selectedItem(int index) {
    this._selectedItem = index;
    notifyListeners();
  }
}
