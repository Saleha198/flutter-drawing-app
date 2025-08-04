// import 'dart:math';
// import 'dart:typed_data';
// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:gamingapp/brush.dart';
// import 'package:gamingapp/home.dart';
// import 'package:gamingapp/home1.dart';
// import 'package:gamingapp/mainhome.dart';
// import 'package:gamingapp/splash.dart';
// import 'package:image_gallery_saver/image_gallery_saver.dart';
// import 'package:lottie/lottie.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:screenshot/screenshot.dart';
// import 'package:gamingapp/mainhome.dart'; // Ensure this path is correct

// class Stroke {
//   final List<Offset?> points;
//   final Color color;
//   final double brushSize;

//   Stroke({required this.points, required this.color, required this.brushSize});
// }

// class Eraser {
//   final double size;

//   Eraser(this.size);

//   void erase(List<Stroke> strokes, Offset localPosition) {
//     for (var stroke in strokes) {
//       stroke.points.removeWhere((point) {
//         if (point != null) {
//           return point.dx >= localPosition.dx - size / 3 &&
//               point.dx <= localPosition.dx + size / 3 &&
//               point.dy >= localPosition.dy - size / 3 &&
//               point.dy <= localPosition.dy + size / 3;
//         }
//         return false;
//       });
//     }
//   }
// }
// // class Eraser {
// //   final double size;

// //   Eraser(this.size);

// //   void erase(List<Stroke> strokes, Offset localPosition) {
// //     final double radius = size / 2; // Calculate the radius of the eraser.

// //     for (var stroke in strokes) {
// //       stroke.points.removeWhere((point) {
// //         if (point != null) {
// //           // Calculate the distance between the point and the touch position.
// //           double distance = sqrt(pow(point.dx - localPosition.dx, 2) +
// //               pow(point.dy - localPosition.dy, 2));
// //           // Remove the point if it's within the radius of the eraser.
// //           return distance <= radius;
// //         }
// //         return false;
// //       });
// //     }
// //   }
// // }

// class Drawing1 extends StatefulWidget {
//   final String imagePath;

//   const Drawing1({Key? key, required this.imagePath}) : super(key: key);

//   @override
//   _Drawing1State createState() => _Drawing1State();
// }

// class _Drawing1State extends State<Drawing1> {
//   int _selectedBrushIndex = -1; // State to track selected brush
//   int _selectedPencilIndex = -1; // State to track selected pencil
//   double _selectedBrushSize = 5.0;
//   Color _selectedColor = Colors.black;
//   bool _isErasing = false;
//   bool _iscamera = false;
//   bool _restore = false;
//   Color selectedcolor = Colors.black;

//   bool _isBrushSelectorVisible = false;
//   bool _isBuiltBrushSelectorVisible = false;
//   bool _showAnimation = false;
//   bool _showDoneAnimation = false;
//   bool _isCameraSelected = false; // State for camera button selection
//   bool _isDeleteSelected = false;
//   bool _ispallete = false;
//   bool _iseraservisible = false;
//   // State for delete button selection

//   List<Stroke> _strokes = [];
//   final Eraser _eraser = Eraser(40.0);

//   ScreenshotController _screenshotController = ScreenshotController();

//   void _selectBrush(int index, Color color, double brushSize, double height) {
//     setState(() {
//       _selectedBrushIndex = index; // Select the brush
//       _selectedPencilIndex = -1; // Deselect any pencil
//       _selectedBrushSize = brushSize;
//       _selectedColor = selectedcolor;
//       _isErasing = false;
//       _isBrushSelectorVisible = false; // Hide brush selector after selecting
//       _isBuiltBrushSelectorVisible = false;
//       _iscamera = false;
//       _restore = false;
//       _isCameraSelected = false; // Reset camera button selection
//       _isDeleteSelected = false;
//       _iseraservisible = false;

//       // Reset delete button selection
//     });
//   }

//   void _selectPencil(int index, Color color, double brushSize) {
//     setState(() {
//       _selectedPencilIndex = index; // Select the pencil
//       _selectedBrushIndex = -1; // Deselect any brush
//       _selectedBrushSize = brushSize;
//       _selectedColor = color;
//       _isErasing = false;
//       selectedcolor = color;
//       _isBrushSelectorVisible = false; // Hide brush selector after selecting
//       _isBuiltBrushSelectorVisible = false;
//       _iscamera = false;
//       _restore = false;
//       _isCameraSelected = false; // Reset camera button selection
//       _isDeleteSelected = false;
//       _iseraservisible = false; // Reset delete button selection
//     });
//   }

//   // void _selecteraser(
//   //   int index,
//   //   double size,
//   //   double height,
//   // ) {
//   //   setState(() {
//   //     _isErasing = true;
//   //     _selectedBrushIndex = index;
//   //     _selectedBrushSize = size;
//   //     _isBrushSelectorVisible = false;
//   //     _isBuiltBrushSelectorVisible = false;
//   //     _iscamera = false;
//   //     _restore = false;
//   //     _iseraservisible = false;
//   //     _isCameraSelected = false;
//   //     _isDeleteSelected = false;
//   //   });
//   // }

//   void _selecteraser(int index, double size, double height) {
//     setState(() {
//       _isErasing = true;
//       _selectedBrushIndex = -1;
//       _selectedPencilIndex = -1;
//       // Deselect any selected brush
//       selectedcolor = Colors.black;
//       _selectedBrushSize = 10;
//       _isBrushSelectorVisible = false;
//       _isBuiltBrushSelectorVisible = false;
//       _iscamera = false;
//       _restore = false;
//       _iseraservisible = false;
//       _isCameraSelected = false;
//       _isDeleteSelected = false;
//     });
//   }

//   void _triggerAnimation() {
//     setState(() {
//       _showAnimation = true;
//     });

//     Future.delayed(Duration(seconds: 4), () {
//       setState(() {
//         _showAnimation = false;
//       });
//     });
//   }

//   void _triggerDoneAnimation() {
//     setState(() {
//       _showDoneAnimation = true;
//     });

//     Future.delayed(Duration(seconds: 2), () {
//       setState(() {
//         _showDoneAnimation = false;
//       });
//     });
//   }

//   Widget _buildBrushIcon(String imagePath, int index, Color color,
//       double brushSize, Color selectedcolor) {
//     bool isSelected = _selectedPencilIndex == index;
//     // Check if pencil is selected
//     selectedcolor = color;
//     double size = isSelected ? 45.0 : 30.0;

//     return IconButton(
//       onPressed: () {
//         _selectPencil(index, color, brushSize); // Select pencil
//       },
//       icon: Transform.scale(
//         scale: isSelected ? 1.2 : 1.0,
//         child: Image.asset(
//           imagePath,
//           height: size,
//           width: size,
//           color: selectedcolor,
//         ),
//       ),
//     );
//   }

//   Widget _buildBrushIcon1(String imagePath, int index, Color color,
//       double brushSize, double height) {
//     bool isSelected =
//         _selectedBrushIndex == index; // Check if brush is selected
//     double size = isSelected ? 45.0 : 30.0;

//     return IconButton(
//       onPressed: () {
//         _selectBrush(index, color, brushSize, size); // Select brush
//       },
//       icon: Transform.scale(
//         scale: isSelected ? 1.2 : 1.0,
//         child: Image.asset(
//           imagePath,
//           height: height,
//           width: height,
//         ),
//       ),
//     );
//   }

//   Widget _builderaser(
//       String imagepath, int index, double size, double height, double width) {
//     bool isSelected = _iseraservisible && _selectedBrushIndex == index;
//     // bool isSelected = _iseraservisible;

