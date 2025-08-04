// //ignore: duplicate_import

// import 'dart:async';
// import 'dart:io';
// import 'dart:ui' as ui;
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:image_gallery_saver/image_gallery_saver.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';

// import 'package:screenshot/screenshot.dart';

// class ImageDetailScreen extends StatefulWidget {
//   final String imagePath;
//   final double height;
//   final double width;

//   const ImageDetailScreen({
//     super.key,
//     required this.imagePath,
//     required this.height,
//     required this.width,
//   });

//   @override
//   _ImageDetailScreenState createState() => _ImageDetailScreenState();
// }

// class _ImageDetailScreenState extends State<ImageDetailScreen> {
//   final controller = ScreenshotController();
//   int _selectedBrushIndex = -1;
//   double _selectedBrushSize = 15.0; // Default brush size
//   Color _selectedColor = Colors.transparent;
//   List<Map<String, dynamic>> _points = [];
//   ui.Image? _image;
//   bool _isEraserSelected = false;
//   bool _isBrushSelected = false;
//   double _scale = 1.0; // For zooming functionality
//   final Eraser _eraser = Eraser(30.0); // Adjust eraser size here

//   @override
//   void initState() {
//     super.initState();
//     _loadImage(widget.imagePath).then((image) {
//       setState(() {
//         _image = image;
//       });
//     });
//   }

//   void _selectBrush(int index, Color color, double brushSize) {
//     setState(() {
//       _selectedBrushIndex = index;
//       _selectedColor = color;
//       _selectedBrushSize = brushSize;
//       _isEraserSelected = false;
//       _isBrushSelected = true;
//     });
//   }

//   void _toggleEraser() {
//     setState(() {
//       _isEraserSelected = !_isEraserSelected;
//       _isBrushSelected = false;
//       _selectedBrushIndex = -1;
//       _selectedColor = _isEraserSelected
//           ? Colors.transparent
//           : Colors.blue; // Eraser has no color
//     });
//   }

//   void _zoomIn() {
//     setState(() {
//       _scale += 0.1;
//     });
//   }

//   void _zoomOut() {
//     setState(() {
//       _scale = (_scale > 0.1) ? _scale - 0.1 : _scale;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Screenshot(
//       controller: controller,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Image Detail'),
//         ),
//         body: Stack(
//           children: [
//             // Background Image
//             Positioned.fill(
//               child: Container(
//                 decoration: BoxDecoration(
//                     //  image: DecorationImage(
//                     //  image: AssetImage('assets/svg/images/border.png'),

//                     // fit: BoxFit.fill, // Fit the image to the screen
//                     //  ),
//                     ),
//               ),
//             ),
//             Column(
//               children: [
//                 Expanded(
//                   child: GestureDetector(
//                     onPanUpdate: (details) {
//                       RenderBox renderBox =
//                           context.findRenderObject() as RenderBox;
//                       Offset localPosition =
//                           renderBox.globalToLocal(details.globalPosition);

//                       if (_isEraserSelected) {
//                         setState(() {
//                           _eraser.erase(
//                             _points,
//                             localPosition,
//                           );
//                         });
//                       } else {
//                         setState(() {
//                           _points.add({
//                             'offset': localPosition,
//                             'color': _selectedColor,
//                             'size': _selectedBrushSize,
//                           });
//                         });
//                       }
//                     },
//                     onPanEnd: (details) {
//                       if (!_isEraserSelected) {
//                         _points.add({
//                           'offset': Offset.zero,
//                           'color': Colors.yellow,
//                           'size': _selectedBrushSize,
//                         });
//                       }
//                     },
//                     child: Center(
//                       child: _image != null
//                           ? Transform.scale(
//                               scale: _scale,
//                               child: CustomPaint(
//                                 painter: ImagePainter(
//                                   image: _image!,
//                                   points: _points,
//                                 ),
//                                 child: Container(),
//                               ),
//                             )
//                           : CircularProgressIndicator(),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.symmetric(horizontal: 40.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       _buildBrushIcon('assets/svg/images/pencil1.png', 0,
//                           Colors.red[800]!, _selectedBrushSize),
//                       _buildBrushIcon('assets/svg/images/pencil2.png', 1,
//                           Colors.blue[800]!, _selectedBrushSize),
//                       _buildBrushIcon('assets/svg/images/pencil3.png', 2,
//                           Colors.yellow[800]!, _selectedBrushSize),
//                       _buildBrushIcon('assets/svg/images/pencil4.png', 3,
//                           Colors.green[800]!, _selectedBrushSize),
//                       _buildBrushIcon('assets/svg/images/pencil5.png', 4,
//                           Colors.pink[800]!, _selectedBrushSize),
//                       _buildBrushIcon('assets/svg/images/pencil6.png', 5,
//                           Colors.purple[800]!, _selectedBrushSize),
//                       _buildBrushIcon('assets/svg/images/pencil7.png', 6,
//                           Colors.orange[800]!, _selectedBrushSize),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             Positioned(
//               right: 20.0,
//               //top: MediaQuery.of(context).size.height *

