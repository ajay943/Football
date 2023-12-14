import 'dart:math';
import 'package:app/otpScreen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../services/api_service.dart';

class LoginOtpData {
  var phoneNumber;
}

class SignInNewScreen extends StatefulWidget {
  const SignInNewScreen({Key? key}) : super(key: key);

  @override
  State<SignInNewScreen> createState() => _SignInNewScreenState();
}

class _SignInNewScreenState extends State<SignInNewScreen> {
  final String privacyPolicyUrl = 'https://qa.dznify.com/privacy-policy/';
  String _randomNumber = '';
  final _formKey = GlobalKey<FormState>();
  LoginOtpData _data = LoginOtpData();
  final TextEditingController phoneNumberController = TextEditingController();

  final _pageController = PageController(viewportFraction: 0.8, initialPage: 1);
  int activePage = 1;

  bool isSkip = false;

  var savedNumber;

  var sender;

  var apikey;

  RegExp regex = RegExp(r'^\d{10}$');
  List<Widget> indicators(imagesLength, currentIndex) {
    return List<Widget>.generate(imagesLength, (index) {
      return Container(
        margin: EdgeInsets.all(3),
        width: 10,
        height: 10,
        decoration: BoxDecoration(
            color: currentIndex == index ? Colors.black : Colors.black26,
            shape: BoxShape.circle),
      );
    });
  }

  _launchURLApp() async {
    // const url = 'https://qa.dznify.com/privacy-policy/';
    // if (await canLaunch(url)) {
    //   await launch(url, forceSafariVC: true, forceWebView: true);
    // } else {
    //   throw 'Could not launch $url';
    // }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    phoneNumberController.dispose();
    super.dispose();
  }

  DateTime? _lastBackPressed;
  @override
  Widget build(
    BuildContext context,
  ) {
    return WillPopScope(
      onWillPop: () async {
        if (_lastBackPressed == null ||
            DateTime.now().difference(_lastBackPressed!) >
                Duration(seconds: 2)) {
          _lastBackPressed = DateTime.now();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Press back again to exit')),
          );
          return false;
        }
        return true;
      },
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 140,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 30),
                    child: SizedBox(
                      height: 150,
                      width: 140,
                      child: Image.asset('assets/img1.png'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50, right: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Enter Your 10 Digit Mobile Number',
                          style: GoogleFonts.notoSans(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff151515),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50, right: 50),
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(10)
                      ],
                      controller: phoneNumberController,
                      onChanged: ((value) {
                        _data.phoneNumber = value;
                        print('phonenumberfield: $value.length');
                      }),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a phone number';
                        } else if (value.length != 10) {
                          return 'Please enter 10 digit number';
                        } else if (!regex.hasMatch(value)) {
                          return 'Please enter a valid 10-digit mobile number';
                        } else if (value == '0000000000') {
                          return 'Please enter a valid mobile number';
                        } else if (value == '.' || value == '-') {
                          return 'Please enter a valid mobile number';
                        } else if (!mobileRegex.hasMatch(value)) {
                          return 'Please enter a valid Indian mobile number';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: Text(
                            '+91',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.notoSans(
                                fontSize: 16,
                                color: const Color(0xff151515),
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        hintText: "00000 00000",
                        hintStyle: GoogleFonts.notoSans(
                            fontSize: 16,
                            color: const Color(0xff151515).withOpacity(0.60),
                            fontWeight: FontWeight.w400),
                        fillColor: const Color(0xffF5F5F5),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: const Color(0xff151515).withOpacity(0.30)),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: const Color(0xff151515).withOpacity(0.30)),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() async {
                        print("phoneNumber${_data.phoneNumber}");

                        if (_formKey.currentState!.validate()) {
                          String? phoneNumber = phoneNumberController.text;
                          if (phoneNumber.isNotEmpty) {
                            final random = Random();
                            final otp = 1000 + random.nextInt(6666);
                            SharedPreferences pref =
                                await SharedPreferences.getInstance();
                            pref.setString('phoneNumber', phoneNumber);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        OtpScreen(otp, phoneNumber)));
                            // ApiService.otpApi(
                            //   apikey,
                            //   sender,
                            //   phoneNumber,
                            //   otp,
                            // ).then((value) async {
                            //   SharedPreferences pref =
                            //       await SharedPreferences.getInstance();
                            //   phoneNumber = pref.getString('phoneNumber');
                            //   var res = value;
                            //   Navigator.push(
                            //       context,
                            //       MaterialPageRoute(
                            //           builder: (context) =>
                            //               OtpScreen(otp, phoneNumber)));
                            // });
                          }
                        }
                      });
                      setState(() async {
                        SharedPreferences pref =
                            await SharedPreferences.getInstance();
                        // pref.setString('phoneNumber', phoneNumber);
                        var phoneNumber = pref.getString('phoneNumber');
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 50),
                      height: 40,
                      width: MediaQuery.of(context).size.width * .50,
                      decoration: const BoxDecoration(
                        color: Color(0xffFF6600),
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      child: Center(
                        child: Text(
                          'Get OTP',
                          style: GoogleFonts.notoSans(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: const Color(0xffFFFFFF)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          )),
    );
  }

  void _generateRandomNumber() {
    final random = Random();
    final randomNumber = 1000 + random.nextInt(9999);
    setState(() {
      _randomNumber = '$randomNumber';
      print("E_randomNumber_${_randomNumber}");
    });
  }

  final RegExp mobileRegex = RegExp(r'^[6-9]\d{9}$');
}
