import 'dart:ui';

import 'package:flutter/material.dart';

class model extends StatelessWidget {
  const model({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Eraser Example')),
        body: EraserScreen(),
      ),
    );
  }
}

class EraserScreen extends StatefulWidget {
  const EraserScreen({super.key});

  @override
  _EraserScreenState createState() => _EraserScreenState();
}

class _EraserScreenState extends State<EraserScreen> {
  final List<Offset?> _points = [];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        setState(() {
          RenderBox renderBox = context.findRenderObject() as RenderBox;
          _points.add(renderBox.globalToLocal(details.globalPosition));
        });
      },
      onPanEnd: (details) {
        _points.add(null);
      },
      child: CustomPaint(
        painter: _EraserPainter(points: _points),
        size: Size.infinite,
      ),
    );
  }
}

class _EraserPainter extends CustomPainter {
  final List<Offset?> points;
  final double eraserSize = 20.0;

  _EraserPainter({required this.points});

  @override
  void paint(Canvas canvas, Size size) {
    Paint eraserPaint = Paint()
      ..color = Colors.white // Assuming a white background
      ..strokeCap = StrokeCap.round
      ..strokeWidth = eraserSize;

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i]!, points[i + 1]!, eraserPaint);
      } else if (points[i] != null && points[i + 1] == null) {
        canvas.drawPoints(PointMode.points, [points[i]!], eraserPaint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
