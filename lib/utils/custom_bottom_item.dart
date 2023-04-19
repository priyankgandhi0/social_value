import 'package:flutter/material.dart';

import '../theme/app_color.dart';

class BNBCustomPainter extends CustomPainter {
  @override
  Color color;
  BNBCustomPainter(this.color);
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, size.height + 100); // Start
    // path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    // path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    // path.arcToPoint(Offset(size.width * 0.60, 20),
    //     radius: Radius.circular(20.0), clockwise: false);
    // path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.45, 0);
    // path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.40, 0);

    path.arcToPoint(Offset(size.width, 20),
        radius: const Radius.elliptical(50, 15.0), clockwise: true);
    // path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, size.height);
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
