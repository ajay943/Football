import 'dart:async';
import 'package:app/maincricket.dart';
import 'package:app/phone.dart';
import 'package:app/views/onbording_page.dart';
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

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    super.initState();

    // Delayed navigation to the next screen
    Future.delayed(Duration(seconds: 1), () {
      _checkAuth();
    });

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    // Create the animation
    _animation = ColorTween(begin: Colors.red, end: Colors.blue)
        .animate(_animationController);
    _animationController.addListener(() {
      setState(() {});
      // print('_animation== ${_animation.value}');
    });
    // Start the animation
    _animationController.forward();
  }

  Future<void> _checkAuth() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('loggedin') == true) {
      Timer(
        const Duration(seconds: 3),
        () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => TestScreen(),
          ));
        },
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => TestScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/splase.png',
            fit: BoxFit.cover,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TweenAnimationBuilder(
                    tween: Tween(begin: 40.0, end: 70.0),
                    duration: Duration(seconds: 3),
                    builder: (context, value, child) {
                      return Text(
                        'FUNZY',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: value,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    }),
                // Text(
                //   'FUNZY',
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontSize: 70,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
