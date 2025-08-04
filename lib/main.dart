import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gamingapp/brush.dart';
import 'package:gamingapp/coloringscreen.dart';
import 'package:gamingapp/home.dart';
import 'package:gamingapp/practice.dart';
import 'package:gamingapp/splash.dart';
import 'package:gamingapp/splash1.dart';
import 'package:gamingapp/zoom.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          brightness:
              Brightness.light, // Use light brightness for a white theme
          primarySwatch: Colors.blue, // Set primary color for the app
        ),
        home: Scaffold(
            body: Container(

                //chld:dashboard(),
                child: const Splash()))
        // Your main content goes here
        );
  }
}
// import 'package:flutter/material.dart';
// import 'package:gamingapp/brush.dart';
// // import 'drawing_board.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Coloring App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: DrawingBoard(),
//     );
//   }
// }