//     double iconSize = isSelected ? 45 : 30;
//     return IconButton(
//         onPressed: () {
//           _selecteraser(
//             index,
//             size,
//             height,
//           );
//         },
//         icon: Transform.scale(
//           scale: isSelected ? 1.2 : 1.0,
//           child: Image.asset(
//             imagepath,
//             height: height,
//             width: height,
//           ),
//         ));
//   }

//   @override
//   Widget build(BuildContext context) {
//     final screenwidth = MediaQuery.of(context).size.width;
//     final screenheight = MediaQuery.of(context).size.height;

//     return Screenshot(
//         controller: _screenshotController,
//         child: Scaffold(
//           appBar: AppBar(
//             backgroundColor: Colors.transparent,
//             toolbarHeight: 40,

//             // leading: GestureDetector(
//             //   onTap: () {
//             //     Navigator.push(
//             //       context,
//             //       MaterialPageRoute(builder: (context) => ImagesList()),
//             //     );
//             //   },
//             //   child: Lottie.asset(
//             //     'assets/svg/images/Animation - 1724844452205.json',
//             //     width: 40,
//             //     height: 40,
//             //   ),
//             // ),
//           ),
//           body: Stack(
//             children: [
//               // Positioned(
//               //   left: 2,
//               //   top: 120,
//               //   child: Container(
//               //     color: Colors
//               //         .transparent, // Make sure GestureDetector is visible
//               //     child: GestureDetector(
//               //       onTap: () {
//               //         print("GestureDetector tapped"); // Debugging statement
//               //         Navigator.push(
//               //           context,
//               //           MaterialPageRoute(
//               //               builder: (context) =>
//               //                   Mainhome()), // Ensure correct class name
//               //         );
//               //       },
//               //       child: Lottie.asset(
//               //         'assets/svg/images/Animation - 1725300877939.json',
//               //         height: 50,
//               //       ),
//               //     ),
//               //   ),
//               // ),

//               // Container(
//               //   child: IconButton(
//               //     icon: Icon(
//               //       Icons.home,
//               //     ),
//               //     iconSize: 35,
//               //     onPressed: () {
//               //       Navigator.push(context,
//               //           MaterialPageRoute(builder: (context) => Dashboard()));
//               //     },
//               //   ),
//               // ),

//               Padding(
//                 padding: const EdgeInsets.only(top: 30),
//                 child: Container(
//                   color: Colors
//                       .transparent, // Make sure GestureDetector is visible
//                   child: GestureDetector(
//                     onTap: () {
//                       print("GestureDetector tapped"); // Debugging statement
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) =>
//                                 Dashboard()), // Ensure correct class name
//                       );
//                     },
//                     child: Lottie.asset(
//                       'assets/svg/images/Animation - 1725299096595.json',
//                       height: 50,
//                     ),
//                   ),
//                 ),
//               ),
//               Row(
//                 children: [
//                   Expanded(
//                     child: Row(
//                       children: [
//                         Expanded(
//                           child: GestureDetector(
//                             onDoubleTap: () {
//                               _triggerAnimation();
//                             },
//                             onPanUpdate: (details) {
//                               setState(() {
//                                 if (_isErasing) {
//                                   _eraser.erase(
//                                       _strokes, details.localPosition);
//                                 } else {
//                                   _strokes.last.points
//                                       .add(details.localPosition);
//                                 }
//                               });
//                             },
//                             onPanStart: (details) {
//                               setState(() {
//                                 if (!_isErasing) {
//                                   _strokes.add(
//                                     Stroke(
//                                       points: [details.localPosition],
//                                       color: _selectedColor,
//                                       brushSize: _selectedBrushSize,
//                                     ),
//                                   );
//                                 }
//                               });
//                             },
//                             onPanEnd: (details) {
//                               setState(() {
//                                 if (!_isErasing) {
//                                   _strokes.last.points.add(null);
//                                 }
//                               });
//                             },
//                             child: Stack(
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.only(left: 35),
//                                   child: Container(
//                                     color: Colors.transparent,
//                                     width: 590,
//                                     child: Center(
//                                       child: Transform.scale(
//                                         scale: 1.85,
//                                         child: Padding(
//                                           padding:
//                                               const EdgeInsets.only(left: 20),
//                                           child: Image.asset(
//                                             widget.imagePath,
//                                             fit: BoxFit.contain,
//                                             width: screenwidth,
//                                             height: screenheight,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 CustomPaint(
//                                   painter: DrawingPainter(strokes: _strokes),
//                                 ),
//                                 if (_showAnimation)
//                                   Center(
//                                     child: Lottie.asset(
//                                       'assets/svg/images/Animation - 1724586878852.json',
//                                       width: 600,
//                                       height: 400,
//                                     ),
//                                   ),
//                                 if (_showDoneAnimation)
//                                   Center(
//                                     child: Lottie.asset(
//                                       'assets/svg/images/Animation - 1724586878852.json',
//                                       width: 600,
//                                       height: 400,
//                                     ),
//                                   ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         // Move button and selector to the left side

//                         if (_isBrushSelectorVisible)
//                           Container(
//                             width: 80.0,
//                             color: Color.fromARGB(255, 219, 214, 214),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 _buildBrushIcon1('assets/svg/images/brush.png',
//                                     0, Colors.transparent, 10.0, 20),
//                                 _buildBrushIcon1('assets/svg/images/brush.png',
//                                     1, Colors.transparent, 15.0, 30),
//                                 _buildBrushIcon1('assets/svg/images/brush.png',
//                                     2, Colors.transparent, 20.0, 35),
//                                 _buildBrushIcon1('assets/svg/images/brush.png',
//                                     3, Colors.transparent, 25.0, 40),
//                               ],
//                             ),
//                           ),

//                         // Built brush selector
//                         if (_isBuiltBrushSelectorVisible)
//                           // Adjust as needed
//                           Container(
//                             width: 80.0,
//                             color: Color.fromARGB(255, 219, 214, 214),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 _buildBrushIcon(
//                                   'assets/svg/images/pencil1.png',
//                                   0,
//                                   Colors.red[800]!,
//                                   _selectedBrushSize,
//                                   Colors.red[800]!,
//                                 ),
//                                 _buildBrushIcon(
//                                   'assets/svg/images/pencil2.png',
//                                   1,
//                                   Colors.blue[800]!,
//                                   _selectedBrushSize,
//                                   Colors.blue[800]!,
//                                 ),
//                                 _buildBrushIcon(
//                                   'assets/svg/images/pencil3.png',
//                                   2,
//                                   Colors.yellow[800]!,
//                                   _selectedBrushSize,
//                                   Colors.yellow[800]!,
//                                 ),
//                                 _buildBrushIcon(
//                                     'assets/svg/images/pencil4.png',
//                                     3,
//                                     Colors.green[800]!,
//                                     _selectedBrushSize,
//                                     Colors.green[800]!),
//                                 _buildBrushIcon(
//                                   'assets/svg/images/pencil5.png',
//                                   4,
//                                   Colors.purple[800]!,
//                                   _selectedBrushSize,
//                                   Colors.purple[800]!,
//                                 ),
//                               ],
//                             ),
//                           ),

//                         //built eraser option

//                         if (_iseraservisible)
//                           Container(
//                             width: 80,
//                             color: Color.fromARGB(255, 219, 214, 214),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 _builderaser('assets/svg/images/eraser.png', 1,
//                                     10, 20, 10),
//                                 _builderaser('assets/svg/images/eraser.png', 2,
//                                     30, 30, 10),
//                                 _builderaser('assets/svg/images/eraser.png', 3,
//                                     50, 35, 40),
//                               ],
//                             ),
//                           ),

//                         SizedBox(
//                           width: 10,
//                         ),

