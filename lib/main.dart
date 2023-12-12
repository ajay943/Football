import 'package:app/otpScreen.dart';
import 'package:app/phone.dart';
import 'package:app/verify.dart';
import 'package:flutter/material.dart';
// import 'package:phone_otp_ui/phone.dart';
// import 'package:phone_otp_ui/verify.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: 'phone',
    debugShowCheckedModeBanner: false,
    routes: {
      'phone': (context) => SignInNewScreen(),
      // 'verify': (context) => OtpScreen(dynamic , dynamic)
    },
  ));
}
