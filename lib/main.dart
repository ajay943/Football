// // @dart = 2.9
// import 'dart:async';
// import 'package:app/maincricket.dart';
// import 'package:app/phone.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// // import 'package:ramagya/screens/signInNewScreen.dart';

// void main() async {
//   runApp(
//     MyApp(),
//   );
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       initialRoute: 'splashScreen',
//       // initialRoute: 'test',
//       // routes: route,
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

// class SplashScreen extends StatefulWidget {
//   const SplashScreen();

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   // bool isAuth = false;
//   @override
//   void initState() {
//     super.initState();
    
//     Future.delayed(Duration(seconds: 2), () {
//       _checkAuth();
//     });
//     // Timer(const Duration(seconds: 3),
//     //     () => Navigator.pushNamed(context, 'OnBoarding'));
//   }

//   Future _checkAuth() async {

    
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     // if (prefs.getBool('seenWelComeScreen') == false) {
//     //   Timer(
//     //       const Duration(seconds: 3),
//     //       () => {
            
//     //             Navigator.of(context).popUntil((route) => route.isFirst),
//     //             Navigator.of(context).pushReplacement(
//     //                 MaterialPageRoute(builder: (context) => OnBoarding())),
//     //           });
//     // } else 
//     if (prefs.getBool('loggedin') == true) {
//       Timer(
//           const Duration(seconds: 3),
//           () => {
//                 Navigator.of(context).popUntil((route) => route.isFirst),
//                 Navigator.of(context).pushReplacement(MaterialPageRoute(
//                     builder: (context) => MainPage())),
//               });
//     } else {
//       Navigator.of(context).popUntil((route) => route.isFirst);
//       Navigator.of(context).pushReplacement(
//           MaterialPageRoute(builder: (context) => SignInNewScreen()));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return
//         // !isAuth ? const SignInNewScreen() : BottomNav(0, true);
//         Scaffold(
//             body: Center(
//       child: Image.asset('assets/images/mart_splash.png'),
//     ));
//   }
// }

// class AppColor {
//   static Color primaryColor = const Color(0xff091D48);
// }


import 'dart:async';
import 'package:app/maincricket.dart';
import 'package:app/phone.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Add a const constructor to allow null keys
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'splashScreen',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(), // Specify the home property with SplashScreen
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen();

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Delayed navigation to the next screen
    Future.delayed(Duration(seconds: 1), () {
      _checkAuth();
    });
  }

  Future<void> _checkAuth() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('loggedin') == true) {
      Timer(
        const Duration(seconds: 3),
        () {
          Navigator.of(context).popUntil((route) => route.isFirst);
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => MainPage(),
          ));
        },
      );
    } else {
      Navigator.of(context).popUntil((route) => route.isFirst);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => SignInNewScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/splace.png'),
      ),
    );
  }
}

class AppColor {
  static Color primaryColor = const Color(0xff091D48);
}