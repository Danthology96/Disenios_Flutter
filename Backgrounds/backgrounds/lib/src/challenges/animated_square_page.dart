import 'package:flutter/material.dart';

class AnimatedSquarePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _AnimatedSquare(),
      ),
    );
  }
}

class _AnimatedSquare extends StatefulWidget {
  @override
  __AnimatedSquareState createState() => __AnimatedSquareState();
}

class __AnimatedSquareState extends State<_AnimatedSquare>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController = new AnimationController(
      vsync: this, duration: Duration(milliseconds: 4500));

  late Animation<double> moveRight = Tween(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(
          parent: animationController,
          curve: Interval(0.0, 0.25, curve: Curves.bounceOut)));

  late Animation<double> moveUp = Tween(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(
          parent: animationController,
          curve: Interval(0.25, 0.50, curve: Curves.bounceOut)));

  late Animation<double> moveLeft = Tween(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(
          parent: animationController,
          curve: Interval(0.50, 0.75, curve: Curves.bounceOut)));

  late Animation<double> moveDown = Tween(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(
          parent: animationController,
          curve: Interval(0.75, 1.0, curve: Curves.bounceOut)));

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
    animationController.forward();

    return AnimatedBuilder(
      animation: animationController,
      child: _Rectangle(),
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(
              moveRight.value - moveLeft.value, moveDown.value - moveUp.value),
          child: child,
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
