import 'package:flutter/material.dart';

class SliverListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _MainScroll(),
          Positioned(
            child: _NewListButton(),
            bottom: -10,
            right: 0,
          ),
        ],
      ),
    );
  }
}

class _NewListButton extends StatelessWidget {
  const _NewListButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ButtonTheme(
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          'CREATE NEW LIST',
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        style: ElevatedButton.styleFrom(
          primary: Color(0xffED6762),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
            ),
          ),
          minimumSize: Size(size.width * 0.8, 75),
        ),
      ),
    );
  }
}

class _MainScroll extends StatelessWidget {
  _MainScroll({Key? key}) : super(key: key);

  final items = [
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverPersistentHeader(
          delegate: _SliverCustomHeaderDelegate(
              child: Container(
                  color: Colors.white,
                  alignment: Alignment.centerLeft,
                  child: _Title()),
              minHeight: 190,
              maxHeight: 200),
          floating: true,
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            ...items,
            SizedBox(
              height: 100,
            )
          ]),
        ),
      ],
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  _SliverCustomHeaderDelegate(
      {required this.minHeight, required this.maxHeight, required this.child});

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(
      child: child,
    );
  }

  @override
  double get maxExtent => this.maxHeight;

  @override
  double get minExtent => this.minHeight;

  @override
  bool shouldRebuild(covariant _SliverCustomHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class _TaskList extends StatelessWidget {
  _TaskList({
    Key? key,
  }) : super(key: key);

  final items = [
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) => items[index],
      itemCount: items.length,
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 30,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Text(
            'New',
            style: TextStyle(color: Color(0xff532128), fontSize: 50),
          ),
        ),
        Stack(
          children: [
            SizedBox(width: 100),
            Positioned(
              bottom: 8,
              child: Container(
                width: 150,
                height: 8,
                color: Color(0xffF7CDD5),
              ),
            ),
            Container(
                child: Text('List',
                    style: TextStyle(
                      color: Color(0xffD93A30),
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ))),
          ],
        ),
      ],
    );
  }
}

class _ListItem extends StatelessWidget {
  const _ListItem(
    this.title,
    this.color, {
    Key? key,
  }) : super(key: key);

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.all(30),
      height: 130,
      margin: EdgeInsets.all(10),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(30)),
      child: Text(
        title,
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }
}
