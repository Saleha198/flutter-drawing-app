import 'package:flutter/material.dart';

class PaintImage extends StatefulWidget {
  const PaintImage({super.key});

  @override
  _PaintImageState createState() => _PaintImageState();
}

class _PaintImageState extends State<PaintImage> {
  List<Offset?> points = []; // Use Offset? to allow null values

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        setState(() {
          points.add(details.localPosition);
        });
      },
      onPanEnd: (details) {
        setState(() {
          points.add(null); // Indicate the end of a stroke
        });
      },
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Container(
          child: CustomPaint(
            painter: ImagePainter(points),
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/svg/images/Untitled-4.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ImagePainter extends CustomPainter {
  final List<Offset?> points;
  ImagePainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.red // Change this to the desired paint color
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i]!, points[i + 1]!, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
