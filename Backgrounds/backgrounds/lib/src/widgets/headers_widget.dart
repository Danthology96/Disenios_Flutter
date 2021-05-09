import 'package:flutter/material.dart';

class SquareHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    return Container(
      //Para personalizar con el tamaño de los dispositivos
      height: _screenSize.height * 0.40,
      color: Color(0xff615AAB),
    );
  }
}

class CircularHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    return Container(
      //Para personalizar con el tamaño de los dispositivos
      height: _screenSize.height * 0.40,
      decoration: BoxDecoration(
        color: Color(0xff615AAB),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(_screenSize.width * 0.15),
          bottomRight: Radius.circular(_screenSize.width * 0.15),
        ),
      ),
    );
  }
}

class DiagonalHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: CustomPaint(
        painter: _DiagonalHeaderPainter(),
      ),
    );
  }
}

class _DiagonalHeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    //El lapiz que se usará para pintar
    final paint = Paint();

    paint.color = Color(0xff615AAB);
    paint.style =
        PaintingStyle.fill; //.fill es para rellenar ,stroke para bordes
    paint.strokeWidth = 2.0;

    final path = Path();
    //Dibuja con el path y con el lapiz
    //moveTO es para moverse a la posición deseada
    //lineTo es para dibujar hasta la ubicación seleccionada
    path.moveTo(0, size.height * 0.4);
    path.lineTo(size.width, size.height * 0.3);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class TriangleHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: CustomPaint(
        painter: _TriangularHeaderPainter(),
      ),
    );
  }
}

class _TriangularHeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    //El lapiz que se usará para pintar
    final paint = Paint();

    paint.color = Color(0xff615AAB);
    paint.style =
        PaintingStyle.fill; //.fill es para rellenar ,stroke para bordes
    paint.strokeWidth = 2.0;

    final path = Path();
    //Dibuja con el path y con el lapiz
    //moveTO es para moverse a la posición deseada
    //lineTo es para dibujar hasta la ubicación seleccionada
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class SpearHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: CustomPaint(
        painter: _SpearHeaderPainter(),
      ),
    );
  }
}

class _SpearHeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    //El lapiz que se usará para pintar
    final paint = Paint();

    paint.color = Color(0xff615AAB);
    paint.style =
        PaintingStyle.fill; //.fill es para rellenar ,stroke para bordes
    paint.strokeWidth = 2.0;

    final path = Path();
    //Dibuja con el path y con el lapiz
    //moveTO es para moverse a la posición deseada
    //lineTo es para dibujar hasta la ubicación seleccionada
    path.lineTo(0, size.height * 0.3);
    path.lineTo(size.width / 2, size.height * 0.38);
    path.lineTo(size.width, size.height * 0.3);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class CurveHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: CustomPaint(
        painter: _CurveHeaderPainter(),
      ),
    );
  }
}

class _CurveHeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    //El lapiz que se usará para pintar
    final paint = Paint();

    paint.color = Color(0xff615AAB);
    paint.style =
        PaintingStyle.fill; //.fill es para rellenar ,stroke para bordes
    paint.strokeWidth = 2.0;

    final path = Path();
    //Dibuja con el path y con el lapiz
    //moveTO es para moverse a la posición deseada
    //lineTo es para dibujar hasta la ubicación seleccionada
    path.lineTo(0, size.height * 0.25);
    //Primeras coordenadas son donde debe pasar la curvatura, y las segundas
    //coordenadas es el punto final
    path.quadraticBezierTo(
        size.width / 2, size.height * 0.5, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class WaveHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: CustomPaint(
        painter: _WaveHeaderPainter(),
      ),
    );
  }
}

class _WaveHeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    //El lapiz que se usará para pintar
    final paint = Paint();

    paint.color = Color(0xff615AAB);
    paint.style =
        PaintingStyle.fill; //.fill es para rellenar ,stroke para bordes
    paint.strokeWidth = 2.0;

    final path = Path();
    //Dibuja con el path y con el lapiz
    //moveTO es para moverse a la posición deseada
    //lineTo es para dibujar hasta la ubicación seleccionada
    path.moveTo(0, size.height);
    path.lineTo(0, size.height * 0.7);
    //Primeras coordenadas son donde debe pasar la curvatura, y las segundas
    //coordenadas es el punto final
    path.quadraticBezierTo(
        size.width / 4, size.height * 0.6, size.width / 2, size.height * 0.7);
    path.quadraticBezierTo(
        size.width * 3 / 4, size.height * 0.8, size.width, size.height * 0.7);
    path.lineTo(size.width, size.height);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class GradientHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: CustomPaint(
        painter: _GradientHeaderPainter(),
      ),
    );
  }
}

class _GradientHeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect =
        new Rect.fromCircle(center: Offset(size.width / 2, 0), radius: 180);
    final Gradient gradient = new LinearGradient(
      colors: [
        Color(0xff6D05E8),
        Color(0xffC012FF),
        Color(0xff6D05E8),
      ],
      stops: [
        0.0,
        0.5,
        1.0,
      ],
    );

    //El lapiz que se usará para pintar
    final paint = Paint()..shader = gradient.createShader(rect);

    paint.color = Colors.red;
    paint.style =
        PaintingStyle.fill; //.fill es para rellenar ,stroke para bordes
    paint.strokeWidth = 2.0;

    final path = Path();
    //Dibuja con el path y con el lapiz
    //moveTO es para moverse a la posición deseada
    //lineTo es para dibujar hasta la ubicación seleccionada
    path.moveTo(0, size.height);
    path.lineTo(0, size.height * 0.7);
    //Primeras coordenadas son donde debe pasar la curvatura, y las segundas
    //coordenadas es el punto final
    path.quadraticBezierTo(
        size.width / 4, size.height * 0.6, size.width / 2, size.height * 0.7);
    path.quadraticBezierTo(
        size.width * 3 / 4, size.height * 0.8, size.width, size.height * 0.7);
    path.lineTo(size.width, size.height);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
