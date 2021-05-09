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
    path.lineTo(0, size.height * 0.3);
    //Primeras coordenadas son donde debe pasar la curvatura, y las segundas
    //coordenadas es el punto final
    path.quadraticBezierTo(
        size.width / 4, size.height * 0.4, size.width / 2, size.height * 0.3);
    path.quadraticBezierTo(size.width - (size.width / 4), size.height * 0.2,
        size.width, size.height * 0.3);
    path.lineTo(size.width, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