//                         // Positioned(
//                         //   right: 250,
//                         //   top: 0,
//                         //   child: Container(
//                         //     color: Colors
//                         //         .transparent, // Make sure GestureDetector is visible
//                         //     child: GestureDetector(
//                         //       onTap: () {
//                         //         print(
//                         //             "GestureDetector tapped"); // Debugging statement
//                         //         Navigator.push(
//                         //           context,
//                         //           MaterialPageRoute(
//                         //               builder: (context) =>
//                         //                   Mainhome()), // Ensure correct class name
//                         //         );
//                         //       },
//                         //       child: Lottie.asset(
//                         //         'assets/svg/images/Animation - 1725299096595.json',
//                         //         height: 50,
//                         //       ),
//                         //     ),
//                         //   ),
//                         // ),

//                         Container(
//                           width: 80.0,
//                           color: Color.fromARGB(255, 219, 214, 214),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               IconButton(
//                                 onPressed: () {
//                                   setState(() {
//                                     _isErasing = true;
//                                     _iseraservisible = true;

//                                     _isBrushSelectorVisible = false;
//                                     _isBuiltBrushSelectorVisible = false;
//                                     _isCameraSelected =
//                                         false; // Reset camera selection
//                                     _isDeleteSelected =
//                                         false; // Reset delete selection
//                                   });
//                                   //EraserScreen();
//                                 },
//                                 icon: Image.asset(
//                                   'assets/svg/images/eraser.png',
//                                   height: _isErasing ? 42 : 38,
//                                 ),
//                               ),
//                               SizedBox(height: 10),
//                               // IconButton(
//                               //   onPressed: () {
//                               //     setState(() {
//                               //       _isBuiltBrushSelectorVisible =
//                               //           !_isBuiltBrushSelectorVisible;
//                               //       _isBrushSelectorVisible =
//                               //           false; // Hide brush selector
//                               //       _isCameraSelected =
//                               //           false; // Reset camera selection
//                               //       _isDeleteSelected = false;
//                               //       _isErasing = false;
//                               //       _iseraservisible =
//                               //           false; // Reset delete selection
//                               //     });
//                               //   },
//                               //   icon: Image.asset(
//                               //     'assets/svg/images/pallete.png',
//                               //     height:
//                               //         _isBuiltBrushSelectorVisible ? 40 : 30,
//                               //   ),
//                               // ),
//                               // Container(
//                               //   child: CircleAvatar(
//                               //     backgroundColor: selectedcolor,
//                               //     child: IconButton(
//                               //       onPressed: () {
//                               //         setState(() {
//                               //           _isBuiltBrushSelectorVisible =
//                               //               !_isBuiltBrushSelectorVisible;
//                               //           _isBrushSelectorVisible =
//                               //               false; // Hide brush selector
//                               //           _isCameraSelected =
//                               //               false; // Reset camera selection
//                               //           _isDeleteSelected = false;
//                               //           _isErasing = false;
//                               //           _iseraservisible =
//                               //               false; // Reset delete selection
//                               //         });
//                               //       },
//                               //       icon: Image.asset(
//                               //         'assets/svg/images/pallete.png',
//                               //         height:
//                               //             _isBuiltBrushSelectorVisible ? 0 : 0,
//                               //       ),
//                               //     ),
//                               //   ),
//                               // ),

//                               Container(
//                                 child: IconButton(
//                                   onPressed: () {
//                                     setState(() {
//                                       _isBuiltBrushSelectorVisible =
//                                           !_isBuiltBrushSelectorVisible;
//                                       _isBrushSelectorVisible =
//                                           false; // Hide brush selector
//                                       _isCameraSelected =
//                                           false; // Reset camera selection
//                                       _isDeleteSelected = false;
//                                       _isErasing = false;
//                                       _iseraservisible =
//                                           false; // Reset delete selection
//                                     });
//                                   },
//                                   icon: Image.asset(
//                                     'assets/svg/images/pallete.png',
//                                     color: selectedcolor,
//                                     height:
//                                         _isBuiltBrushSelectorVisible ? 35 : 30,
//                                   ),
//                                 ),
//                               ),

//                               SizedBox(height: 10),
//                               IconButton(
//                                 onPressed: () {
//                                   setState(() {
//                                     _isBrushSelectorVisible =
//                                         !_isBrushSelectorVisible;
//                                     _isBuiltBrushSelectorVisible = false;
//                                     _iscamera = false;
//                                     _restore =
//                                         false; // Hide built brush selector
//                                     _isCameraSelected =
//                                         false; // Reset camera selection
//                                     _isDeleteSelected = false;
//                                     _isErasing = false;
//                                     _iseraservisible =
//                                         false; // Reset delete selection
//                                   });
//                                 },
//                                 icon: Image.asset(
//                                   'assets/svg/images/brush.png',
//                                   height: _isBrushSelectorVisible ? 40 : 30,
//                                 ),
//                               ),
//                               SizedBox(height: 10),
//                               IconButton(
//                                 onPressed: () async {
//                                   setState(() {
//                                     _isCameraSelected =
//                                         true; // Select camera button
//                                     _isDeleteSelected =
//                                         false; // Reset delete selection
//                                     _isErasing = false;
//                                     _isBrushSelectorVisible = false;
//                                     _isBuiltBrushSelectorVisible = false;
//                                   });
//                                   final image =
//                                       await _screenshotController.capture();
//                                   if (image == null) return;
//                                   await saveImage(image);
//                                 },
//                                 icon: Image.asset(
//                                   'assets/svg/images/camera.png',
//                                   width: 50,
//                                   height: _isCameraSelected
//                                       ? 40
//                                       : 30, // Adjust size
//                                 ),
//                               ),
//                               IconButton(
//                                 onPressed: () {
//                                   setState(() {
//                                     _strokes.clear();
//                                     _isDeleteSelected =
//                                         true; // Select delete button
//                                     _isCameraSelected =
//                                         false; // Reset camera selection
//                                     _isErasing = false;
//                                   });
//                                 },
//                                 icon: Image.asset(
//                                   'assets/svg/images/delete.png',
//                                   height: _isDeleteSelected
//                                       ? 40
//                                       : 30, // Adjust size
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(
//                           width: 10,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ));
//   }
// }

// Future<void> saveImage(Uint8List image) async {
//   final directory = await getExternalStorageDirectory();
//   final imagePath = '${directory!.path}/screenshot.png';
//   final result = await ImageGallerySaver.saveImage(image, quality: 80);
//   if (result['isSuccess']) {
//     Fluttertoast.showToast(msg: 'Image saved to gallery');
//   } else {
//     Fluttertoast.showToast(msg: 'Failed to save image');
//   }
// }

// class DrawingPainter extends CustomPainter {
//   final List<Stroke> strokes;

//   DrawingPainter({required this.strokes});

//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..style = PaintingStyle.stroke
//       ..strokeCap = StrokeCap.round;

//     for (var stroke in strokes) {
//       paint.color = stroke.color;
//       paint.strokeWidth = stroke.brushSize;

//       for (int i = 0; i < stroke.points.length - 1; i++) {
//         if (stroke.points[i] != null && stroke.points[i + 1] != null) {
//           canvas.drawLine(stroke.points[i]!, stroke.points[i + 1]!, paint);
//         } else if (stroke.points[i] != null) {
//           canvas.drawPoints(PointMode.points, [stroke.points[i]!], paint);
//         }
//       }
//     }
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }

// import 'dart:math';
// import 'dart:typed_data';
// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:gamingapp/brush.dart';
// import 'package:gamingapp/home.dart';
// import 'package:gamingapp/home1.dart';
// import 'package:gamingapp/mainhome.dart';
// import 'package:gamingapp/splash.dart';
// import 'package:image_gallery_saver/image_gallery_saver.dart';
// import 'package:lottie/lottie.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:screenshot/screenshot.dart';
// import 'package:gamingapp/mainhome.dart'; // Ensure this path is correct

// class Stroke {
//   final List<Offset?> points;
//   final Color color;
//   final double brushSize;