//               // 0.15, // Adjusted position
//               top: 20,
//               child: Column(
//                 children: [
//                   // Eraser CircleAvatar
//                   Padding(
//                     padding: const EdgeInsets.only(
//                         bottom: 10.0), // Reduced bottom padding
//                     child: AnimatedContainer(
//                       duration: Duration(milliseconds: 300),
//                       width: _isEraserSelected ? 80.0 : 60.0,
//                       height: _isEraserSelected ? 80.0 : 60.0,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         border: Border.all(
//                           color: Colors.blue,
//                           width: 3.0,
//                         ),
//                       ),
//                       child: Center(
//                         child: IconButton(
//                           icon: Transform.scale(
//                             scale: _isEraserSelected ? 1.2 : 1.0,
//                             child: Image.asset(
//                               'assets/svg/images/eraser.png',
//                               height: 30.0,
//                               width: 30.0,
//                             ),
//                           ),
//                           onPressed: _toggleEraser,
//                         ),
//                       ),
//                     ),
//                   ),
//                   // Brush Selector IconButton
//                   SizedBox(
//                     height: 20,
//                   ),
//                   IconButton(
//                     icon: Image.asset(
//                       'assets/svg/images/brush.png',
//                       height: 50.0,
//                       width: 50.0,
//                     ),
//                     onPressed: () {
//                       showDialog(
//                         context: context,
//                         builder: (BuildContext context) {
//                           return AlertDialog(
//                             content: BrushSelector(
//                               onBrushSelected: (size) {
//                                 setState(() {
//                                   _selectedBrushSize = size;
//                                   _isEraserSelected = false;
//                                 });
//                                 Navigator.of(context).pop(); // Close dialog
//                               },
//                             ),
//                           );
//                         },
//                       );
//                     },
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   // Zoom Controls
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       IconButton(
//                         icon: Image.asset(
//                           'assets/svg/images/zoom_in.png',
//                           height: 50,
//                         ),
//                         onPressed: _zoomIn,
//                       ),
//                       IconButton(
//                         icon: Image.asset(
//                           'assets/svg/images/zoom_out.png',
//                           height: 50,
//                         ),
//                         onPressed: _zoomOut,
//                       ),
//                     ],
//                   ),
//                   // IconButton(
//                   //     onPressed: () async {
//                   //       final image = await controller.capture();
//                   //       if (image == null) return;
//                   //       await saveImage(image);
//                   //     },
//                   //     icon: Image.asset(
//                   //       'assets/svg/images/camera.png',
//                   //       width: 50,
//                   //       height: 100,
//                   //     ))
//                 ],
//               ),
//             ),
//             Positioned(
//                 left: 150,
//                 top: 0,
//                 child: Column(
//                   children: [
//                     IconButton(
//                         onPressed: () async {
//                           final image = await controller.capture();
//                           if (image == null) return;
//                           await saveImage(image);
//                         },
//                         icon: Image.asset(
//                           'assets/svg/images/camera.png',
//                           width: 50,
//                           height: 100,
//                         ))
//                   ],
//                 ))
//           ],
//         ),
//       ),
//     );
//   }

//   Future<ui.Image> _loadImage(String asset) async {
//     final ByteData data = await rootBundle.load(asset);
//     final List<int> bytes = data.buffer.asUint8List();
//     final Completer<ui.Image> completer = Completer();
//     ui.decodeImageFromList(Uint8List.fromList(bytes), (ui.Image img) {
//       completer.complete(img);
//     });
//     return completer.future;
//   }

//   Widget _buildBrushIcon(
//       String imagePath, int index, Color color, double brushSize) {
//     bool isSelected = _selectedBrushIndex == index;
//     double size = isSelected ? 60.0 : 40.0;

//     return IconButton(
//       onPressed: () {
//         _selectBrush(index, color, brushSize);
//       },
//       icon: Transform.scale(
//         scale: isSelected ? 1.2 : 1.0,
//         child: Image.asset(
//           imagePath,
//           height: size,
//           width: size,
//         ),
//       ),
//     );
//   }
// }

// class ImagePainter extends CustomPainter {
//   final ui.Image image;
//   final List<Map<String, dynamic>> points;

//   ImagePainter({
//     required this.image,
//     required this.points,
//   });

//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()..strokeCap = StrokeCap.round;

//     final double imageX = (size.width - image.width) / 2;
//     final double imageY = (size.height - image.height) / 2;

//     canvas.drawImage(image, Offset(imageX, imageY), Paint());

//     for (var point in points) {
//       paint.color = point['color'] ?? Colors.transparent;
//       paint.strokeWidth = point['size'] ?? 10.0;
//       canvas.drawCircle(point['offset'], paint.strokeWidth / 2, paint);
//     }
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => true;
// }

// class BrushSelector extends StatelessWidget {
//   final Function(double) onBrushSelected;

//   BrushSelector({required this.onBrushSelected});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Text(
//           'Select Brush Size',
//           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//         ),
//         Slider(
//           value: 15.0,
//           min: 1.0,
//           max: 100.0,
//           onChanged: (double value) {
//             onBrushSelected(value);
//           },
//         ),
//       ],
//     );
//   }
// }

// class Eraser {
//   final double size;

//   Eraser(this.size);

//   void erase(List<Map<String, dynamic>> points, Offset localPosition) {
//     points.removeWhere((point) {
//       return (point['offset'] as Offset).dx >= localPosition.dx - size / 2 &&
//           (point['offset'] as Offset).dx <= localPosition.dx + size / 2 &&
//           (point['offset'] as Offset).dy >= localPosition.dy - size / 2 &&
//           (point['offset'] as Offset).dy <= localPosition.dy + size / 2;
//     });
//   }
// }

// // Future<String> saveImage(Uint8List bytes) async {
// //   await [Permission.storage].request();
// //   final time = DateTime.now()
// //       .toIso8601String()
// //       .replaceAll('.', '_')
// //       .replaceAll(':', '_');
// //   final name = 'screenshot_$time';
// //   final result = await ImageGallerySaver.saveImage(bytes, name: name);
// //   return result['filePath'];
// // }
// Future<String> saveImage(Uint8List bytes) async {
//   String filePath;

//   if (Platform.isAndroid || Platform.isIOS) {
//     // Mobile platforms
//     await [Permission.storage].request();
//     final time = DateTime.now()
//         .toIso8601String()
//         .replaceAll('.', '_')
//         .replaceAll(':', '_');
//     final name = 'screenshot_$time';
//     final result = await ImageGallerySaver.saveImage(bytes, name: name);
//     filePath = result['filePath'];
//   } else {
//     // Desktop platforms
//     final directory = await getApplicationDocumentsDirectory();
//     final time = DateTime.now()
//         .toIso8601String()
//         .replaceAll('.', '_')
//         .replaceAll(':', '_');
//     final name = 'screenshot_$time.png';
//     filePath = '${directory.path}/$name';

//     final file = File(filePath);
//     await file.writeAsBytes(bytes);
//   }

//   print('Image saved at: $filePath'); // Log the file path
//   return filePath;
// }

// import 'dart:async';
// import 'dart:io';
// import 'dart:ui' as ui;
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:image_gallery_saver/image_gallery_saver.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';

// import 'package:screenshot/screenshot.dart';

// class ImageDetailScreen extends StatefulWidget {
//   final String imagePath;
//   final double height;
//   final double width;

//   const ImageDetailScreen({
//     super.key,
//     required this.imagePath,
//     required this.height,
//     required this.width,
//   });

//   @override
//   _ImageDetailScreenState createState() => _ImageDetailScreenState();
// }

// class _ImageDetailScreenState extends State<ImageDetailScreen> {
//   final controller = ScreenshotController();
//   int _selectedBrushIndex = -1;
//   double _selectedBrushSize = 15.0; // Default brush size
//   Color _selectedColor = Colors.transparent;
//   List<Map<String, dynamic>> _points = [];
//   ui.Image? _image;
//   bool _isEraserSelected = false;
//   bool _isBrushSelected = false;
//   double _scale = 1.0; // For zooming functionality
//   final Eraser _eraser = Eraser(30.0); // Adjust eraser size here

//   @override
//   void initState() {
//     super.initState();
//     _loadImage(widget.imagePath).then((image) {
//       setState(() {
//         _image = image;
//       });
//     });
//   }

//   void _selectBrush(int index, Color color, double brushSize) {
//     setState(() {
//       _selectedBrushIndex = index;
//       _selectedColor = color;
//       _selectedBrushSize = brushSize;
//       _isEraserSelected = false;
//       _isBrushSelected = true;
//     });
//   }

//   void _toggleEraser() {
//     setState(() {
//       _isEraserSelected = !_isEraserSelected;
//       _isBrushSelected = false;
//       _selectedBrushIndex = -1;
//       _selectedColor = _isEraserSelected
//           ? Colors.transparent
//           : Colors.blue; // Eraser has no color
//     });
//   }

//   void _zoomIn() {
//     setState(() {
//       _scale += 0.1;
//     });
//   }

//   void _zoomOut() {
//     setState(() {
//       _scale = (_scale > 0.1) ? _scale - 0.1 : _scale;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Screenshot(
//       controller: controller,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Image Detail'),
//         ),
//         body: Stack(
//           children: [
//             // Background Image
//             Positioned.fill(
//               child: Container(
//                 decoration: BoxDecoration(
//                     //  image: DecorationImage(
//                     //  image: AssetImage('assets/svg/images/border.png'),

//                     // fit: BoxFit.fill, // Fit the image to the screen
//                     //  ),
//                     ),
//               ),
//             ),
//             Column(
//               children: [
//                 Expanded(
//                   child: GestureDetector(
//                     onPanUpdate: (details) {
//                       RenderBox renderBox =
//                           context.findRenderObject() as RenderBox;
//                       Offset localPosition =
//                           renderBox.globalToLocal(details.globalPosition);

//                       if (_isEraserSelected) {
//                         setState(() {
//                           _eraser.erase(
//                             _points,
//                             localPosition,
//                           );
//                         });
//                       } else {
//                         setState(() {
//                           _points.add({
//                             'offset': localPosition,
//                             'color': _selectedColor,
//                             'size': _selectedBrushSize,
//                           });
//                         });
//                       }
//                     },
//                     onPanEnd: (details) {
//                       if (!_isEraserSelected) {
//                         _points.add({
//                           'offset': Offset.zero,
//                           'color': Colors.yellow,
//                           'size': _selectedBrushSize,
//                         });
//                       }
//                     },
//                     child: Center(
//                       child: _image != null
//                           ? Transform.scale(
//                               scale: _scale,
//                               child: CustomPaint(
//                                 painter: ImagePainter(
//                                   image: _image!,
//                                   points: _points,
//                                 ),
//                                 child: Container(),
//                               ),
//                             )
//                           : CircularProgressIndicator(),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.symmetric(horizontal: 40.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       _buildBrushIcon('assets/svg/images/pencil1.png', 0,
//                           Colors.red[800]!, _selectedBrushSize),
//                       _buildBrushIcon('assets/svg/images/pencil2.png', 1,
//                           Colors.blue[800]!, _selectedBrushSize),
//                       _buildBrushIcon('assets/svg/images/pencil3.png', 2,
//                           Colors.yellow[800]!, _selectedBrushSize),
//                       _buildBrushIcon('assets/svg/images/pencil4.png', 3,
//                           Colors.green[800]!, _selectedBrushSize),
//                       _buildBrushIcon('assets/svg/images/pencil5.png', 4,
//                           Colors.pink[800]!, _selectedBrushSize),
//                       _buildBrushIcon('assets/svg/images/pencil6.png', 5,
//                           Colors.purple[800]!, _selectedBrushSize),
//                       _buildBrushIcon('assets/svg/images/pencil7.png', 6,
//                           Colors.orange[800]!, _selectedBrushSize),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             Positioned(
//               right: 20.0,
//               //top: MediaQuery.of(context).size.height *

//               // 0.15, // Adjusted position
//               top: 20,
//               child: Column(
//                 children: [
//                   // Eraser CircleAvatar
//                   Padding(
//                     padding: const EdgeInsets.only(
//                         bottom: 10.0), // Reduced bottom padding
//                     child: AnimatedContainer(
//                       duration: Duration(milliseconds: 300),
//                       width: _isEraserSelected ? 80.0 : 60.0,
//                       height: _isEraserSelected ? 80.0 : 60.0,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         border: Border.all(
//                           color: Colors.blue,
//                           width: 3.0,
//                         ),
//                       ),
//                       child: Center(
//                         child: IconButton(
//                           icon: Transform.scale(
//                             scale: _isEraserSelected ? 1.2 : 1.0,
//                             child: Image.asset(
//                               'assets/svg/images/eraser.png',
//                               height: 30.0,
//                               width: 30.0,
//                             ),
//                           ),
//                           onPressed: _toggleEraser,
//                         ),
//                       ),
//                     ),
//                   ),
//                   // Brush Selector IconButton
//                   SizedBox(
//                     height: 20,
//                   ),
//                   IconButton(
//                     icon: Image.asset(
//                       'assets/svg/images/brush.png',
//                       height: 50.0,
//                       width: 50.0,
//                     ),
//                     onPressed: () {
//                       showDialog(
//                         context: context,
//                         builder: (BuildContext context) {
//                           return AlertDialog(
//                             content: BrushSelector(
//                               onBrushSelected: (size) {
//                                 setState(() {
//                                   _selectedBrushSize = size;
//                                   _isEraserSelected = false;
//                                 });
//                                 Navigator.of(context).pop(); // Close dialog
//                               },
//                             ),
//                           );
//                         },
//                       );
//                     },
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   // Zoom Controls
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       IconButton(
//                         icon: Image.asset(
//                           'assets/svg/images/zoom_in.png',
//                           height: 50,
//                         ),
//                         onPressed: _zoomIn,
//                       ),
//                       IconButton(
//                         icon: Image.asset(
//                           'assets/svg/images/zoom_out.png',
//                           height: 50,
//                         ),
//                         onPressed: _zoomOut,
//                       ),
//                     ],
//                   ),
//                   // IconButton(
//                   //     onPressed: () async {
//                   //       final image = await controller.capture();
//                   //       if (image == null) return;
//                   //       await saveImage(image);
//                   //     },
//                   //     icon: Image.asset(
//                   //       'assets/svg/images/camera.png',
//                   //       width: 50,
//                   //       height: 100,
//                   //     ))
//                 ],
//               ),
//             ),
//             Positioned(
//                 left: 150,
//                 top: 0,
//                 child: Column(
//                   children: [
//                     IconButton(
//                         onPressed: () async {
//                           final image = await controller.capture();
//                           if (image == null) return;
//                           await saveImage(image);
//                         },
//                         icon: Image.asset(
//                           'assets/svg/images/camera.png',
//                           width: 50,
//                           height: 100,
//                         ))
//                   ],
//                 ))
//           ],
//         ),
//       ),
//     );
//   }

//   Future<ui.Image> _loadImage(String asset) async {
//     final ByteData data = await rootBundle.load(asset);
//     final List<int> bytes = data.buffer.asUint8List();
//     final Completer<ui.Image> completer = Completer();
//     ui.decodeImageFromList(Uint8List.fromList(bytes), (ui.Image img) {
//       completer.complete(img);
//     });
//     return completer.future;
//   }

//   Widget _buildBrushIcon(
//       String imagePath, int index, Color color, double brushSize) {
//     bool isSelected = _selectedBrushIndex == index;
//     double size = isSelected ? 60.0 : 40.0;

//     return IconButton(
//       onPressed: () {
//         _selectBrush(index, color, brushSize);
//       },
//       icon: Transform.scale(
//         scale: isSelected ? 1.2 : 1.0,
//         child: Image.asset(
//           imagePath,
//           height: size,
//           width: size,
//         ),
//       ),
//     );
//   }
// }

// class ImagePainter extends CustomPainter {
//   final ui.Image image;
//   final List<Map<String, dynamic>> points;

//   ImagePainter({
//     required this.image,
//     required this.points,
//   });

//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()..strokeCap = StrokeCap.round;

//     // Calculate image coordinates (centered)
//     final double imageX = (size.width - image.width) / 2;
//     final double imageY = (size.height - image.height) / 2;

//     // Draw the image
//     canvas.drawImage(image, Offset(imageX, imageY), Paint());

//     // Draw points on top of the image
//     for (var point in points) {
//       // Ensure the offset is relative to the image or canvas
//       final Offset offset = point['offset'];
//       final Color color = point['color'] ?? Colors.transparent;
//       final double size = point['size'] ?? 10.0;

//       // Apply paint settings
//       paint.color = color;
//       paint.strokeWidth = size;

//       // Draw circle where the cursor is
//       canvas.drawCircle(offset, size / 2, paint);
//     }
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => true;
// }

// class BrushSelector extends StatelessWidget {
//   final Function(double) onBrushSelected;

//   BrushSelector({required this.onBrushSelected});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Text(
//           'Select Brush Size',
//           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//         ),
//         Slider(
//           value: 15.0,
//           min: 1.0,
//           max: 100.0,
//           onChanged: (double value) {
//             onBrushSelected(value);
//           },
//         ),
//       ],
//     );
//   }
// }

// class Eraser {
//   final double size;

//   Eraser(this.size);

//   void erase(List<Map<String, dynamic>> points, Offset localPosition) {
//     points.removeWhere((point) {
//       return (point['offset'] as Offset).dx >= localPosition.dx - size / 2 &&
//           (point['offset'] as Offset).dx <= localPosition.dx + size / 2 &&
//           (point['offset'] as Offset).dy >= localPosition.dy - size / 2 &&
//           (point['offset'] as Offset).dy <= localPosition.dy + size / 2;
//     });
//   }
// }

// // Future<String> saveImage(Uint8List bytes) async {
// //   await [Permission.storage].request();
// //   final time = DateTime.now()
// //       .toIso8601String()
// //       .replaceAll('.', '_')
// //       .replaceAll(':', '_');
// //   final name = 'screenshot_$time';
// //   final result = await ImageGallerySaver.saveImage(bytes, name: name);
// //   return result['filePath'];
// // }
// Future<String> saveImage(Uint8List bytes) async {
//   String filePath;

//   if (Platform.isAndroid || Platform.isIOS) {
//     // Mobile platforms
//     await [Permission.storage].request();
//     final time = DateTime.now()
//         .toIso8601String()
//         .replaceAll('.', '_')
//         .replaceAll(':', '_');
//     final name = 'screenshot_$time';
//     final result = await ImageGallerySaver.saveImage(bytes, name: name);
//     filePath = result['filePath'];
//     Fluttertoast.showToast(
//         msg: "Image saved",
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.BOTTOM,
//         backgroundColor: Colors.grey,
//         textColor: Colors.white);
//   } else {
//     // Desktop platforms
//     final directory = await getApplicationDocumentsDirectory();
//     final time = DateTime.now()
//         .toIso8601String()
//         .replaceAll('.', '_')
//         .replaceAll(':', '_');
//     final name = 'screenshot_$time.png';
//     Fluttertoast.showToast(
//         msg: "Image saved",
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.BOTTOM,
//         backgroundColor: Colors.grey,
//         textColor: Colors.white);
//     filePath = '${directory.path}/$name';

//     final file = File(filePath);
//     await file.writeAsBytes(bytes);
//   }

//   print('Image saved at: $filePath'); // Log the file path
//   return filePath;
// }

// import 'dart:async';
// import 'dart:io';
// import 'dart:ui' as ui;
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter/widgets.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:image_gallery_saver/image_gallery_saver.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';

// import 'package:screenshot/screenshot.dart';

// class ImageDetailScreen extends StatefulWidget {
//   final String imagePath;
//   final double height;
//   final double width;

//   const ImageDetailScreen({
//     super.key,
//     required this.imagePath,
//     required this.height,
//     required this.width,
//   });

//   @override
//   _ImageDetailScreenState createState() => _ImageDetailScreenState();
// }

// class _ImageDetailScreenState extends State<ImageDetailScreen> {
//   final controller = ScreenshotController();
//   int _selectedBrushIndex = -1;
//   double _selectedBrushSize = 15.0; // Default brush size
//   Color _selectedColor = Colors.transparent;
//   List<Map<String, dynamic>> _points = [];
//   ui.Image? _image;
//   bool _isEraserSelected = false;
//   bool _isBrushSelected = false;
//   //double _selectedBrushSize = 10.0;
//   bool _isBrushSelectorVisible = false;
//   double _scale = 1.0; // For zooming functionality
//   final Eraser _eraser = Eraser(30.0); // Adjust eraser size here

//   @override
//   void initState() {
//     super.initState();
//     _loadImage(widget.imagePath).then((image) {
//       setState(() {
//         _image = image;
//       });
//     });
//   }

//   void _selectBrush(int index, Color color, double brushSize) {
//     setState(() {
//       _selectedBrushIndex = index;
//       _selectedColor = color;
//       _selectedBrushSize = brushSize;
//       _isEraserSelected = false;
//       _isBrushSelected = true;
//     });
//   }

//   void _toggleEraser() {
//     setState(() {
//       _isEraserSelected = !_isEraserSelected;
//       _isBrushSelected = false;
//       _selectedBrushIndex = -1;
//       _selectedColor = _isEraserSelected
//           ? Colors.transparent
//           : Colors.blue; // Eraser has no color
//     });
//   }

//   void _zoomIn() {
//     setState(() {
//       _scale += 0.1;
//     });
//   }

//   void _zoomOut() {
//     setState(() {
//       _scale = (_scale > 0.1) ? _scale - 0.1 : _scale;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Screenshot(
//       controller: controller,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Image Detail'),
//         ),
//         body: Stack(
//           children: [
//             // Background Image
//             Positioned.fill(
//               child: Container(
//                 decoration: BoxDecoration(
//                     //  image: DecorationImage(
//                     //  image: AssetImage('assets/svg/images/border.png'),

//                     // fit: BoxFit.fill, // Fit the image to the screen
//                     //  ),
//                     ),
//               ),
//             ),
//             Column(
//               children: [
//                 Expanded(
//                   child: GestureDetector(
//                     onPanUpdate: (details) {
//                       RenderBox renderBox =
//                           context.findRenderObject() as RenderBox;
//                       Offset localPosition =
//                           renderBox.globalToLocal(details.globalPosition);

//                       if (_isEraserSelected) {
//                         setState(() {
//                           _eraser.erase(
//                             _points,
//                             localPosition,
//                           );
//                         });
//                       } else {
//                         setState(() {
//                           _points.add({
//                             'offset': localPosition,
//                             'color': _selectedColor,
//                             'size': _selectedBrushSize,
//                           });
//                         });
//                       }
//                     },
//                     onPanEnd: (details) {
//                       if (!_isEraserSelected) {
//                         _points.add({
//                           'offset': Offset.zero,
//                           'color': Colors.yellow,
//                           'size': _selectedBrushSize,
//                         });
//                       }
//                     },
//                     child: Center(
//                       child: _image != null
//                           ? Transform.scale(
//                               scale: _scale,
//                               child: CustomPaint(
//                                 painter: ImagePainter(
//                                   image: _image!,
//                                   points: _points,
//                                 ),
//                                 child: Container(),
//                               ),
//                             )
//                           : CircularProgressIndicator(),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.symmetric(horizontal: 40.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       _buildBrushIcon('assets/svg/images/pencil1.png', 0,
//                           Colors.red[800]!, _selectedBrushSize),
//                       _buildBrushIcon('assets/svg/images/pencil2.png', 1,
//                           Colors.blue[800]!, _selectedBrushSize),
//                       _buildBrushIcon('assets/svg/images/pencil3.png', 2,
//                           Colors.yellow[800]!, _selectedBrushSize),
//                       _buildBrushIcon('assets/svg/images/pencil4.png', 3,
//                           Colors.green[800]!, _selectedBrushSize),
//                       _buildBrushIcon('assets/svg/images/pencil5.png', 4,
//                           Colors.pink[800]!, _selectedBrushSize),
//                       _buildBrushIcon('assets/svg/images/pencil6.png', 5,
//                           Colors.purple[800]!, _selectedBrushSize),
//                       _buildBrushIcon('assets/svg/images/pencil7.png', 6,
//                           Colors.orange[800]!, _selectedBrushSize),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             Positioned(
//               right: 20.0,
//               //top: MediaQuery.of(context).size.height *

//               // 0.15, // Adjusted position
//               top: 20,
//               child: Column(
//                 children: [
//                   // Eraser CircleAvatar
//                   Padding(
//                     padding: const EdgeInsets.only(
//                         bottom: 10.0), // Reduced bottom padding
//                     child: AnimatedContainer(
//                       duration: Duration(milliseconds: 300),
//                       width: _isEraserSelected ? 80.0 : 60.0,
//                       height: _isEraserSelected ? 80.0 : 60.0,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         border: Border.all(
//                           color: Colors.blue,
//                           width: 3.0,
//                         ),
//                       ),
//                       child: Center(
//                         child: IconButton(
//                           icon: Transform.scale(
//                             scale: _isEraserSelected ? 1.2 : 1.0,
//                             child: Image.asset(
//                               'assets/svg/images/eraser.png',
//                               height: 30.0,
//                               width: 30.0,
//                             ),
//                           ),
//                           onPressed: _toggleEraser,
//                         ),
//                       ),
//                     ),
//                   ),
//                   // Brush Selector IconButton
//                   SizedBox(
//                     height: 20,
//                   ),
//                   // IconButton(
//                   //   icon: Image.asset(
//                   //     'assets/svg/images/brush.png',
//                   //     height: 50.0,
//                   //     width: 50.0,
//                   //   ),
//                   //   onPressed: () {
//                   //     // showDialog(
//                   //     //   context: context,
//                   //     //   builder: (BuildContext context) {
//                   //     //     return AlertDialog(
//                   //     //       contentPadding: EdgeInsets.all(10),
//                   //     //       content: BrushSelector(
//                   //     //         onBrushSelected: (size) {
//                   //     //           setState(() {
//                   //     //             _selectedBrushSize = size;
//                   //     //             _isEraserSelected = false;
//                   //     //           });
//                   //     //           Navigator.of(context).pop(); // Close dialog
//                   //     //         },
//                   //     //       ),
//                   //     //     );
//                   //     //   },
//                   //     // );
//                   //   },
//                   // ),

//                   Stack(
//                     alignment: Alignment.topCenter,
//                     children: [
//                       Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           IconButton(
//                             icon: Image.asset(
//                               'assets/svg/images/brush.png',
//                               height: 50.0,
//                               width: 50.0,
//                             ),
//                             onPressed: () {
//                               setState(() {
//                                 _isBrushSelectorVisible =
//                                     !_isBrushSelectorVisible;
//                               });
//                             },
//                           ),
//                           Visibility(
//                             visible: _isBrushSelectorVisible,
//                             child: BrushSelector(
//                               onBrushSelected: (size) {
//                                 setState(() {
//                                   _selectedBrushSize = size;
//                                   _isBrushSelectorVisible =
//                                       false; // Hide after selection
//                                 });
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),

//                   SizedBox(
//                     height: 10,
//                   ),
//                   // Zoom Controls
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       IconButton(
//                         icon: Image.asset(
//                           'assets/svg/images/zoom_in.png',
//                           height: 50,
//                         ),
//                         onPressed: _zoomIn,
//                       ),
//                       IconButton(
//                         icon: Image.asset(
//                           'assets/svg/images/zoom_out.png',
//                           height: 50,
//                         ),
//                         onPressed: _zoomOut,
//                       ),
//                     ],
//                   ),
//                   // IconButton(
//                   //     onPressed: () async {
//                   //       final image = await controller.capture();
//                   //       if (image == null) return;
//                   //       await saveImage(image);
//                   //     },
//                   //     icon: Image.asset(
//                   //       'assets/svg/images/camera.png',
//                   //       width: 50,
//                   //       height: 100,
//                   //     ))
//                 ],
//               ),
//             ),
//             Positioned(
//                 left: 150,
//                 top: 0,
//                 child: Column(
//                   children: [
//                     IconButton(
//                         onPressed: () async {
//                           final image = await controller.capture();
//                           if (image == null) return;
//                           await saveImage(image);
//                         },
//                         icon: Image.asset(
//                           'assets/svg/images/camera.png',
//                           width: 50,
//                           height: 100,
//                         ))
//                   ],
//                 ))
//           ],
//         ),
//       ),
//     );
//   }

//   Future<ui.Image> _loadImage(String asset) async {
//     final ByteData data = await rootBundle.load(asset);
//     final List<int> bytes = data.buffer.asUint8List();
//     final Completer<ui.Image> completer = Completer();
//     ui.decodeImageFromList(Uint8List.fromList(bytes), (ui.Image img) {
//       completer.complete(img);
//     });
//     return completer.future;
//   }

//   Widget _buildBrushIcon(
//       String imagePath, int index, Color color, double brushSize) {
//     bool isSelected = _selectedBrushIndex == index;
//     double size = isSelected ? 60.0 : 40.0;

//     return IconButton(
//       onPressed: () {
//         _selectBrush(index, color, brushSize);
//       },
//       icon: Transform.scale(
//         scale: isSelected ? 1.2 : 1.0,
//         child: Image.asset(
//           imagePath,
//           height: size,
//           width: size,
//         ),
//       ),
//     );
//   }
// }

// class ImagePainter extends CustomPainter {
//   final ui.Image image;
//   final List<Map<String, dynamic>> points;

//   ImagePainter({
//     required this.image,
//     required this.points,
//   });

//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()..strokeCap = StrokeCap.round;

//     // Calculate image coordinates (centered)
//     final double imageX = (size.width - image.width) / 2;
//     final double imageY = (size.height - image.height) / 2;

//     // Draw the image
//     canvas.drawImage(image, Offset(imageX, imageY), Paint());

//     // Draw points on top of the image
//     for (var point in points) {
//       // Ensure the offset is relative to the image or canvas
//       final Offset offset = point['offset'];
//       final Color color = point['color'] ?? Colors.transparent;
//       final double size = point['size'] ?? 10.0;

//       // Apply paint settings
//       paint.color = color;
//       paint.strokeWidth = size;

//       // Draw circle where the cursor is
//       canvas.drawCircle(offset, size / 2, paint);
//     }
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => true;
// }

// // class BrushSelector extends StatelessWidget {
// //   final Function(double) onBrushSelected;

// //   BrushSelector({required this.onBrushSelected});

// //   @override
// //   Widget build(BuildContext context) {
// //     // return Column(
// //     //   mainAxisSize: MainAxisSize.min,
// //     //   children: [
// //     //     Text(
// //     //       'Select Brush Size',
// //     //       style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
// //     //     ),
// //     //     Slider(
// //     //       value: 15.0,
// //     //       min: 1.0,
// //     //       max: 100.0,
// //     //       onChanged: (double value) {
// //     //         onBrushSelected(value);
// //     //       },
// //     //     ),
// //     //   ],
// //     // );
// //     return Row(
// //       children: [
// //         IconButton(
// //           onPressed: () {},
// //           icon: Image.asset('assets/svg/images/brush.png'),
// //           iconSize: 2 / 2,
// //         ),
// //         IconButton(
// //           onPressed: () {},
// //           icon: Image.asset('assets/svg/images/brush.png'),
// //           iconSize: 20,
// //         ),
// //         IconButton(
// //           onPressed: () {},
// //           icon: Image.asset('assets/svg/images/brush.png'),
// //           iconSize: 30,
// //         ),
// //         IconButton(
// //           onPressed: () {},
// //           icon: Image.asset('assets/svg/images/brush.png'),
// //           iconSize: 40,
// //         ),
// //       ],
// //     );
// //   }
// // }

// class BrushSelector extends StatelessWidget {
//   final Function(double) onBrushSelected;

//   BrushSelector({required this.onBrushSelected});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.grey,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           IconButton(
//             onPressed: () {
//               onBrushSelected(5.0); // Small brush size
//             },
//             icon: Image.asset(
//               'assets/svg/images/brush.png',
//               height: 20,
//             ),
//             iconSize: 20, // Represents small brush size
//           ),
//           IconButton(
//             onPressed: () {
//               onBrushSelected(15.0); // Medium brush size
//             },
//             icon: Image.asset(
//               'assets/svg/images/brush.png',
//               height: 30,
//             ),
//             iconSize: 30, // Represents medium brush size
//           ),
//           IconButton(
//             onPressed: () {
//               onBrushSelected(25.0); // Large brush size
//             },
//             icon: Image.asset(
//               'assets/svg/images/brush.png',
//               height: 40,
//             ),
//             iconSize: 40, // Represents large brush size
//           ),
//           IconButton(
//             onPressed: () {
//               onBrushSelected(35.0); // Extra large brush size
//             },
//             icon: Image.asset(
//               'assets/svg/images/brush.png',
//               height: 50,
//             ),
//             iconSize: 50, // Represents extra-large brush size
//           ),
//         ],
//       ),
//     );
//   }
// }

// class Eraser {
//   final double size;

//   Eraser(this.size);

//   void erase(List<Map<String, dynamic>> points, Offset localPosition) {
//     points.removeWhere((point) {
//       return (point['offset'] as Offset).dx >= localPosition.dx - size / 2 &&
//           (point['offset'] as Offset).dx <= localPosition.dx + size / 2 &&
//           (point['offset'] as Offset).dy >= localPosition.dy - size / 2 &&
//           (point['offset'] as Offset).dy <= localPosition.dy + size / 2;
//     });
//   }
// }

// // Future<String> saveImage(Uint8List bytes) async {
// //   await [Permission.storage].request();
// //   final time = DateTime.now()
// //       .toIso8601String()
// //       .replaceAll('.', '_')
// //       .replaceAll(':', '_');
// //   final name = 'screenshot_$time';
// //   final result = await ImageGallerySaver.saveImage(bytes, name: name);
// //   return result['filePath'];
// // }
// Future<String> saveImage(Uint8List bytes) async {
//   String filePath;

//   if (Platform.isAndroid || Platform.isIOS) {
//     // Mobile platforms
//     await [Permission.storage].request();
//     final time = DateTime.now()
//         .toIso8601String()
//         .replaceAll('.', '_')
//         .replaceAll(':', '_');
//     final name = 'screenshot_$time';
//     final result = await ImageGallerySaver.saveImage(bytes, name: name);
//     filePath = result['filePath'];
//     Fluttertoast.showToast(
//         msg: "Image saved",
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.BOTTOM,
//         backgroundColor: Colors.grey,
//         textColor: Colors.white);
//   } else {
//     // Desktop platforms
//     final directory = await getApplicationDocumentsDirectory();
//     final time = DateTime.now()
//         .toIso8601String()
//         .replaceAll('.', '_')
//         .replaceAll(':', '_');
//     final name = 'screenshot_$time.png';
//     Fluttertoast.showToast(
//         msg: "Image saved",
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.BOTTOM,
//         backgroundColor: Colors.grey,
//         textColor: Colors.white);
//     filePath = '${directory.path}/$name';

//     final file = File(filePath);
//     await file.writeAsBytes(bytes);
//   }

//   print('Image saved at: $filePath'); // Log the file path
//   return filePath;
// }

import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_view/photo_view.dart';

import 'package:screenshot/screenshot.dart';

class ImageDetailScreen extends StatefulWidget {
  final String imagePath;
  final double height;
  final double width;

  const ImageDetailScreen({
    super.key,
    required this.imagePath,
    required this.height,
    required this.width,
  });

  @override
  _ImageDetailScreenState createState() => _ImageDetailScreenState();
}

class _ImageDetailScreenState extends State<ImageDetailScreen> {
  List<Offset?> points = [];
  final controller = ScreenshotController();
  int _selectedBrushIndex = -1;
  double _selectedBrushSize = 15.0; // Default brush size
  Color _selectedColor = Colors.transparent;
  final List<Map<String, dynamic>> _points = [];
  ui.Image? _image;
  bool _isEraserSelected = false;
  bool _isBrushSelected = false;
  //double _selectedBrushSize = 10.0;
  bool _isBrushSelectorVisible = false;
  double _scale = 1.0; // For zooming functionality
  final Eraser _eraser = Eraser(30.0); // Adjust eraser size here

  @override
  void initState() {
    super.initState();
    _loadImage(widget.imagePath).then((image) {
      setState(() {
        _image = image;
      });
    });
  }

  void _selectBrush(int index, Color color, double brushSize) {
    setState(() {
      _selectedBrushIndex = index;
      _selectedColor = color;
      _selectedBrushSize = brushSize;
      _isEraserSelected = false;
      _isBrushSelected = true;
    });
  }

  void _toggleEraser() {
    setState(() {
      _isEraserSelected = !_isEraserSelected;
      _isBrushSelected = false;
      _selectedBrushIndex = -1;
      _selectedColor = _isEraserSelected
          ? Colors.transparent
          : Colors.transparent; // Eraser has no color
    });
  }

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
    var scaleFactor;
    var imagePosition;
    return Screenshot(
      controller: controller,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Image Detail'),
        ),
        body: Stack(
          children: [
            // Background Image
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                    //  image: DecorationImage(
                    //  image: AssetImage('assets/svg/images/border.png'),

                    // fit: BoxFit.fill, // Fit the image to the screen
                    //  ),
                    ),
              ),
            ),
            Column(
              children: [
                Expanded(
                  // width: 600, // Set the container's width
                  // height: 600,
                  child: _image != null
                      ? PhotoView.customChild(
                          backgroundDecoration:
                              const BoxDecoration(color: Colors.transparent),
                          enablePanAlways: true,
                          enableRotation: true,
                          minScale: PhotoViewComputedScale.contained * 0.6,
                          maxScale: PhotoViewComputedScale.contained * 2,
                          child: GestureDetector(
                            onPanUpdate: (details) {
                              RenderBox renderBox =
                                  context.findRenderObject() as RenderBox;
                              Offset localPosition = renderBox
                                  .globalToLocal(details.globalPosition);

                              if (_isEraserSelected) {
                                setState(() {
                                  _eraser.erase(
                                    _points,
                                    localPosition,
                                  );
                                });
                              } else {
                                setState(() {
                                  _points.add({
                                    'offset': localPosition,
                                    'color': _selectedColor,
                                    'size': _selectedBrushSize,
                                  });
                                });
                              }
                            },
                            onPanEnd: (details) {
                              if (!_isEraserSelected) {
                                _points.add({
                                  'offset': Offset.zero,
                                  'color': Colors.transparent,
                                  'size': _selectedBrushSize,
                                });
                              }
                            },
                            child: Center(
                              child: _image != null
                                  ? Transform.scale(
                                      scale: _scale,
                                      child: CustomPaint(
                                        painter: ImagePainter(
                                          image: _image!,
                                          points: _points,
                                          //   xOffset: 100,
                                          // yOffset: 153,
                                          // Pass the dynamic image position
                                        ),
                                        child: Container(),
                                      ),
                                    )
                                  : const CircularProgressIndicator(),
                            ),
                          ),
                        )
                      : const Center(child: CircularProgressIndicator()),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildBrushIcon('assets/svg/images/pencil1.png', 0,
                          Colors.red[800]!, _selectedBrushSize),
                      _buildBrushIcon('assets/svg/images/pencil2.png', 1,
                          Colors.blue[800]!, _selectedBrushSize),
                      _buildBrushIcon('assets/svg/images/pencil3.png', 2,
                          Colors.yellow[800]!, _selectedBrushSize),
                      _buildBrushIcon('assets/svg/images/pencil4.png', 3,
                          Colors.green[800]!, _selectedBrushSize),
                      _buildBrushIcon('assets/svg/images/pencil5.png', 4,
                          Colors.pink[800]!, _selectedBrushSize),
                      _buildBrushIcon('assets/svg/images/pencil6.png', 5,
                          Colors.purple[800]!, _selectedBrushSize),
                      _buildBrushIcon('assets/svg/images/pencil7.png', 6,
                          Colors.orange[800]!, _selectedBrushSize),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              right: 20.0,
              //top: MediaQuery.of(context).size.height *

              // 0.15, // Adjusted position
              top: 20,
              child: Column(
                children: [
                  // Eraser CircleAvatar
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 10.0), // Reduced bottom padding
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: _isEraserSelected ? 80.0 : 60.0,
                      height: _isEraserSelected ? 80.0 : 60.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.blue,
                          width: 3.0,
                        ),
                      ),
                      child: Center(
                        child: IconButton(
                          icon: Transform.scale(
                            scale: _isEraserSelected ? 1.2 : 1.0,
                            child: Image.asset(
                              'assets/svg/images/eraser.png',
                              height: 30.0,
                              width: 30.0,
                            ),
                          ),
                          onPressed: _toggleEraser,
                        ),
                      ),
                    ),
                  ),
                  // Brush Selector IconButton
                  const SizedBox(
                    height: 20,
                  ),

                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Image.asset(
                              'assets/svg/images/brush.png',
                              height: 50.0,
                              width: 50.0,
                            ),
                            onPressed: () {
                              setState(() {
                                _isBrushSelectorVisible =
                                    !_isBrushSelectorVisible;
                              });
                            },
                          ),
                          Visibility(
                            visible: _isBrushSelectorVisible,
                            child: BrushSelector(
                              onBrushSelected: (size) {
                                setState(() {
                                  _selectedBrushSize = size;
                                  _isBrushSelectorVisible =
                                      false; // Hide after selection
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  // Zoom Controls
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Image.asset(
                          'assets/svg/images/zoom_in.png',
                          height: 50,
                        ),
                        onPressed: _zoomIn,
                      ),
                      IconButton(
                        icon: Image.asset(
                          'assets/svg/images/zoom_out.png',
                          height: 50,
                        ),
                        onPressed: _zoomOut,
                      ),
                    ],
                  ),
                  // IconButton(
                  //     onPressed: () async {
                  //       final image = await controller.capture();
                  //       if (image == null) return;
                  //       await saveImage(image);
                  //     },
                  //     icon: Image.asset(
                  //       'assets/svg/images/camera.png',
                  //       width: 50,
                  //       height: 100,
                  //     ))
                ],
              ),
            ),
            Positioned(
                left: 150,
                top: 0,
                child: Column(
                  children: [
                    IconButton(
                        onPressed: () async {
                          final image = await controller.capture();
                          if (image == null) return;
                          await saveImage(image);
                        },
                        icon: Image.asset(
                          'assets/svg/images/camera.png',
                          width: 50,
                          height: 100,
                        ))
                  ],
                ))
          ],
        ),
      ),
    );
  }

  Future<ui.Image> _loadImage(String asset) async {
    final ByteData data = await rootBundle.load(asset);
    final List<int> bytes = data.buffer.asUint8List();
    final Completer<ui.Image> completer = Completer();
    ui.decodeImageFromList(Uint8List.fromList(bytes), (ui.Image img) {
      completer.complete(img);
    });
    return completer.future;
  }

  Widget _buildBrushIcon(
      String imagePath, int index, Color color, double brushSize) {
    bool isSelected = _selectedBrushIndex == index;
    double size = isSelected ? 60.0 : 40.0;

    return IconButton(
      onPressed: () {
        _selectBrush(index, color, brushSize);
      },
      icon: Transform.scale(
        scale: isSelected ? 1.2 : 1.0,
        child: Image.asset(
          imagePath,
          height: size,
          width: size,
        ),
      ),
    );
  }
}

