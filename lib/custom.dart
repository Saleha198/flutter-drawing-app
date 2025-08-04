import 'package:flutter/material.dart';

class ColoringPainter extends CustomPainter {
  final Color selectedColor;
  final Map<String, Color> sectionColors;
  final Map<String, Path> sectionPaths;

  ColoringPainter({
    required this.selectedColor,
    required this.sectionColors,
    required this.sectionPaths,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..style = PaintingStyle.fill;

    for (final entry in sectionPaths.entries) {
      paint.color = sectionColors[entry.key] ?? Colors.transparent;
      canvas.drawPath(entry.value, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