//   Stroke({required this.points, required this.color, required this.brushSize});
// }

// class Eraser {
//   final double size;

//   Eraser(this.size);

//   void erase(List<Stroke> strokes, Offset localPosition) {
//     for (var stroke in strokes) {
//       stroke.points.removeWhere((point) {
//         if (point != null) {
//           return point.dx >= localPosition.dx - size / 3 &&
//               point.dx <= localPosition.dx + size / 3 &&
//               point.dy >= localPosition.dy - size / 3 &&
//               point.dy <= localPosition.dy + size / 3;
//         }
//         return false;
//       });
//     }
//   }
// }
// // class Eraser {
// //   final double size;

// //   Eraser(this.size);

// //   void erase(List<Stroke> strokes, Offset localPosition) {
// //     final double radius = size / 2; // Calculate the radius of the eraser.

// //     for (var stroke in strokes) {
// //       stroke.points.removeWhere((point) {
// //         if (point != null) {
// //           // Calculate the distance between the point and the touch position.
// //           double distance = sqrt(pow(point.dx - localPosition.dx, 2) +
// //               pow(point.dy - localPosition.dy, 2));
// //           // Remove the point if it's within the radius of the eraser.
// //           return distance <= radius;
// //         }
// //         return false;
// //       });
// //     }
// //   }
// // }

// class Drawing1 extends StatefulWidget {
//   final String imagePath;

//   const Drawing1({Key? key, required this.imagePath}) : super(key: key);

//   @override
//   _Drawing1State createState() => _Drawing1State();
// }

// class _Drawing1State extends State<Drawing1> {
//   int _selectedBrushIndex = -1; // State to track selected brush
//   int _selectedPencilIndex = -1;
//   int _selectederaserindex = -1; // State to track selected pencil
//   double _selectedBrushSize = 5.0;
//   Color _selectedColor = Colors.black;
//   bool _isErasing = false;
//   bool _iscamera = false;
//   bool _restore = false;
//   Color selectedcolor = Colors.black;

//   bool _isBrushSelectorVisible = false;
//   bool _isBuiltBrushSelectorVisible = false;
//   bool _showAnimation = false;
//   bool _showDoneAnimation = false;
//   bool _isCameraSelected = false; // State for camera button selection
//   bool _isDeleteSelected = false;
//   bool _ispallete = false;
//   bool _iseraservisible = false;

//   // State for delete button selection

//   List<Stroke> _strokes = [];
//   final Eraser _eraser = Eraser(40.0);

//   ScreenshotController _screenshotController = ScreenshotController();

//   void _selectBrush(int index, Color color, double brushSize, double height) {
//     setState(() {
//       _selectedBrushIndex = index; // Select the brush
//       _selectedPencilIndex = -1; // Deselect any pencil
//       _selectedBrushSize = brushSize;

//       _selectedColor = selectedcolor;
//       _isErasing = false;
//       _isBrushSelectorVisible = false; // Hide brush selector after selecting
//       _isBuiltBrushSelectorVisible = false;
//       _iscamera = false;
//       _restore = false;
//       _isCameraSelected = false; // Reset camera button selection
//       _isDeleteSelected = false;
//       _iseraservisible = false;

//       // Reset delete button selection
//     });
//   }

//   void _selectPencil(int index, Color color, double brushSize) {
//     setState(() {
//       _selectedPencilIndex = index; // Select the pencil
//       _selectedBrushIndex = -1; // Deselect any brush
//       _selectedBrushSize = brushSize;
//       _selectedColor = color;
//       _isErasing = false;
//       selectedcolor = color;
//       _isBrushSelectorVisible = false; // Hide brush selector after selecting
//       _isBuiltBrushSelectorVisible = false;
//       _iscamera = false;
//       _restore = false;
//       _isCameraSelected = false; // Reset camera button selection
//       _isDeleteSelected = false;
//       _iseraservisible = false; // Reset delete button selection
//     });
//   }

//   // void _selecteraser(
//   //   int index,
//   //   double size,
//   //   double height,
//   // ) {
//   //   setState(() {
//   //     _isErasing = true;
//   //     _selectedBrushIndex = index;
//   //     _selectedBrushSize = size;
//   //     _isBrushSelectorVisible = false;
//   //     _isBuiltBrushSelectorVisible = false;
//   //     _iscamera = false;
//   //     _restore = false;
//   //     _iseraservisible = false;
//   //     _isCameraSelected = false;
//   //     _isDeleteSelected = false;
//   //   });
//   // }

//   void _selecteraser(int index, double size, double height) {
//     setState(() {
//       _isErasing = true;
//       _selectedBrushIndex = -1;
//       _selectedPencilIndex = -1;
//       _selectederaserindex = index;
//       // Deselect any selected brush
//       // selectedcolor = Colors.black;
//       _selectedBrushSize = 10;
//       _isBrushSelectorVisible = false;
//       _isBuiltBrushSelectorVisible = false;
//       _iscamera = false;
//       _restore = false;
//       _iseraservisible = false;
//       _isCameraSelected = false;
//       _isDeleteSelected = false;
//     });
//   }

//   void _triggerAnimation() {
//     setState(() {
//       _showAnimation = true;
//     });

//     Future.delayed(Duration(seconds: 4), () {
//       setState(() {
//         _showAnimation = false;
//       });
//     });
//   }

//   void _triggerDoneAnimation() {
//     setState(() {
//       _showDoneAnimation = true;
//     });

//     Future.delayed(Duration(seconds: 2), () {
//       setState(() {
//         _showDoneAnimation = false;
//       });
//     });
//   }

//   Widget _buildBrushIcon(String imagePath, int index, Color color,
//       double brushSize, Color selectedcolor) {
//     bool isSelected = _selectedPencilIndex == index;
//     // Check if pencil is selected
//     selectedcolor = color;
//     double size = isSelected ? 45 : 30.0;

//     return IconButton(
//       onPressed: () {
//         _selectPencil(index, color, brushSize); // Select pencil
//       },
//       icon: Transform.scale(
//         scale: isSelected ? 1.2 : 1.0,
//         child: Image.asset(
//           imagePath,
//           height: size,
//           width: size,
//           color: selectedcolor,
//         ),
//       ),
//     );
//   }

//   Widget _buildBrushIcon1(String imagePath, int index, Color color,
//       double brushSize, double height) {
//     bool isSelected =
//         _selectedBrushIndex == index; // Check if brush is selected
//     double size = isSelected ? 45.0 : 30.0;

//     return IconButton(
//       onPressed: () {
//         _selectBrush(index, color, brushSize, size); // Select brush
//       },
//       icon: Transform.scale(
//         scale: isSelected ? 1.2 : 1.0,
//         child: Image.asset(
//           imagePath,
//           height: height,
//           width: height,
//         ),
//       ),
//     );
//   }

//   Widget _builderaser(
//       String imagepath, int index, double size, double height, double width) {
//     bool isSelected = _iseraservisible && _selectedBrushIndex == index;

//     // bool isSelected = _iseraservisible;

//     double iconSize = isSelected ? 50 : 30;
//     return IconButton(
//         onPressed: () {
//           _selecteraser(
//             index,
//             size,
//             height,
//           );
//         },
//         icon: Transform.scale(
//           scale: isSelected ? 1.5 : 1.0,
//           child: Image.asset(
//             imagepath,
//             height: height,
//             width: height,
//           ),
//         ));
//   }

//   @override
//   Widget build(BuildContext context) {
//     final screenwidth = MediaQuery.of(context).size.width;
//     final screenheight = MediaQuery.of(context).size.height;

//     return Screenshot(
//         controller: _screenshotController,
//         child: Scaffold(
//           appBar: AppBar(
//             backgroundColor: Colors.transparent,
//             toolbarHeight: 40,

