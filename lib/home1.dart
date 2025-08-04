// import 'package:flutter/material.dart';
// import 'package:gamingapp/structure.dart'; // Ensure this is the correct import path for GridViewWidget

// class ImagesList extends StatefulWidget {
//   const ImagesList({super.key});

//   @override
//   State<ImagesList> createState() => _ImagesListState();
// }

// class _ImagesListState extends State<ImagesList> {
//   late List<String> _images; // List of image paths or data

//   @override
//   void initState() {
//     super.initState();
//     // Define a list of image paths
//     _images = [
//       'assets/svg/images/Untitled-4.png',
//       'assets/svg/images/im2.png',
//       'assets/svg/images/im3.jpg',
//       // 'assets/svg/images/im4.jpg',
//       // 'assets/svg/images/im5.jpg',
//       // 'assets/svg/images/im6.jpg',
//       // 'assets/svg/images/im7.jpg',
//       // 'assets/svg/images/im8.jpg',
//       // 'assets/svg/images/im9.jpg',
//       // 'assets/svg/images/im10.jpg',
//       // 'assets/svg/images/im11.jpg',
//       // 'assets/svg/images/im12.jpg',
//       // 'assets/svg/images/im13.jpg',
//       // 'assets/svg/images/im14.jpg',
//       // 'assets/svg/images/im15.jpg',
//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage(
//                 'assets/svg/images/back1.png'), // Ensure the path is correct
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: GridViewWidget(
//           items: _images,
//           sounds: [],
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:gamingapp/drawing1.dart';
// import 'package:gamingapp/structure.dart'; // Ensure this is the correct import path for GridViewWidget
// // Import the new screen

// class ImagesList extends StatefulWidget {
//   const ImagesList({super.key});

//   @override
//   State<ImagesList> createState() => _ImagesListState();
// }

// class _ImagesListState extends State<ImagesList> {
//   late List<String> _images; // List of image paths

//   @override
//   void initState() {
//     super.initState();
//     // Define a list of image paths
//     _images = [
//       'assets/svg/images/Untitled-4.png',
//       'assets/svg/images/pic1 (3).png',
//       'assets/svg/images/pic2.png',
//       'assets/svg/images/pic3.png',
//       'assets/svg/images/pic4.png',
//       'assets/svg/images/pic5.png',
//       'assets/svg/images/pic6.png',
//       'assets/svg/images/pic7.png',// i want to show these into white cotainer into home page
//       'assets/svg/images/pic8.png',
//       'assets/svg/images/pic9.png',
//       'assets/svg/images/pic10.png',
//       'assets/svg/images/pic11.png',
//       'assets/svg/images/pic12.png',
//       // More images can be added here
//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage('assets/svg/images/back1.png'),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: GridView.builder(
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 5, // Number of columns
//             crossAxisSpacing: 10.0,
//             mainAxisSpacing: 10.0,
//           ),
//           itemCount: _images.length,
//           itemBuilder: (context, index) {
//             return GestureDetector(
//               onTap: () {
//                 // Navigate to the Drawing1 screen with the selected image
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => Drawing1(imagePath: _images[index]),
//                   ),
//                 );
//               },
//               child: Image.asset(_images[index]), // Display the image
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:gamingapp/drawing1.dart';

class ImagesList extends StatefulWidget {
  const ImagesList({super.key});

  @override
  State<ImagesList> createState() => _ImagesListState();
}

class _ImagesListState extends State<ImagesList> {
  late List<String> _images; // List of image paths

  @override
  void initState() {
    super.initState();
    // Define a list of image paths
    _images = [
      'assets/svg/images/Untitled-4.png',
      // 'assets/svg/images/pic1 (3).png',
      'assets/svg/images/pic2.png',
      'assets/svg/images/pic3.png',
      // 'assets/svg/images/pic4.png',
      'assets/svg/images/pic5.png',
      'assets/svg/images/pic6.png',
      'assets/svg/images/pic7.png',
      'assets/svg/images/pic8.png',
      'assets/svg/images/pic9.png',
      'assets/svg/images/pic10.png',
      'assets/svg/images/pic11.png',
      // 'assets/svg/images/pic12.png',
      // More images can be added here
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/svg/images/back1.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5, // Number of columns
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          ),
          itemCount: _images.length,
          itemBuilder: (context, index) {
            return Container(
              height: 10,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.white, // Background color of the container
                borderRadius: BorderRadius.circular(8.0), // Rounded corners
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3), // Shadow direction
                  ),
                ],
              ),
              child: GestureDetector(
                onTap: () {
                  // Navigate to the Drawing1 screen with the selected image
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Drawing1(imagePath: _images[index]),
                    ),
                  );
                },
                child: Padding(
                  padding:
                      const EdgeInsets.all(8.0), // Padding inside the container
                  child: Image.asset(
                    _images[index],
                    fit: BoxFit.cover, // Ensure the image covers the container
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
