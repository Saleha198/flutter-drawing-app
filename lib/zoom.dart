import 'package:flutter/material.dart';

class ZoomPage extends StatefulWidget {
  const ZoomPage({super.key});

  @override
  _ZoomPageState createState() => _ZoomPageState();
}

class _ZoomPageState extends State<ZoomPage> {
  double _scale = 1.0;

  void _zoomIn() {
    setState(() {
      _scale += 0.1;
    });
  }

  void _zoomOut() {
    setState(() {
      _scale = (_scale > 0.1) ? _scale - 0.1 : _scale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Zoom Example')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Transform.scale(
              scale: _scale,
              child: Image.asset(
                  'assets/svg/images/im1.jpeg'), // Replace with your image
            ),
          ),
          const SizedBox(height: 20),
          ZoomControl(
            zoomInImage: Image.asset(
              'assets/svg/images/zoom_in.png',
              height: 50,
            ), // Replace with your zoom-in image
            zoomOutImage: Image.asset(
              'assets/svg/images/zoom_out.png',
              height: 50,
            ), // Replace with your zoom-out image
            onZoomIn: _zoomIn,
            onZoomOut: _zoomOut,
          ),
        ],
      ),
    );
  }
}

class ZoomControl extends StatelessWidget {
  final Image zoomInImage;
  final Image zoomOutImage;
  final Function onZoomIn;
  final Function onZoomOut;

  const ZoomControl({
    super.key,
    required this.zoomInImage,
    required this.zoomOutImage,
    required this.onZoomIn,
    required this.onZoomOut,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => onZoomIn(),
          child: zoomInImage,
        ),
        const SizedBox(width: 10), // Spacing between buttons
        GestureDetector(
          onTap: () => onZoomOut(),
          child: zoomOutImage,
        ),
      ],
    );
  }
}