//             // leading: GestureDetector(
//             //   onTap: () {
//             //     Navigator.push(
//             //       context,
//             //       MaterialPageRoute(builder: (context) => ImagesList()),
//             //     );
//             //   },
//             //   child: Lottie.asset(
//             //     'assets/svg/images/Animation - 1724844452205.json',
//             //     width: 40,
//             //     height: 40,
//             //   ),
//             // ),
//           ),
//           body: Stack(
//             children: [
//               // Positioned(
//               //   left: 2,
//               //   top: 120,
//               //   child: Container(
//               //     color: Colors
//               //         .transparent, // Make sure GestureDetector is visible
//               //     child: GestureDetector(
//               //       onTap: () {
//               //         print("GestureDetector tapped"); // Debugging statement
//               //         Navigator.push(
//               //           context,
//               //           MaterialPageRoute(
//               //               builder: (context) =>
//               //                   Mainhome()), // Ensure correct class name
//               //         );
//               //       },
//               //       child: Lottie.asset(
//               //         'assets/svg/images/Animation - 1725300877939.json',
//               //         height: 50,
//               //       ),
//               //     ),
//               //   ),
//               // ),

//               // Container(
//               //   child: IconButton(
//               //     icon: Icon(
//               //       Icons.home,
//               //     ),
//               //     iconSize: 35,
//               //     onPressed: () {
//               //       Navigator.push(context,
//               //           MaterialPageRoute(builder: (context) => Dashboard()));
//               //     },
//               //   ),
//               // ),

//               Padding(
//                 padding: const EdgeInsets.only(top: 30),
//                 child: Container(
//                   color: Colors
//                       .transparent, // Make sure GestureDetector is visible
//                   child: GestureDetector(
//                     onTap: () {
//                       print("GestureDetector tapped"); // Debugging statement
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) =>
//                                 Dashboard()), // Ensure correct class name
//                       );
//                     },
//                     child: Lottie.asset(
//                       'assets/svg/images/Animation - 1725299096595.json',
//                       height: 50,
//                     ),
//                   ),
//                 ),
//               ),
//               Row(
//                 children: [
//                   Expanded(
//                     child: Row(
//                       children: [
//                         Expanded(
//                           child: GestureDetector(
//                             onDoubleTap: () {
//                               _triggerAnimation();
//                             },
//                             onPanUpdate: (details) {
//                               setState(() {
//                                 if (_isErasing) {
//                                   _eraser.erase(
//                                       _strokes, details.localPosition);
//                                 } else {
//                                   _strokes.last.points
//                                       .add(details.localPosition);
//                                 }
//                               });
//                             },
//                             onPanStart: (details) {
//                               setState(() {
//                                 if (!_isErasing) {
//                                   _strokes.add(
//                                     Stroke(
//                                       points: [details.localPosition],
//                                       color: _selectedColor,
//                                       brushSize: _selectedBrushSize,
//                                     ),
//                                   );
//                                 }
//                               });
//                             },
//                             onPanEnd: (details) {
//                               setState(() {
//                                 if (!_isErasing) {
//                                   _strokes.last.points.add(null);
//                                 }
//                               });
//                             },
//                             child: Stack(
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.only(left: 35),
//                                   child: Container(
//                                     color: Colors.transparent,
//                                     width: 590,
//                                     child: Center(
//                                       child: Transform.scale(
//                                         scale: 1.85,
//                                         child: Padding(
//                                           padding:
//                                               const EdgeInsets.only(left: 20),
//                                           child: Image.asset(
//                                             widget.imagePath,
//                                             fit: BoxFit.contain,
//                                             width: screenwidth,
//                                             height: screenheight,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 CustomPaint(
//                                   painter: DrawingPainter(strokes: _strokes),
//                                 ),
//                                 if (_showAnimation)
//                                   Center(
//                                     child: Lottie.asset(
//                                       'assets/svg/images/Animation - 1724586878852.json',
//                                       width: 600,
//                                       height: 400,
//                                     ),
//                                   ),
//                                 if (_showDoneAnimation)
//                                   Center(
//                                     child: Lottie.asset(
//                                       'assets/svg/images/Animation - 1724586878852.json',
//                                       width: 600,
//                                       height: 400,
//                                     ),
//                                   ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         // Move button and selector to the left side

//                         if (_isBrushSelectorVisible)
//                           Container(
//                             width: 80.0,
//                             height: screenheight / 2,
//                             color: Color.fromARGB(255, 219, 214, 214),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 _buildBrushIcon1('assets/svg/images/brush.png',
//                                     0, Colors.transparent, 10.0, 20),
//                                 _buildBrushIcon1('assets/svg/images/brush.png',
//                                     1, Colors.transparent, 15.0, 30),
//                                 _buildBrushIcon1('assets/svg/images/brush.png',
//                                     2, Colors.transparent, 20.0, 35),
//                                 _buildBrushIcon1('assets/svg/images/brush.png',
//                                     3, Colors.transparent, 25.0, 40),
//                               ],
//                             ),
//                           ),

//                         // Built brush selector
//                         if (_isBuiltBrushSelectorVisible)
//                           // Adjust as needed
//                           Container(
//                             width: 80.0,
//                             height: screenheight / 2,
//                             color: Color.fromARGB(255, 219, 214, 214),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 _buildBrushIcon(
//                                   'assets/svg/images/pencil1.png',
//                                   0,
//                                   Colors.red[800]!,
//                                   _selectedBrushSize,
//                                   Colors.red[800]!,
//                                 ),
//                                 _buildBrushIcon(
//                                   'assets/svg/images/pencil2.png',
//                                   1,
//                                   Colors.blue[800]!,
//                                   _selectedBrushSize,
//                                   Colors.blue[800]!,
//                                 ),
//                                 _buildBrushIcon(
//                                   'assets/svg/images/pencil3.png',
//                                   2,
//                                   Colors.yellow[800]!,
//                                   _selectedBrushSize,
//                                   Colors.yellow[800]!,
//                                 ),
//                                 _buildBrushIcon(
//                                     'assets/svg/images/pencil4.png',
//                                     3,
//                                     Colors.green[800]!,
//                                     _selectedBrushSize,
//                                     Colors.green[800]!),
//                                 _buildBrushIcon(
//                                   'assets/svg/images/pencil5.png',
//                                   4,
//                                   Colors.purple[800]!,
//                                   _selectedBrushSize,
//                                   Colors.purple[800]!,
//                                 ),
//                               ],
//                             ),
//                           ),

//                         //built eraser option

//                         if (_iseraservisible)
//                           Container(
//                             width: 80,
//                             height: screenheight / 3,
//                             color: Color.fromARGB(255, 219, 214, 214),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 _builderaser('assets/svg/images/eraser.png', 1,
//                                     10, 20, 10),
//                                 _builderaser('assets/svg/images/eraser.png', 2,
//                                     30, 30, 10),
//                                 _builderaser('assets/svg/images/eraser.png', 3,
//                                     50, 35, 40),
//                               ],
//                             ),
//                           ),

//                         SizedBox(
//                           width: 10,
//                         ),

//                         // Positioned(
//                         //   right: 250,
//                         //   top: 0,
//                         //   child: Container(
//                         //     color: Colors
//                         //         .transparent, // Make sure GestureDetector is visible
//                         //     child: GestureDetector(
//                         //       onTap: () {
//                         //         print(
//                         //             "GestureDetector tapped"); // Debugging statement
//                         //         Navigator.push(
//                         //           context,
//                         //           MaterialPageRoute(
//                         //               builder: (context) =>
//                         //                   Mainhome()), // Ensure correct class name
//                         //         );
//                         //       },
//                         //       child: Lottie.asset(
//                         //         'assets/svg/images/Animation - 1725299096595.json',
//                         //         height: 50,
//                         //       ),
//                         //     ),
//                         //   ),
//                         // ),