// class ImagePainter extends CustomPainter {
//   final ui.Image image;
//   final List<Map<String, dynamic>> points;

//   ImagePainter({
//     required this.image,
//     required this.points,
//   });

//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()..strokeCap = StrokeCap.round;

//     // Set a scale factor for the image (e.g., 0.5 to make the image 50% smaller)
//     final double scaleFactor = 0.1; // You can adjust this value as needed

//     // Calculate the new dimensions for the image
//     final double scaledWidth = image.width * scaleFactor;
//     final double scaledHeight = image.height * scaleFactor;

//     // Calculate image coordinates (centered with new dimensions)
//     final double imageX = (size.width - scaledWidth) / 2;
//     final double imageY = (size.height - scaledHeight) / 2;

//     // Create a destination rectangle for the scaled image
//     final Rect destinationRect = Rect.fromLTWH(
//       imageX,
//       imageY,
//       scaledWidth,
//       scaledHeight,
//     );

//     // Draw the image scaled down to the desired size
//     canvas.drawImageRect(
//       image,
//       Rect.fromLTWH(0, 0, image.width.toDouble(), image.height.toDouble()),
//       destinationRect,
//       Paint(),
//     );
//     // for (int i = 0; i < points.length - 1; i++) {
//     //   if (points[i] != null && points[i + 1] != null) {
//     //     canvas.drawLine(
//     //         points[i]! as ui.Offset, points[i + 1]! as ui.Offset, paint);
//     //   }
//     // }

