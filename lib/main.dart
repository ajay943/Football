import 'dart:async';
import 'package:app/maincricket.dart';
import 'package:app/phone.dart';
import 'package:app/views/demo.dart';
import 'package:app/views/onbording_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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

  Future<void> _initOneSignal() async {
    OneSignal.shared.setAppId("c97e076e-788e-49c4-8862-bff043f07115");

    OneSignal.shared
        .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
      // Handle notification opened
    });
    await OneSignal.shared.promptUserForPushNotificationPermission();
  }

  @override
  void initState() {
    super.initState();
    _initOneSignal();
    Future.delayed(Duration(seconds: 1), () {
      _checkAuth();
    });

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _animationController.forward();
  }

  Future<void> _checkAuth() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Navigator.of(context).pushReplacement(MaterialPageRoute(
    //   builder: (context) => MatchDetailPage(matchId: 12345,),
    // ));
    if (prefs.getBool('loggedin') == true) {
      Timer(
        const Duration(seconds: 3),
        () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => MainPage(),
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
                    tween: Tween(begin: 30.0, end: 70.0),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
