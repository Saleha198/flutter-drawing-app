// // import 'package:flutter/material.dart';

// // class ComposedImage extends StatelessWidget {
// //   final String chunk1Path;
// //   final String chunk2Path;
// //   final String chunk3Path;
// //   final double imageSize; // Dynamic size for the image container

// //   const ComposedImage({
// //     super.key,
// //     required this.chunk1Path,
// //     required this.chunk2Path,
// //     required this.chunk3Path,
// //     required this.imageSize, // Pass dynamic size
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       width: imageSize / 2, // Use dynamic width
// //       height: imageSize / 4, // Adjust height based on imageSize
// //       child: Row(
// //         mainAxisAlignment: MainAxisAlignment.center,
// //         children: [
// //           Expanded(
// //             child: Image.asset(
// //               chunk1Path,
// //               fit: BoxFit.cover,
// //             ),
// //           ),
// //           Expanded(
// //             child: Image.asset(
// //               chunk2Path,
// //               fit: BoxFit.cover,
// //             ),
// //           ),
// //           Expanded(
// //             child: Image.asset(
// //               chunk3Path,
// //               fit: BoxFit.cover,
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';

// class ComposedImage extends StatefulWidget {
//   final String chunk1Path;
//   final String chunk2Path;
//   final String chunk3Path;
//   final double imageSize;

//   const ComposedImage({
//     super.key,
//     required this.chunk1Path,
//     required this.chunk2Path,
//     required this.chunk3Path,
//     required this.imageSize,
//   });

//   @override
//   _ComposedImageState createState() => _ComposedImageState();
// }

// class _ComposedImageState extends State<ComposedImage> {
//   ValueNotifier<Color> _chunk1Color = ValueNotifier<Color>(Colors.transparent);
//   ValueNotifier<Color> _chunk2Color = ValueNotifier<Color>(Colors.transparent);
//   ValueNotifier<Color> _chunk3Color = ValueNotifier<Color>(Colors.transparent);

//   void fillChunk(int chunkIndex, Color color) {
//     switch (chunkIndex) {
//       case 1:
//         _chunk1Color.value = color;
//         break;
//       case 2:
//         _chunk2Color.value = color;
//         break;
//       case 3:
//         _chunk3Color.value = color;
//         break;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: widget.imageSize / 2,
//       height: widget.imageSize / 4,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Expanded(
//             child: ValueListenableBuilder<Color>(
//               valueListenable: _chunk1Color,
//               builder: (context, color, child) {
//                 return Container(
//                   color: color,
//                   child: Image.asset(
//                     widget.chunk1Path,
//                     fit: BoxFit.cover,
//                   ),
//                 );
//               },
//             ),
//           ),
//           Expanded(
//             child: ValueListenableBuilder<Color>(
//               valueListenable: _chunk2Color,
//               builder: (context, color, child) {
//                 return Container(
//                   color: color,
//                   child: Image.asset(
//                     widget.chunk2Path,
//                     fit: BoxFit.cover,
//                   ),
//                 );
//               },
//             ),
//           ),
//           Expanded(
//             child: ValueListenableBuilder<Color>(
//               valueListenable: _chunk3Color,
//               builder: (context, color, child) {
//                 return Container(
//                   color: color,
//                   child: Image.asset(
//                     widget.chunk3Path,
//                     fit: BoxFit.cover,
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//new
// import 'package:flutter/material.dart';

// class ComposedImage extends StatefulWidget {
//   final String chunk1Path;
//   final String chunk2Path;
//   final String chunk3Path;
//   final String chunk4Path;
//   final String chunk5Path;
//   final double imageSize;
//   final List<Color> chunkColors; // List of colors for each chunk
//   final Function(int)
//       onChunkTap; // Callback function to notify which chunk is tapped

//   const ComposedImage({
//     super.key,
//     required this.chunk1Path,
//     required this.chunk2Path,
//     required this.chunk3Path,
//     required this.chunk4Path,
//     required this.chunk5Path,
//     required this.imageSize,
//     required this.chunkColors,
//     required this.onChunkTap, // Callback function
//   });

//   @override
//   _ComposedImageState createState() => _ComposedImageState();
// }

