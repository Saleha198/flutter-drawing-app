// import 'package:flutter/material.dart';
// import 'package:gamingapp/home1.dart';
// import 'package:lottie/lottie.dart';
// // Import the new screen

// class Dashboard extends StatefulWidget {
//   const Dashboard({super.key});

//   @override
//   State<Dashboard> createState() => _DashboardState();
// }

// class _DashboardState extends State<Dashboard> {
//   int? _selectedIndex; // State variable to keep track of the selected item

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage(
//                 'assets/svg/images/back1.png'), // Ensure the path is correct
//             fit: BoxFit.cover, // Ensures the image covers the entire container
//           ),
//         ),
//         child: Center(
//           child: Container(
//             width: double.infinity, // Ensure it takes full width
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment
//                   .center, // Center the column content vertically
//               children: [
//                 SizedBox(
//                     height: 90), // Optional: Add spacing above the ListView
//                 SizedBox(
//                   height: 250, // Fixed height for the ListView
//                   child: ListView.builder(
//                     scrollDirection: Axis.horizontal,
//                     itemCount: 5,
//                     itemBuilder: (context, index) {
//                       final double itemHeight = 500;
//                       final Color backgroundColor = index == 0
//                           ? Color.fromARGB(255, 82, 228, 189)
//                           : Colors.white; // Conditional color

//                       return Padding(
//                         padding: EdgeInsets.all(10),
//                         child: InkWell(
//                           onTap: () {
//                             setState(() {
//                               _selectedIndex =
//                                   index; // Update the selected index on tap
//                             });

//                             if (index == 0) {
//                               // Navigate to AllImagesScreen when the first item is tapped
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => const ImagesList(),
//                                 ),
//                               );
//                             }
//                           },
//                           child: Container(
//                             width: 145,
//                             height: itemHeight, // Apply height to the container
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(20),
//                               color:
//                                   backgroundColor, // Apply the background color
//                               border: Border.all(
//                                 color: _selectedIndex == index
//                                     ? Colors.blue
//                                     : Colors.transparent,
//                                 width: 2,
//                               ),
//                             ),
//                             child: Center(
//                               child: index == 0
//                                   ? SizedBox(
//                                       width: double.infinity,
//                                       height: itemHeight,
//                                       child: Lottie.asset(
//                                         'assets/svg/images/Animation - 1723468990391.json', // Ensure the path is correct
//                                         fit: BoxFit
//                                             .fill, // Make sure the animation fills the container
//                                         repeat: true,
//                                         reverse: true,
//                                       ),
//                                     )
//                                   : Text('hello'),
//                             ),

//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//                 SizedBox(height: 0), // Optional: Add spacing below the ListView
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:gamingapp/home1.dart';
// import 'package:lottie/lottie.dart';

// class Dashboard extends StatefulWidget {
//   const Dashboard({super.key});

//   @override
//   State<Dashboard> createState() => _DashboardState();
// }

// class _DashboardState extends State<Dashboard> {
//   int? _selectedIndex; // State variable to keep track of the selected item

//   // List of animation paths for each container
//   final List<String> _animations = [
//     'assets/svg/images/Animation - 1723468990391.json',
//     'assets/svg/images/Animation - 1725381000536.json',
//     'assets/svg/images/Animation - 1725300877939.json',
//     'assets/svg/images/Animation - 1725299096595.json',
//     'assets/svg/images/Animation - 1724844452205.json',
//   ];

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
//         child: Center(
//           child: Container(
//             width: double.infinity,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 SizedBox(height: 90),
//                 SizedBox(
//                   height: 250,
//                   child: ListView.builder(
//                     scrollDirection: Axis.horizontal,
//                     itemCount: _animations.length,
//                     itemBuilder: (context, index) {
//                       final double itemHeight = 500;
//                       final Color backgroundColor = index == 0
//                           ? Color.fromARGB(255, 82, 228, 189)
//                           : Colors.white; // Conditional color

//                       return Padding(
//                         padding: EdgeInsets.all(10),
//                         child: InkWell(
//                           onTap: () {
//                             setState(() {
//                               _selectedIndex =
//                                   index; // Update the selected index on tap
//                             });

//                             if (index == 0) {
//                               // Navigate to AllImagesScreen when the first item is tapped
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => const ImagesList(),
//                                 ),
//                               );
//                             }
//                           },
//                           child: Container(
//                             width: 145,
//                             height: itemHeight,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(20),
//                               color: backgroundColor,
//                               border: Border.all(
//                                 color: _selectedIndex == index
//                                     ? Colors.blue
//                                     : Colors.grey,
//                                 width: 2,
//                               ),
//                             ),
//                             child: Center(
//                               child: SizedBox(
//                                 width: double.infinity,
//                                 height: itemHeight,
//                                 child: Lottie.asset(
//                                   _animations[
//                                       index], // Use different animation based on index
//                                   fit: BoxFit.fill,
//                                   repeat: true,
//                                   reverse: true,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//                 SizedBox(height: 0), // Optional: Add spacing below the ListView
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:gamingapp/home1.dart';
// import 'package:gamingapp/home2.dart';
// import 'package:gamingapp/home3.dart';
// import 'package:gamingapp/home4.dart';
// import 'package:gamingapp/home5.dart';
// import 'package:lottie/lottie.dart';

// class Dashboard extends StatefulWidget {
//   const Dashboard({super.key});

//   @override
//   State<Dashboard> createState() => _DashboardState();
// }

// class _DashboardState extends State<Dashboard> {
//   int? _selectedIndex; // State variable to keep track of the selected item

//   // List of animation paths for each container
//   final List<String> _animations = [
//     'assets/svg/images/Animation - 1723468990391.json',
//     'assets/svg/images/Animation - 1725381000536.json',
//     'assets/svg/images/Animation - 1725516825572.json',
//     'assets/svg/images/Animation - 1725519497809.json',
//     'assets/svg/images/Animation - 1725516825572.json',
//     //'assets/svg/images/Animation - 1725516825572.json',
//   ];

//   // List of background colors for each container
//   final List<Color> _backgroundColors = [
//     Color.fromARGB(255, 82, 228, 189),
//     Color.fromARGB(255, 12, 89, 95),
//     Color.fromARGB(255, 63, 160, 81),
//     Color.fromARGB(255, 175, 129, 44),
//     Color.fromARGB(255, 255, 255, 255),
//   ];

//   // Function to handle navigation based on index
//   void _navigateToPage(int index) {
//     switch (index) {
//       case 0:
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => const ImagesList(),
//           ),
//         );
//         break;
//       case 1:
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//               builder: (context) =>
//                   const ImagesList1() // Replace with your page
//               ),
//         );
//         break;
//       case 2:
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//               builder: (context) =>
//                   const ImagesList2() // Replace with your page
//               ),
//         );

//         break;
//       case 3:
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//               builder: (context) =>
//                   const ImagesList3() // Replace with your page
//               ),
//         );
//         break;
//       case 4:
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//               builder: (context) =>
//                   const ImagesList4() // Replace with your page
//               ),
//         );
//         break;
//       // Add more cases as needed
//       default:
//         break;
//     }
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
//         child: Center(
//           child: Container(
//             width: double.infinity,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 SizedBox(height: 94),
//                 SizedBox(
//                   height: 250,
//                   child: ListView.builder(
//                     scrollDirection: Axis.horizontal,
//                     //    itemCount: _animations.length,
//                     itemCount: 8,
//                     itemBuilder: (context, index) {
//                       final double itemHeight = 500;

//                       return Padding(
//                         padding: EdgeInsets.all(10),
//                         child: InkWell(
//                           onTap: () {
//                             setState(() {
//                               _selectedIndex =
//                                   index; // Update the selected index on tap
//                             });
//                             _navigateToPage(
//                                 index); // Navigate to the corresponding page
//                           },
//                           child: Container(
//                             width: 145,
//                             height: itemHeight,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(20),
//                               color: _backgroundColors[
//                                   index], // Set the background color
//                               border: Border.all(
//                                 color: _selectedIndex == index
//                                     ? Colors.blue
//                                     : Colors.grey,
//                                 width: 2,
//                               ),
//                             ),
//                             child: Center(
//                               child: SizedBox(
//                                 width: double.infinity,
//                                 height: itemHeight,
//                                 child: Lottie.asset(
//                                   _animations[
//                                       index], // Use different animation based on index
//                                   fit: BoxFit.fill,
//                                   repeat: true,
//                                   reverse: true,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//                 SizedBox(height: 0), // Optional: Add spacing below the ListView
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:gamingapp/home1.dart';
// import 'package:gamingapp/home2.dart';
// import 'package:gamingapp/home3.dart';
// import 'package:gamingapp/home4.dart';
// import 'package:gamingapp/home5.dart';
// import 'package:gamingapp/home6.dart';
// import 'package:gamingapp/home7.dart';
// import 'package:lottie/lottie.dart';

// class Dashboard extends StatefulWidget {
//   const Dashboard({super.key});

//   @override
//   State<Dashboard> createState() => _DashboardState();
// }

// class _DashboardState extends State<Dashboard> {
//   int? _selectedIndex; // State variable to keep track of the selected item

//   // List of animation paths for each container (extended to 8 items)
//   final List<String> _animations = [
//     'assets/svg/images/Animation - 1723468990391.json',
//     'assets/svg/images/Animation - 1725381000536.json',
//     'assets/svg/images/Animation - 1725516825572.json',
//     'assets/svg/images/Animation - 1725519497809.json',
//     'assets/svg/images/Animation - 1725538529946.json',
//     'assets/svg/images/Animation - 1725538394785.json',
//     'assets/svg/images/Animation - 1725538146671.json',
//     // 'assets/svg/images/Animation - 1725519497809.json',
//   ];

//   // List of background colors for each container (extended to 8 items)
//   final List<Color> _backgroundColors = [
//     Color.fromARGB(255, 82, 228, 189),
//     Color.fromARGB(255, 12, 89, 95),
//     Color.fromARGB(255, 63, 160, 81),
//     Color.fromARGB(255, 175, 129, 44),
//     Color.fromARGB(255, 111, 107, 107),
//     Color.fromARGB(255, 96, 90, 82),
//     Color.fromARGB(255, 79, 96, 110),
//     Color.fromARGB(255, 255, 112, 67),
//   ];

//   // Function to handle navigation based on index
//   void _navigateToPage(int index) {
//     switch (index) {
//       case 0:
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => const ImagesList(),
//           ),
//         );
//         break;
//       case 1:
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//               builder: (context) =>
//                   const ImagesList1() // Replace with your page
//               ),
//         );
//         break;
//       case 2:
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//               builder: (context) =>
//                   const ImagesList2() // Replace with your page
//               ),
//         );

//         break;
//       case 3:
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//               builder: (context) =>
//                   const ImagesList3() // Replace with your page
//               ),
//         );
//         break;
//       case 4:
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//               builder: (context) =>
//                   const ImagesList4() // Replace with your page
//               ),
//         );
//         break;
//       // Cases for additional containers
//       case 5:
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//               builder: (context) =>
//                   const ImagesList5() // Replace with your page
//               ),
//         );

//         break;
//       case 6:
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//               builder: (context) =>
//                   const ImagesList6() // Replace with your page
//               ),
//         );

//         break;
//       case 7:
//         // Navigate to another page or handle it as needed
//         break;
//       default:
//         break;
//     }
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
//         child: Center(
//           child: Container(
//             width: double.infinity,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 SizedBox(height: 94),
//                 SizedBox(
//                   height: 250,
//                   child: ListView.builder(
//                     scrollDirection: Axis.horizontal,
//                     itemCount: 7, // Corrected to show 8 containers
//                     itemBuilder: (context, index) {
//                       final double itemHeight = 500;

//                       return Padding(
//                         padding: EdgeInsets.all(10),
//                         child: InkWell(
//                           onTap: () {
//                             setState(() {
//                               _selectedIndex =
//                                   index; // Update the selected index on tap
//                             });
//                             _navigateToPage(
//                                 index); // Navigate to the corresponding page
//                           },
//                           child: Container(
//                             width: 145,
//                             height: itemHeight,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(20),
//                               color: _backgroundColors[
//                                   index], // Set the background color
//                               border: Border.all(
//                                 color: _selectedIndex == index
//                                     ? Colors.blue
//                                     : Colors.grey,
//                                 width: 2,
//                               ),
//                             ),
//                             child: Center(
//                               child: SizedBox(
//                                 width: double.infinity,
//                                 height: itemHeight,
//                                 child: Lottie.asset(
//                                   _animations[
//                                       index], // Use different animation based on index
//                                   fit: BoxFit.fill,
//                                   repeat: true,
//                                   reverse: true,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//                 SizedBox(height: 0), // Optional: Add spacing below the ListView
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:gamingapp/home1.dart';
import 'package:gamingapp/home2.dart';
import 'package:gamingapp/home3.dart';
import 'package:gamingapp/home4.dart';
import 'package:gamingapp/home5.dart';
import 'package:gamingapp/home6.dart';
import 'package:gamingapp/home7.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart'; // Import url_launcher

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    super.initState();
    initBannerAd();
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

  int? _selectedIndex; // State variable to keep track of the selected item

  // List of animation paths for each container (extended to 8 items)
  final List<String> _animations = [
    'assets/svg/images/Animation - 1723468990391.json',
    'assets/svg/images/Animation - 1725381000536.json',
    'assets/svg/images/Animation - 1725516825572.json',
    'assets/svg/images/Animation - 1725519497809.json',
    'assets/svg/images/Animation - 1725538529946.json',
    'assets/svg/images/Animation - 1725538394785.json',
    'assets/svg/images/Animation - 1725538146671.json',
  ];

  // List of background colors for each container (extended to 8 items)
  final List<Color> _backgroundColors = [
    const Color.fromARGB(255, 82, 228, 189),
    const Color.fromARGB(255, 12, 89, 95),
    const Color.fromARGB(255, 63, 160, 81),
    const Color.fromARGB(255, 175, 129, 44),
    const Color.fromARGB(255, 111, 107, 107),
    const Color.fromARGB(255, 96, 90, 82),
    const Color.fromARGB(255, 79, 96, 110),
    const Color.fromARGB(255, 255, 112, 67),
  ];

  // Function to handle navigation based on index
  void _navigateToPage(int index) {
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ImagesList(),
          ),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ImagesList1()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ImagesList2()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ImagesList3()),
        );
        break;
      case 4:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ImagesList4()),
        );
        break;
      case 5:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ImagesList5()),
        );
        break;
      case 6:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ImagesList6()),
        );
        break;
      case 7:
        // Navigate to another page or handle it as needed
        break;
      default:
        break;
    }
  }

  // Function to launch the URL
  Future<void> _launchURL() async {
    const url = 'http://www.vortexcodestudio.com/privacy-policy';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: isAdloaded
          ? SizedBox(
              height: bannerad.size.height.toDouble(),
              width: bannerad.size.width.toDouble(),
              child: AdWidget(ad: bannerad),
            )
          : const SizedBox(),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/svg/images/back1.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 94),
                    SizedBox(
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 7, // Corrected to show 8 containers
                        itemBuilder: (context, index) {
                          const double itemHeight = 500;

                          return Padding(
                            padding: const EdgeInsets.all(10),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  _selectedIndex =
                                      index; // Update the selected index on tap
                                });
                                _navigateToPage(
                                    index); // Navigate to the corresponding page
                              },
                              child: Container(
                                width: 145,
                                height: itemHeight,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: _backgroundColors[
                                      index], // Set the background color
                                  border: Border.all(
                                    color: _selectedIndex == index
                                        ? Colors.blue
                                        : Colors.grey,
                                    width: 2,
                                  ),
                                ),
                                child: Center(
                                  child: SizedBox(
                                    width: double.infinity,
                                    height: itemHeight,
                                    child: Lottie.asset(
                                      _animations[
                                          index], // Use different animation based on index
                                      fit: BoxFit.fill,
                                      repeat: true,
                                      reverse: true,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                        height: 30), // Optional: Add spacing below the ListView
                  ],
                ),
              ),
            ),
          ),
          // Positioned widget to add button in bottom left corner

          // Padding(
          //   padding: const EdgeInsets.only(top: 550, left: 20),
          //   child: ElevatedButton(
          //     onPressed: _launchURL,
          //     child: Text('Privacy Policy'),
          //     style: ElevatedButton.styleFrom(
          //       foregroundColor: Colors.white,
          //       backgroundColor: Colors.grey, // Background color
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
