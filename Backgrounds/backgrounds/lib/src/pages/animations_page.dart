import 'dart:math' as Math;

import 'package:flutter/material.dart';

class AnimationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedSquare(),
      ),
    );
  }
}

class AnimatedSquare extends StatefulWidget {
  @override
  _AnimatedSquareState createState() => _AnimatedSquareState();
}

class _AnimatedSquareState extends State<AnimatedSquare>
    with SingleTickerProviderStateMixin {
  //Se usa el late para evitar el initState del animationController
  late AnimationController animationController = new AnimationController(
      vsync: this, duration: Duration(milliseconds: 4000));
  late Animation<double> rotation =
      Tween(begin: 0.0, end: 2.0 * Math.pi).animate(
    CurvedAnimation(parent: animationController, curve: Curves.easeInOutCubic),
  );

  late Animation<double> opacity = Tween(begin: 0.1, end: 1.0).animate(
    //el interval va de 0 a 1, siendo 1 el 100% del tiempo de la animación del
    //controller
    CurvedAnimation(
        parent: animationController,
        curve: Interval(0, 0.50, curve: Curves.easeOut)),
  );
  late Animation<double> opacityOut = Tween(begin: 0.0, end: 1.0).animate(
    //el interval va de 0 a 1, siendo 1 el 100% del tiempo de la animación del
    //controller
    CurvedAnimation(
        parent: animationController,
        curve: Interval(0.75, 1, curve: Curves.easeOut)),
  );

  late Animation<double> moveRight = Tween(begin: 0.0, end: 200.0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeOut));

  late Animation<double> expand = Tween(begin: 0.0, end: 2.0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeOut));

  @override
  void initState() {
    animationController.addListener(() {
      if (animationController.status == AnimationStatus.completed) {
        animationController.reset();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Es como el botón de reproducción
    animationController.forward();

    return AnimatedBuilder(
      animation: animationController,
      child: _Rectangle(),
      builder: (context, child) {
        print('Opacidad: ${opacity.value}}');
        print('OpacidadOut: ${opacity.value}}');
        print('Rotacion: ${rotation.value}');
        return Transform.translate(
          offset: Offset(moveRight.value, 0),
          child: Transform.rotate(
            angle: rotation.value,
            child: Opacity(
              opacity: opacity.value - opacityOut.value,
              child: Transform.scale(scale: expand.value, child: child),
            ),
          ),
        );
      },
    );
  }
}

class _Rectangle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(color: Colors.blue),
    );
  }
}