// class _ComposedImageState extends State<ComposedImage> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: widget.imageSize / 2,
//       height: widget.imageSize / 4,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Expanded(
//             child: GestureDetector(
//               onTap: () {
//                 widget.onChunkTap(0); // Notify parent about chunk 1 tap
//               },
//               child: ColorFiltered(
//                 colorFilter: ColorFilter.mode(
//                   widget.chunkColors[0].withOpacity(0.5),
//                   BlendMode.srcATop,
//                 ),
//                 child: Image.asset(
//                   widget.chunk1Path,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             child: GestureDetector(
//               onTap: () {
//                 widget.onChunkTap(1); // Notify parent about chunk 2 tap
//               },
//               child: ColorFiltered(
//                 colorFilter: ColorFilter.mode(
//                   widget.chunkColors[1].withOpacity(0.5),
//                   BlendMode.srcATop,
//                 ),
//                 child: Image.asset(
//                   widget.chunk2Path,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             child: GestureDetector(
//               onTap: () {
//                 widget.onChunkTap(2); // Notify parent about chunk 3 tap
//               },
//               child: ColorFiltered(
//                 colorFilter: ColorFilter.mode(
//                   widget.chunkColors[2].withOpacity(0.5),
//                   BlendMode.srcATop,
//                 ),
//                 child: Image.asset(
//                   widget.chunk3Path,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             child: GestureDetector(
//               onTap: () {
//                 widget.onChunkTap(3); // Notify parent about chunk 3 tap
//               },
//               child: ColorFiltered(
//                 colorFilter: ColorFilter.mode(
//                   widget.chunkColors[2].withOpacity(0.5),
//                   BlendMode.srcATop,
//                 ),
//                 child: Image.asset(
//                   widget.chunk3Path,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             child: GestureDetector(
//               onTap: () {
//                 widget.onChunkTap(2); // Notify parent about chunk 3 tap
//               },
//               child: ColorFiltered(
//                 colorFilter: ColorFilter.mode(
//                   widget.chunkColors[4].withOpacity(0.5),
//                   BlendMode.srcATop,
//                 ),
//                 child: Image.asset(
//                   widget.chunk3Path,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
///nnew
// import 'package:flutter/material.dart';

// class ComposedImage extends StatefulWidget {
//   final String chunk1Path;
//   final String chunk2Path;
//   final String chunk3Path;
//   final String chunk4Path;
//   final String chunk5Path;
//   final double imageSize;
//   final List<Color> chunkColors; // List of colors for each chunk
//   final Function(int)
//       onChunkTap; // Callback function to notify which chunk is tapped

//   const ComposedImage({
//     super.key,
//     required this.chunk1Path,
//     required this.chunk2Path,
//     required this.chunk3Path,
//     required this.chunk4Path,
//     required this.chunk5Path,
//     required this.imageSize,
//     required this.chunkColors,
//     required this.onChunkTap, // Callback function
//   });

//   @override
//   _ComposedImageState createState() => _ComposedImageState();
// }

// class _ComposedImageState extends State<ComposedImage> {
//   @override
//   Widget build(BuildContext context) {
//     final screenSize = MediaQuery.of(context).size;
//     final isLandscape = screenSize.width > screenSize.height;

//     // Adjust dimensions based on orientation
//     final imageWidth =
//         isLandscape ? screenSize.width * 0.4 / 2 : screenSize.width;
//     final imageHeight = isLandscape
//         ? screenSize.height * 0.0
//         : screenSize.height * 0.6; // Adjusted height for landscape

//     return Container(
//       width: imageWidth,
//       height: imageHeight,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: List.generate(5, (index) {
//           String imagePath;
//           Color chunkColor;
//           switch (index) {
//             case 0:
//               imagePath = widget.chunk1Path;
//               chunkColor = widget.chunkColors[0];
//               break;
//             case 1:
//               imagePath = widget.chunk2Path;
//               chunkColor = widget.chunkColors[1];
//               break;
//             case 2:
//               imagePath = widget.chunk3Path;
//               chunkColor = widget.chunkColors[2];
//               break;
//             case 3:
//               imagePath = widget.chunk4Path;
//               chunkColor = widget.chunkColors[3];
//               break;
//             case 4:
//               imagePath = widget.chunk5Path;
//               chunkColor = widget.chunkColors[4];
//               break;
//             default:
//               imagePath = widget.chunk1Path;
//               chunkColor = Colors.transparent;
//           }

//           return GestureDetector(
//             onTap: () {
//               widget.onChunkTap(
//                   index); // Notify parent about which chunk is tapped
//             },
//             child: Container(
//               width: imageWidth / 5, // Divide width evenly for each chunk
//               child: ColorFiltered(
//                 colorFilter: ColorFilter.mode(
//                   chunkColor.withOpacity(0.5),
//                   BlendMode.srcATop,
//                 ),
//                 child: Image.asset(
//                   imagePath,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//           );
//         }),
//       ),
//     );
//   }
// }
