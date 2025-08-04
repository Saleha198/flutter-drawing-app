// import 'package:flutter/material.dart';
// import 'package:gamingapp/home.dart';
// import 'package:lottie/lottie.dart';

// class mainhome extends StatelessWidget {
//   const mainhome({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: Stack(
//           children: [
//             Container(
//               color: Color.fromARGB(255, 190, 236, 239),
//               child: Lottie.asset(
//                   'assets/svg/images/Animation - 1725122385297.json',
//                   height: double.infinity,
//                   width: 1000),
//             ),
//             // Center(
//             //   child: Container(
//             //     child: IconButton(
//             //       icon: Lottie.asset(
//             //           'assets/svg/images/Animation - 1725127732570.json',
//             //           width: 100,
//             //           height: 100),
//             //       onPressed: () {
//             //         Navigator.push(context,
//             //             MaterialPageRoute(builder: (context) => Dashboard()));
//             //       },
//             //     ),
//             //   ),
//             // )
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:gamingapp/home.dart';
// import 'package:lottie/lottie.dart';

// class mainhome extends StatelessWidget {
//   const mainhome({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           // Background animation
//           SizedBox.expand(
//             child: Lottie.asset(
//               'assets/svg/images/Animation - 1725122385297.json',
//               fit: BoxFit.cover, // Ensures the animation covers the full screen
//             ),
//           ),

//           Lottie.asset(
//             'assets/svg/images/Animation - 1725276188568.json',
//             fit: BoxFit.cover, // Ensures the animation covers the full screen
//           ),
//           // Positioned(
//           //     right: 10,
//           //     child: Lottie.asset(
//           //       'assets/svg/images/Animation - 1725276741650.jsonn',
//           //       // Ensures the animation covers the full screen
//           //     )),

//           Center(
//             child: Container(
//               child: IconButton(
//                 icon: Lottie.asset(
//                     'assets/svg/images/Animation - 1725127732570.json',
//                     width: 100,
//                     height: 100),
//                 onPressed: () {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => Dashboard()));
//                 },
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:gamingapp/home.dart';
import 'package:lottie/lottie.dart';

class Mainhome extends StatelessWidget {
  const Mainhome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background animation
          SizedBox.expand(
            child: Lottie.asset(
              'assets/svg/images/Animation - 1725122385297.json',
              fit: BoxFit.cover, // Ensures the animation covers the full screen
            ),
          ),

          // Another animation on the full screen (example)
          Positioned.fill(
            child: Lottie.asset(
              'assets/svg/images/Animation - 1725276188568.json',
              fit: BoxFit
                  .contain, // Ensures the animation covers the full screen
              // This will overlay the background animation
            ),
          ),

          // Additional animation on the right side of the button
          Positioned(
            right: 0,
            top: 10, // Adjust the top value to position it correctly
            child: Lottie.asset(
              'assets/svg/images/Animation - 1725276741650.json',
              width: 300, // Adjust the width as needed
              height: 500, // Adjust the height as needed
            ),
          ),

          Positioned(
            left: 10,
            top: 10, // Adjust the top value to position it correctly
            child: Lottie.asset(
              'assets/svg/images/Animation - 1725276741650.json',

              width: 300, // Adjust the width as needed
              height: 500, // Adjust the height as needed
            ),
          ),

          // Centered button with animation
          Center(
            child: IconButton(
              icon: Lottie.asset(
                'assets/svg/images/Animation - 1725127732570.json',
                width: 200,
                height: 100,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Dashboard()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