//                         Container(
//                           width: 80.0,
//                           color: Color.fromARGB(255, 219, 214, 214),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               IconButton(
//                                 onPressed: () {
//                                   setState(() {
//                                     _isErasing = true;
//                                     _iseraservisible = true;

//                                     _isBrushSelectorVisible = false;
//                                     _isBuiltBrushSelectorVisible = false;
//                                     _isCameraSelected =
//                                         false; // Reset camera selection
//                                     _isDeleteSelected =
//                                         false; // Reset delete selection
//                                   });
//                                   //EraserScreen();
//                                 },
//                                 icon: Image.asset(
//                                   'assets/svg/images/eraser.png',
//                                   height: _isErasing ? 42 : 38,
//                                 ),
//                               ),
//                               SizedBox(height: 10),
//                               // IconButton(
//                               //   onPressed: () {
//                               //     setState(() {
//                               //       _isBuiltBrushSelectorVisible =
//                               //           !_isBuiltBrushSelectorVisible;
//                               //       _isBrushSelectorVisible =
//                               //           false; // Hide brush selector
//                               //       _isCameraSelected =
//                               //           false; // Reset camera selection
//                               //       _isDeleteSelected = false;
//                               //       _isErasing = false;
//                               //       _iseraservisible =
//                               //           false; // Reset delete selection
//                               //     });
//                               //   },
//                               //   icon: Image.asset(
//                               //     'assets/svg/images/pallete.png',
//                               //     height:
//                               //         _isBuiltBrushSelectorVisible ? 40 : 30,
//                               //   ),
//                               // ),
//                               // Container(
//                               //   child: CircleAvatar(
//                               //     backgroundColor: selectedcolor,
//                               //     child: IconButton(
//                               //       onPressed: () {
//                               //         setState(() {
//                               //           _isBuiltBrushSelectorVisible =
//                               //               !_isBuiltBrushSelectorVisible;
//                               //           _isBrushSelectorVisible =
//                               //               false; // Hide brush selector
//                               //           _isCameraSelected =
//                               //               false; // Reset camera selection
//                               //           _isDeleteSelected = false;
//                               //           _isErasing = false;
//                               //           _iseraservisible =
//                               //               false; // Reset delete selection
//                               //         });
//                               //       },
//                               //       icon: Image.asset(
//                               //         'assets/svg/images/pallete.png',
//                               //         height:
//                               //             _isBuiltBrushSelectorVisible ? 0 : 0,
//                               //       ),
//                               //     ),
//                               //   ),
//                               // ),

//                               Container(
//                                 child: IconButton(
//                                   onPressed: () {
//                                     setState(() {
//                                       _isBuiltBrushSelectorVisible =
//                                           !_isBuiltBrushSelectorVisible;
//                                       _isBrushSelectorVisible =
//                                           false; // Hide brush selector
//                                       _isCameraSelected =
//                                           false; // Reset camera selection
//                                       _isDeleteSelected = false;
//                                       _isErasing = false;
//                                       _iseraservisible =
//                                           false; // Reset delete selection
//                                     });
//                                   },
//                                   icon: Image.asset(
//                                     'assets/svg/images/pallete.png',
//                                     color: selectedcolor,
//                                     height:
//                                         _isBuiltBrushSelectorVisible ? 35 : 30,
//                                   ),
//                                 ),
//                               ),

//                               SizedBox(height: 10),
//                               IconButton(
//                                 onPressed: () {
//                                   setState(() {
//                                     _isBrushSelectorVisible =
//                                         !_isBrushSelectorVisible;
//                                     _isBuiltBrushSelectorVisible = false;
//                                     _iscamera = false;
//                                     _restore =
//                                         false; // Hide built brush selector
//                                     _isCameraSelected =
//                                         false; // Reset camera selection
//                                     _isDeleteSelected = false;
//                                     _isErasing = false;
//                                     _iseraservisible =
//                                         false; // Reset delete selection
//                                   });
//                                 },
//                                 icon: Image.asset(
//                                   'assets/svg/images/brush.png',
//                                   height: _isBrushSelectorVisible ? 40 : 30,
//                                 ),
//                               ),
//                               SizedBox(height: 10),
//                               IconButton(
//                                 onPressed: () async {
//                                   setState(() {
//                                     _isCameraSelected =
//                                         true; // Select camera button
//                                     _isDeleteSelected =
//                                         false; // Reset delete selection
//                                     _isErasing = false;
//                                     _isBrushSelectorVisible = false;
//                                     _isBuiltBrushSelectorVisible = false;
//                                   });
//                                   final image =
//                                       await _screenshotController.capture();
//                                   if (image == null) return;
//                                   await saveImage(image);
//                                 },
//                                 icon: Image.asset(
//                                   'assets/svg/images/camera.png',
//                                   width: 50,
//                                   height: _isCameraSelected
//                                       ? 40
//                                       : 30, // Adjust size
//                                 ),
//                               ),
//                               IconButton(
//                                 onPressed: () {
//                                   setState(() {
//                                     _strokes.clear();
//                                     _isDeleteSelected =
//                                         true; // Select delete button
//                                     _isCameraSelected =
//                                         false; // Reset camera selection
//                                     _isErasing = false;
//                                   });
//                                 },
//                                 icon: Image.asset(
//                                   'assets/svg/images/delete.png',
//                                   height: _isDeleteSelected
//                                       ? 40
//                                       : 30, // Adjust size
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(
//                           width: 10,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ));
//   }
// }

// Future<void> saveImage(Uint8List image) async {
//   final directory = await getExternalStorageDirectory();
//   final imagePath = '${directory!.path}/screenshot.png';
//   final result = await ImageGallerySaver.saveImage(image, quality: 80);
//   if (result['isSuccess']) {
//     Fluttertoast.showToast(msg: 'Image saved to gallery');
//   } else {
//     Fluttertoast.showToast(msg: 'Failed to save image');
//   }
// }

// class DrawingPainter extends CustomPainter {
//   final List<Stroke> strokes;

//   DrawingPainter({required this.strokes});

//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..style = PaintingStyle.stroke
//       ..strokeCap = StrokeCap.round;

//     for (var stroke in strokes) {
//       paint.color = stroke.color;
//       paint.strokeWidth = stroke.brushSize;

//       for (int i = 0; i < stroke.points.length - 1; i++) {
//         if (stroke.points[i] != null && stroke.points[i + 1] != null) {
//           canvas.drawLine(stroke.points[i]!, stroke.points[i + 1]!, paint);
//         } else if (stroke.points[i] != null) {
//           canvas.drawPoints(PointMode.points, [stroke.points[i]!], paint);
//         }
//       }
//     }
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }

import 'dart:math';
import 'dart:typed_data';
import 'dart:convert'; // Import for JSON encoding and decoding
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gamingapp/brush.dart';
import 'package:gamingapp/home.dart';
import 'package:gamingapp/home1.dart';
import 'package:gamingapp/mainhome.dart';
import 'package:gamingapp/splash.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:lottie/lottie.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';
import 'package:gamingapp/mainhome.dart'; // Ensure this path is correct
import 'package:hive/hive.dart'; // Import Hive
import 'package:hive_flutter/hive_flutter.dart'; // Import Hive Flutter

class Stroke {
  final List<Offset?> points;
  final Color color;
  final double brushSize;

  Stroke({required this.points, required this.color, required this.brushSize});
}

class Eraser {
  final double size;

  Eraser(this.size);

  void erase(List<Stroke> strokes, Offset localPosition) {
    for (var stroke in strokes) {
      stroke.points.removeWhere((point) {
        if (point != null) {
          return point.dx >= localPosition.dx - size / 3 &&
              point.dx <= localPosition.dx + size / 3 &&
              point.dy >= localPosition.dy - size / 3 &&
              point.dy <= localPosition.dy + size / 3;
        }
        return false;
      });
    }
  }
}