//     // Draw points on top of the image
//     for (var point in points) {
//       // Ensure the offset is relative to the image or canvas
//       final Offset offset = point['offset'];
//       final Color color = point['color'] ?? Colors.transparent;
//       final double size = point['size'] ?? 10.0;

//       // Apply paint settings
//       paint.color = color;
//       paint.strokeWidth = size;

//       // Draw circle where the cursor is
//       canvas.drawCircle(offset, size / 2, paint);
//     }
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => true;
// }

class ImagePainter extends CustomPainter {
  final ui.Image image;
  final List<Map<String, dynamic>> points;

  ImagePainter({
    required this.image,
    required this.points,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..strokeCap = StrokeCap.round;

    // Set a scale factor for the image (e.g., 0.1 to make the image 10% of its original size)
    const double scaleFactor = 0.1; // Adjust this value as needed

    // Calculate the scaled dimensions for the image
    final double scaledWidth = image.width * scaleFactor;
    final double scaledHeight = image.height * scaleFactor;

    // Center the scaled image within the canvas
    final double imageX = (size.width - scaledWidth) / 2;
    final double imageY = (size.height - scaledHeight) / 2;

    // Create a destination rectangle for the scaled image
    final Rect destinationRect = Rect.fromLTWH(
      imageX,
      imageY,
      scaledWidth,
      scaledHeight,
    );

    // Draw the image scaled down to the desired size
    canvas.drawImageRect(
      image,
      Rect.fromLTWH(0, 0, image.width.toDouble(), image.height.toDouble()),
      destinationRect,
      Paint(),
    );

    // Draw points on top of the image
    for (var point in points) {
      if (point['offset'] != null) {
        final Offset originalOffset = point['offset'];

        // Adjust the offset to be relative to the image's scaled and centered position
        final Offset adjustedOffset = Offset(
          (originalOffset.dx - imageX) / scaleFactor,
          (originalOffset.dy - imageY) / scaleFactor,
        );

        final Color color = point['color'] ?? Colors.red;
        final double size = point['size'] ?? 10.0;

        // Apply paint settings
        paint.color = color;
        paint.strokeWidth = size;

        // Draw circle at the adjusted offset
        canvas.drawCircle(originalOffset, size / 2, paint);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class BrushSelector extends StatelessWidget {
  final Function(double) onBrushSelected;

  const BrushSelector({super.key, required this.onBrushSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              onBrushSelected(5.0); // Small brush size
            },
            icon: Image.asset(
              'assets/svg/images/brush.png',
              height: 20,
            ),
            iconSize: 20, // Represents small brush size
          ),
          IconButton(
            onPressed: () {
              onBrushSelected(15.0); // Medium brush size
            },
            icon: Image.asset(
              'assets/svg/images/brush.png',
              height: 30,
            ),
            iconSize: 30, // Represents medium brush size
          ),
          IconButton(
            onPressed: () {
              onBrushSelected(25.0); // Large brush size
            },
            icon: Image.asset(
              'assets/svg/images/brush.png',
              height: 40,
            ),
            iconSize: 40, // Represents large brush size
          ),
          IconButton(
            onPressed: () {
              onBrushSelected(35.0); // Extra large brush size
            },
            icon: Image.asset(
              'assets/svg/images/brush.png',
              height: 50,
            ),
            iconSize: 50, // Represents extra-large brush size
          ),
        ],
      ),
    );
  }
}

class Eraser {
  final double size;

