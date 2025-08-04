import 'package:flutter/material.dart';
import 'package:gamingapp/drawing1.dart';

class ImagesList2 extends StatefulWidget {
  const ImagesList2({super.key});

  @override
  State<ImagesList2> createState() => _ImagesListState();
}

class _ImagesListState extends State<ImagesList2> {
  late List<String> _images; // List of image paths

  @override
  void initState() {
    super.initState();
    // Define a list of image paths
    _images = [
      'assets/svg/images/insect1.png',
      'assets/svg/images/insect2.png',
      'assets/svg/images/insect3.png',
      'assets/svg/images/insect4.png',
      'assets/svg/images/insect5.png',
      'assets/svg/images/insect6.png',
      'assets/svg/images/insect7.png',
      'assets/svg/images/insect8.png',
      'assets/svg/images/insect9.png',
      'assets/svg/images/insect10.png',

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