class Drawing1 extends StatefulWidget {
  final String imagePath;

  const Drawing1({super.key, required this.imagePath});

  @override
  _Drawing1State createState() => _Drawing1State();
}

class _Drawing1State extends State<Drawing1> {
  int _selectedBrushIndex = -1;
  int _selectedPencilIndex = -1;
  int _selectederaserindex = -1;
  double _selectedBrushSize = 5.0;
  Color _selectedColor = Colors.black;
  bool _isErasing = false;
  bool _iscamera = false;
  bool _restore = false;
  Color selectedcolor = Colors.black;

  bool _isBrushSelectorVisible = false;
  bool _isBuiltBrushSelectorVisible = false;
  bool _showAnimation = false;
  bool _showDoneAnimation = false;
  bool _isCameraSelected = false;
  bool _isDeleteSelected = false;
  final bool _ispallete = false;
  bool _iseraservisible = false;

  List<Stroke> _strokes = [];
  final Eraser _eraser = Eraser(40.0);
  final ScreenshotController _screenshotController = ScreenshotController();

  @override
  void initState() {
    super.initState();
    initBannerAd();
    _loadDrawingData(); // Load drawing data when the widget is initialized
  }

  void _loadDrawingData() async {
    final box = await Hive.openBox('drawing_data');
    final savedStrokes = box.get('strokes', defaultValue: []);

    setState(() {
      _strokes = (savedStrokes as List).map((strokeData) {
        final points = (strokeData['points'] as List)
            .map((point) =>
                point != null ? Offset(point['dx'], point['dy']) : null)
            .toList();
        return Stroke(
          points: points,
          color: Color(strokeData['color']),
          brushSize: strokeData['brushSize'],
        );
      }).toList();
    });
  }

  void _saveDrawingData() async {
    final box = await Hive.openBox('drawing_data');
    final strokeData = _strokes.map((stroke) {
      return {
        'points': stroke.points
            .map((point) =>
                point != null ? {'dx': point.dx, 'dy': point.dy} : null)
            .toList(),
        'color': stroke.color.value,
        'brushSize': stroke.brushSize,
      };
    }).toList();

    await box.put('strokes', strokeData); // Save the strokes data to Hive
  }

  void _selectBrush(int index, Color color, double brushSize, double height) {
    setState(() {
      _selectedBrushIndex = index;
      _selectedPencilIndex = -1;
      _selectederaserindex = -1;
      _selectedBrushSize = brushSize;
      _selectedColor = selectedcolor;
      _isErasing = false;
      _isBrushSelectorVisible = false;
      _isBuiltBrushSelectorVisible = false;
      _iscamera = false;
      _restore = false;
      _isCameraSelected = false;
      _isDeleteSelected = false;
      _iseraservisible = false;
    });
  }

  void _selectPencil(int index, Color color, double brushSize) {
    setState(() {
      _selectedPencilIndex = index;
      _selectedBrushIndex = -1;
      _selectedBrushSize = brushSize;
      _selectederaserindex = -1;
      _selectedColor = color;
      _isErasing = false;
      selectedcolor = color;
      _isBrushSelectorVisible = false;
      _isBuiltBrushSelectorVisible = false;
      _iscamera = false;
      _restore = false;
      _isCameraSelected = false;
      _isDeleteSelected = false;
      _iseraservisible = false;
    });
  }

  void _selecteraser(int index, double size, double height) {
    setState(() {
      _isErasing = true;
      _selectedBrushIndex = -1;
      _selectedPencilIndex = -1;
      _selectederaserindex = index;
      _selectedBrushSize = 10; // Set the selected eraser size
      _isBrushSelectorVisible = false;
      _isBuiltBrushSelectorVisible = false;
      _iscamera = false;
      _restore = false;
      _iseraservisible = false;
      _isCameraSelected = false;
      _isDeleteSelected = false;
    });
  }

  void _triggerAnimation() {
    setState(() {
      _showAnimation = true;
    });

    Future.delayed(const Duration(seconds: 4), () {
      setState(() {
        _showAnimation = false;
      });
    });
  }

