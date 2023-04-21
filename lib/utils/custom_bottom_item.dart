import 'package:flutter/material.dart';

class BNBCustomPainter extends CustomPainter {
  Color color;
  BNBCustomPainter(this.color);
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, size.height + 100); // Start

    path.arcToPoint(Offset(size.width, 20),
        radius: const Radius.elliptical(50, 15.0), clockwise: true);

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
