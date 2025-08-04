// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:gamingapp/home.dart';
// import 'package:gamingapp/mainhome.dart';
// import 'package:gamingapp/sound.dart';
// import 'package:lottie/lottie.dart';
// // Import the audioplayers package

// class Splash extends StatefulWidget {
//   const Splash({super.key});

//   @override
//   State<Splash> createState() => _SplashState();
// }

// class _SplashState extends State<Splash> {
//   // final AudioPlayer _audioPlayer = AudioPlayer();  // Initialize the AudioPlayer

//   @override
//   void initState() {
//     super.initState();
//     Timer(Duration(seconds: 2), () {
//       Navigator.pushReplacement(
//           context, MaterialPageRoute(builder: (context) => mainhome()));
//     });

//     ///  _playAudio();
//   }

//   // Future<void> _playAudio() async {
//   //   await _audioPlayer.play(AssetSource('laughter-29686.mp3'));  // Use AssetSource correctly
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: buildui(),
//     );
//   }

//   Widget buildui() {
//     return Stack(
//       children: [
//         // Center(
//         //   child: Lottie.asset(
//         //     'assets/svg/images/Animation - 1724586878852.json',
//         //     repeat: true,
//         //     reverse: true,
//         //     height: 1000,
//         //     width: 1000,
//         //   ),
//         // ),
//         Center(
//           child: Container(
//             color: Colors.white12,
//             child: Lottie.asset(
//                 'assets/svg/images/Animation - 1725122236380.json',
//                 repeat: true,
//                 reverse: false,
//                 height: double.infinity,
//                 width: double.infinity),
//           ),
//         ),
//         // AudioPlay(),
//       ],
//     );
//   }
// }

// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';

// // Replace with your actual mainhome import path
// import 'package:gamingapp/mainhome.dart';

// class Splash extends StatefulWidget {
//   const Splash({super.key});

//   @override
//   State<Splash> createState() => _SplashState();
// }

// class _SplashState extends State<Splash> {
//   @override
//   void initState() {
//     super.initState();
//     // Navigate to mainhome after 2 seconds
//     Timer(Duration(seconds: 2), () {
//       Navigator.pushReplacement(
//           context, MaterialPageRoute(builder: (context) => mainhome()));
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: buildui(),
//     );
//   }

//   Widget buildui() {
//     return Stack(
//       children: [
//         Positioned.fill(
//           child: Lottie.asset(
//             'assets/svg/images/Animation - 1725122236380.json',
//             repeat: true,
//             reverse: false,
//             fit: BoxFit.cover, // Ensures the animation covers the entire screen
//           ),
//         ),
//       ],
//     );
//   }
// }

// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';

// // Replace with your actual mainhome import path
// import 'package:gamingapp/mainhome.dart';

// class Splash extends StatefulWidget {
//   const Splash({super.key});

//   @override
//   State<Splash> createState() => _SplashState();
// }

// class _SplashState extends State<Splash> {
//   @override
//   void initState() {
//     super.initState();
//     // Navigate to mainhome after 2 seconds
//     Timer(Duration(seconds: 18), () {
//       Navigator.pushReplacement(
//           context, MaterialPageRoute(builder: (context) => mainhome()));
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // Ensuring the Scaffold takes up the full screen
//       body: SafeArea(
//         child: buildui(),
//       ),
//     );
//   }

//   Widget buildui() {
//     // Positioned.fill(
//     //   child: Expanded(
//     //     child: Lottie.asset(
//     //       'assets/svg/images/Animation - 1725122236380.json',
//     //       //  'assets/svg/images/Animation - 1725125968851.json',
//     //       repeat: true,
//     //       reverse: false,
//     //       fit: BoxFit
//     //           .cover, // Ensures the animation covers the entire screen
//     //     ),
//     //   ),
//     // ),
//     return Container(
//       color: Color(0xFF2e466c),
//       child: Stack(
//         children: [
//           Center(child: Image.asset('assets/svg/images/dolly1.png')),
//           Center(
//             child: Lottie.asset(
//               'assets/svg/images/Animation - 1725274021224.json',
//               repeat: true,
//             ),
//           ),
//           Center(
//             child: Text(
//               'Color Craft',
//               style:
//                   TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//             ),
//           )
//         ],
//       ),
//       // Correct way to use hex color
//     );
//   }
// }

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:gamingapp/mainhome.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    // Navigate to mainhome after 18 seconds
    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Mainhome()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: buildui(),
      ),
    );
  }

  Widget buildui() {
    return Container(
      color: const Color(0xFF2e466c),
      child: Stack(
        children: [
          Center(
            child: Image.asset(
              'assets/svg/images/dolly1.png',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Lottie.asset(
              'assets/svg/images/Animation - 1725274021224.json',
              repeat: true,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
          ),
          // Positioned(
          //   right: 690,

          //  // child: AnimatedTextWidget(), // Custom widget for animated text
          // ),
        ],
      ),
    );
  }
}

class AnimatedTextWidget extends StatefulWidget {
  const AnimatedTextWidget({super.key});

  @override
  _AnimatedTextWidgetState createState() => _AnimatedTextWidgetState();
}

class _AnimatedTextWidgetState extends State<AnimatedTextWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: const Hero(
        tag: 'hero-text', // Tag for Hero transition
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'Color',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Craft',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class MainHome extends StatelessWidget {
  const MainHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Main Home')),
      body: const Center(
        child: Hero(
          tag: 'hero-text',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Color',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Craft',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