  void _triggerDoneAnimation() {
    setState(() {
      _showDoneAnimation = true;
    });

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _showDoneAnimation = false;
      });
    });
  }

  void _onPanUpdate(DragUpdateDetails details) {
    setState(() {
      if (_isErasing) {
        _eraser.erase(_strokes, details.localPosition);
      } else {
        _strokes.last.points.add(details.localPosition);
      }
      _saveDrawingData(); // Save drawing data after each stroke
    });
  }

  void _onPanEnd(DragEndDetails details) {
    setState(() {
      if (!_isErasing) {
        _strokes.last.points.add(null);
      }
      _saveDrawingData(); // Save drawing data after each stroke
    });
  }

  Widget _buildBrushIcon(String imagePath, int index, Color color,
      double brushSize, Color selectedcolor) {
    bool isSelected = _selectedPencilIndex == index;
    selectedcolor = color;
    double size = isSelected ? 45 : 30.0;

    return IconButton(
      onPressed: () {
        _selectPencil(index, color, brushSize);
      },
      icon: Transform.scale(
        scale: isSelected ? 1.2 : 1.0,
        child: Image.asset(
          imagePath,
          height: size,
          width: size,
          color: selectedcolor,
        ),
      ),
    );
  }

  Widget _buildBrushIcon1(String imagePath, int index, Color color,
      double brushSize, double height) {
    bool isSelected = _selectedBrushIndex == index;
    double size = isSelected ? 45.0 : 30.0;

    return IconButton(
      onPressed: () {
        _selectBrush(index, color, brushSize, size);
      },
      icon: Transform.scale(
        scale: isSelected ? 1.2 : 1.0,
        child: Image.asset(
          imagePath,
          height: height,
          width: height,
        ),
      ),
    );
  }

  Widget _builderaser(
      String imagepath, int index, double size, double height, double width) {
    bool isSelected = _iseraservisible &&
        _selectederaserindex == index; // Update the check for selected eraser

    double iconSize = isSelected ? 45 : 30;
    return IconButton(
        onPressed: () {
          _selecteraser(
            index,
            size,
            height,
          );
        },
        icon: Transform.scale(
          scale: isSelected ? 1.2 : 1.0,
          child: Image.asset(
            imagepath,
            height: iconSize,
            width: iconSize,
          ),
        ));
  }

  late BannerAd bannerad;
  bool isAdloaded = false;
  initBannerAd() {
    bannerad = BannerAd(
        size: AdSize.banner,
        adUnitId: "ca-app-pub-5273856903887559/5807218928",
        // adUnitId: "ca-app-pub-3940256099942544/9214589741",
        listener: BannerAdListener(
          onAdLoaded: (ad) {
            setState(() {
              isAdloaded = true;
            });
          },
          onAdFailedToLoad: (ad, error) {
            ad.dispose();
            isAdloaded = false;
            print(error);
          },
        ),
        request: const AdRequest());
    bannerad.load();
  }

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;

    return Screenshot(
        controller: _screenshotController,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            toolbarHeight:
                isAdloaded ? 50 : 40, // Increase height to accommodate the ad
            title: Column(
              children: [
                // Replace with your app's title or any widget
                if (isAdloaded)
                  SizedBox(
                    height: bannerad.size.height.toDouble(),
                    // width: double.infinity,
                    //width: bannerad.size.width.toDouble(),
                    child: AdWidget(ad: bannerad),
                  ),
              ],
            ),
          ),
          // appBar: AppBar(
          //   backgroundColor: Colors.transparent,
          //   toolbarHeight: 40,
          // ),
          // bottomNavigationBar: isAdloaded
          //     ? SizedBox(
          //         height: bannerad.size.height.toDouble(),
          //         width: bannerad.size.width.toDouble(),
          //         child: AdWidget(ad: bannerad),
          //       )
          //     : SizedBox(),
          body: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Container(
                  color: Colors.transparent,
                  child: GestureDetector(
                    onTap: () {
                      print("GestureDetector tapped");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Dashboard()),
                      );
                    },
                    child: Lottie.asset(
                      'assets/svg/images/Animation - 1725299096595.json',
                      height: 50,
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onDoubleTap: () {
                              _triggerAnimation();
                            },
                            onPanUpdate: _onPanUpdate,
                            onPanEnd: _onPanEnd,
                            onPanStart: (details) {
                              setState(() {
                                if (!_isErasing) {
                                  _strokes.add(
                                    Stroke(
                                      points: [details.localPosition],
                                      color: _selectedColor,
                                      brushSize: _selectedBrushSize,
                                    ),
                                  );
                                }
                              });
                            },
                            child: Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 35),
                                  child: Container(
                                    color: Colors.transparent,
                                    width: 590,
                                    child: Center(
                                      child: Transform.scale(
                                        scale: 1.85,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20),
                                          child: Image.asset(
                                            widget.imagePath,
                                            fit: BoxFit.contain,
                                            width: screenwidth,
                                            height: screenheight,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                CustomPaint(
                                  painter: DrawingPainter(strokes: _strokes),
                                ),
                                if (_showAnimation)
                                  Center(
                                    child: Lottie.asset(
                                      'assets/svg/images/Animation - 1724586878852.json',
                                      width: 600,
                                      height: 400,
                                    ),
                                  ),
                                if (_showDoneAnimation)
                                  Center(
                                    child: Lottie.asset(
                                      'assets/svg/images/Animation - 1724586878852.json',
                                      width: 600,
                                      height: 400,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        if (_isBrushSelectorVisible)
                          Container(
                            width: 80.0,
                            height: screenheight,
                            color: const Color.fromARGB(255, 219, 214, 214),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _buildBrushIcon1('assets/svg/images/brush.png',
                                    0, Colors.transparent, 10.0, 20),
                                _buildBrushIcon1('assets/svg/images/brush.png',
                                    1, Colors.transparent, 15.0, 30),
                                _buildBrushIcon1('assets/svg/images/brush.png',
                                    2, Colors.transparent, 20.0, 35),
                                _buildBrushIcon1('assets/svg/images/brush.png',
                                    3, Colors.transparent, 25.0, 40),
                              ],
                            ),
                          ),
                        if (_isBuiltBrushSelectorVisible)
                          Container(
                            width: 80.0,
                            height: screenheight,
                            color: const Color.fromARGB(255, 219, 214, 214),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _buildBrushIcon(
                                  'assets/svg/images/pencil1.png',
                                  0,
                                  Colors.red[800]!,
                                  _selectedBrushSize,
                                  Colors.red[800]!,
                                ),
                                _buildBrushIcon(
                                  'assets/svg/images/pencil2.png',
                                  1,
                                  Colors.blue[800]!,
                                  _selectedBrushSize,
                                  Colors.blue[800]!,
                                ),
                                _buildBrushIcon(
                                  'assets/svg/images/pencil3.png',
                                  2,
                                  Colors.yellow[800]!,
                                  _selectedBrushSize,
                                  Colors.yellow[800]!,
                                ),
                                _buildBrushIcon(
                                  'assets/svg/images/pencil4.png',
                                  3,
                                  Colors.green[800]!,
                                  _selectedBrushSize,
                                  Colors.green[800]!,
                                ),
                                _buildBrushIcon(
                                  'assets/svg/images/pencil5.png',
                                  4,
                                  Colors.purple[800]!,
                                  _selectedBrushSize,
                                  Colors.purple[800]!,
                                ),
                              ],
                            ),
                          ),
                        if (_iseraservisible)
                          Container(
                            width: 80,
                            height: screenheight / 2,
                            color: const Color.fromARGB(255, 219, 214, 214),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _builderaser('assets/svg/images/eraser.png', 1,
                                    10, 20, 10),
                                _builderaser('assets/svg/images/eraser.png', 2,
                                    30, 30, 10),
                                _builderaser('assets/svg/images/eraser.png', 3,
                                    50, 35, 40),
                              ],
                            ),
                          ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 80.0,
                          color: const Color.fromARGB(255, 219, 214, 214),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isErasing = true;
                                    _iseraservisible = true;
                                    _isBrushSelectorVisible = false;
                                    _isBuiltBrushSelectorVisible = false;
                                    _isCameraSelected = false;
                                    _isDeleteSelected = false;
                                  });
                                },
                                icon: Image.asset(
                                  'assets/svg/images/eraser.png',
                                  height: _isErasing ? 42 : 38,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _isBuiltBrushSelectorVisible =
                                          !_isBuiltBrushSelectorVisible;
                                      _isBrushSelectorVisible = false;
                                      _isCameraSelected = false;
                                      _isDeleteSelected = false;
                                      _isErasing = false;
                                      _iseraservisible = false;
                                    });
                                  },
                                  icon: Image.asset(
                                    'assets/svg/images/pallete.png',
                                    color: selectedcolor,
                                    height:
                                        _isBuiltBrushSelectorVisible ? 35 : 30,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isBrushSelectorVisible =
                                        !_isBrushSelectorVisible;
                                    _isBuiltBrushSelectorVisible = false;
                                    _iscamera = false;
                                    _restore = false;
                                    _isCameraSelected = false;
                                    _isDeleteSelected = false;
                                    _isErasing = false;
                                    _iseraservisible = false;
                                  });
                                },
                                icon: Image.asset(
                                  'assets/svg/images/brush.png',
                                  height: _isBrushSelectorVisible ? 40 : 30,
                                ),
                              ),
                              const SizedBox(height: 10),
                              IconButton(
                                onPressed: () async {
                                  setState(() {
                                    _isCameraSelected = true;
                                    _isDeleteSelected = false;
                                    _isErasing = false;
                                    _isBrushSelectorVisible = false;
                                    _isBuiltBrushSelectorVisible = false;
                                  });
                                  final image =
                                      await _screenshotController.capture();
                                  if (image == null) return;
                                  await saveImage(image);
                                },
                                icon: Image.asset(
                                  'assets/svg/images/camera.png',
                                  width: 50,
                                  height: _isCameraSelected ? 40 : 30,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    _strokes.clear();
                                    _isDeleteSelected = true;
                                    _isCameraSelected = false;
                                    _isErasing = false;
                                    _saveDrawingData(); // Save state after clearing
                                  });
                                },
                                icon: Image.asset(
                                  'assets/svg/images/delete.png',
                                  height: _isDeleteSelected ? 40 : 30,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}

Future<void> saveImage(Uint8List image) async {
  final directory = await getExternalStorageDirectory();
  final imagePath = '${directory!.path}/screenshot.png';
  final result = await ImageGallerySaver.saveImage(image, quality: 80);
  if (result['isSuccess']) {
    Fluttertoast.showToast(msg: 'Image saved to gallery');
  } else {
    Fluttertoast.showToast(msg: 'Failed to save image');
  }
}

class DrawingPainter extends CustomPainter {
  final List<Stroke> strokes;

  DrawingPainter({required this.strokes});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    for (var stroke in strokes) {
      paint.color = stroke.color;
      paint.strokeWidth = stroke.brushSize;

      for (int i = 0; i < stroke.points.length - 1; i++) {
        if (stroke.points[i] != null && stroke.points[i + 1] != null) {
          canvas.drawLine(stroke.points[i]!, stroke.points[i + 1]!, paint);
        } else if (stroke.points[i] != null) {
          canvas.drawPoints(PointMode.points, [stroke.points[i]!], paint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