  Eraser(this.size);

  void erase(List<Map<String, dynamic>> points, Offset localPosition) {
    points.removeWhere((point) {
      return (point['offset'] as Offset).dx >= localPosition.dx - size / 2 &&
          (point['offset'] as Offset).dx <= localPosition.dx + size / 2 &&
          (point['offset'] as Offset).dy >= localPosition.dy - size / 2 &&
          (point['offset'] as Offset).dy <= localPosition.dy + size / 2;
    });
  }
}

Future<String> saveImage(Uint8List bytes) async {
  String filePath;

  if (Platform.isAndroid || Platform.isIOS) {
    // Mobile platforms
    await [Permission.storage].request();
    final time = DateTime.now()
        .toIso8601String()
        .replaceAll('.', '_')
        .replaceAll(':', '_');
    final name = 'screenshot_$time';
    final result = await ImageGallerySaver.saveImage(bytes, name: name);
    filePath = result['filePath'];
    Fluttertoast.showToast(
        msg: "Image saved",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.grey,
        textColor: Colors.white);
  } else {
    // Desktop platforms
    final directory = await getApplicationDocumentsDirectory();
    final time = DateTime.now()
        .toIso8601String()
        .replaceAll('.', '_')
        .replaceAll(':', '_');
    final name = 'screenshot_$time.png';
    Fluttertoast.showToast(
        msg: "Image saved",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.grey,
        textColor: Colors.white);
    filePath = '${directory.path}/$name';

    final file = File(filePath);
    await file.writeAsBytes(bytes);
  }

  print('Image saved at: $filePath'); // Log the file path
  return filePath;
}
