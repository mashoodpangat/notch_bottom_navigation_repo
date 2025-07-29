import 'package:flutter/material.dart';

class InwardTopNotchClipper extends CustomClipper<Path> {
  final double notchWidth;
  final double notchDepth;

  InwardTopNotchClipper(this.notchWidth, this.notchDepth);

  @override
  Path getClip(Size size) {
    const double cornerRadius = 30;
    final double notchStart = (size.width - notchWidth) / 2;
    final double notchEnd = (size.width + notchWidth) / 2;

    final path = Path();
    path.moveTo(cornerRadius, 0);
    path.quadraticBezierTo(0, 0, 0, cornerRadius);
    path.lineTo(0, size.height - cornerRadius);
    path.quadraticBezierTo(0, size.height, cornerRadius, size.height);
    path.lineTo(size.width - cornerRadius, size.height);
    path.quadraticBezierTo(size.width, size.height, size.width, size.height - cornerRadius);
    path.lineTo(size.width, cornerRadius);
    path.quadraticBezierTo(size.width, 0, size.width - cornerRadius, 0);

    path.lineTo(notchEnd, 0);
    path.cubicTo(notchEnd - notchWidth * 0.25, 0, size.width / 2 + notchWidth * 0.25, notchDepth, size.width / 2, notchDepth);
    path.cubicTo(size.width / 2 - notchWidth * 0.25, notchDepth, notchStart + notchWidth * 0.25, 0, notchStart, 0);

    path.lineTo(cornerRadius, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
