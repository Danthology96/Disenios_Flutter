import 'package:flutter/material.dart';
import 'package:transitions_app/pages/page2.page.dart';

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 1'),
      ),
      backgroundColor: Colors.green,
      body: Center(
        child: Text('Hola 1'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, _createRoute());
        },
        child: const Icon(Icons.ac_unit),
      ),
    );
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) =>
          const Page2(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final curvedAnimation =
            CurvedAnimation(parent: animation, curve: Curves.easeInOut);
        // return SlideTransition(
        //   position: Tween<Offset>(
        //     begin: const Offset(0.5, 1.0),
        //     end: Offset.zero,
        //   ).animate(curvedAnimation),
        //   child: child,
        // );

        // return ScaleTransition(
        //     child: child,
        //     scale:
        //         Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation));

        // return RotationTransition(
        //     child: child,
        //     turns:
        //         Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation));

        return FadeTransition(
            child: child,
            opacity:
                Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation));
      },
    );
  }
}
