import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  final percentage;
  final Color primaryColor;
  final Color secondaryColor;
  final double primaryThickness;
  final double secondaryThickness;

  RadialProgress(
      {required this.percentage,
      this.primaryColor = Colors.blue,
      this.secondaryColor = Colors.grey,
      this.secondaryThickness = 4,
      this.primaryThickness = 10});

  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late double earlierPercentage;

  @override
  void initState() {
    earlierPercentage = widget.percentage;
    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 200));

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward(from: 0.0);

    final animationDifference = widget.percentage - earlierPercentage;

    earlierPercentage = widget.percentage;

    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, child) {
        return Container(
          padding: EdgeInsets.all(10),
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: _MyRadialProgress(
                (widget.percentage - animationDifference) +
                    (animationDifference * controller.value),
                widget.primaryColor,
                widget.secondaryColor,
                widget.secondaryThickness,
                widget.primaryThickness),
          ),
        );
      },
    );
  }
}

class _MyRadialProgress extends CustomPainter {
  final percentage;
  final primaryColor;
  final secondaryColor;
  final primaryThickness;
  final secondaryThickness;

  _MyRadialProgress(this.percentage, this.primaryColor, this.secondaryColor,
      this.secondaryThickness, this.primaryThickness);

  @override
  void paint(Canvas canvas, Size size) {
    final Gradient gradient = new LinearGradient(
      colors: <Color>[
        Color(0xffC012ff),
        Color(0xff6D05E8),
        Colors.red,
      ],
    );

    final Rect rect = new Rect.fromCircle(center: Offset(0, 0), radius: 180);

    final paint = new Paint()
      ..strokeWidth = secondaryThickness
      ..color = secondaryColor
      ..style = PaintingStyle.stroke;

    final center = new Offset(size.width * 0.5, size.height / 2);
    final radius = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radius, paint);

    final paintArc = new Paint()
      ..strokeWidth = primaryThickness
      // ..color = primaryColor
      ..shader = gradient.createShader(rect)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    //Filling part

    double arcAngle = 2 * pi * (percentage / 100);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      arcAngle,
      false,
      paintArc,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
