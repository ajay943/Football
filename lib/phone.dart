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
  bool _acceptTerms = true;
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
  Widget build(BuildContext context) {
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
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Center(
                    child: Image(
                      image: AssetImage(
                        "assets/login.png",
                      ),
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 380,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      height: 500,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black,
                            Colors.black,
                            Colors.black54.withOpacity(0.1),
                          ],
                        ),
                      ),
                      child: Container(
                        margin: EdgeInsets.only(left: 25, right: 25),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 25),
                            Text(
                              "Lets get you started",
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: 25),
                            TextFormField(
                              keyboardType: TextInputType.phone,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(10)
                              ],
                              controller: phoneNumberController,
                              onChanged: ((value) {
                                _data.phoneNumber = value;
                                print(
                                    'phonenumberfield: $value.length');
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
                                } else if (value == '.' ||
                                    value == '-') {
                                  return 'Please enter a valid mobile number';
                                } else if (!mobileRegex
                                    .hasMatch(value)) {
                                  return 'Please enter a valid Indian mobile number';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                prefixIcon: Padding(
                                  padding:
                                      const EdgeInsets.only(top: 12),
                                  child: Text(
                                    '+91',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.notoSans(
                                        fontSize: 16,
                                        color:
                                            const Color(0xff151515),
                                        fontWeight:
                                            FontWeight.w600),
                                  ),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding:
                                    EdgeInsets.symmetric(
                                        vertical: 10,
                                        horizontal: 20),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(10.0),
                                  borderSide:
                                      BorderSide(color: Colors.black),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Row(
                              children: [
                                Checkbox(
                                  value: _acceptTerms,
                                  onChanged: (value) {
                                    setState(() {
                                      _acceptTerms =
                                          value ?? false;
                                    });
                                  },
                                  checkColor: Colors.black,
                                  fillColor:
                                      MaterialStateColor.resolveWith(
                                          (states) =>
                                              Colors.white),
                                  // Set the background color of the Checkbox
                                ),
                                Text(
                                  'I confirm that I am Indian Citizen of 18 + age\n and do not belong to the states of Assam,\n Odisha , Nagaland, Sikkim, Andhra Pradesh\n and Telengana. And I agree to Funzy’s T&C.',
                                  style: TextStyle(
                                      color: Colors.white),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            GestureDetector(
                              onTap: () {
                                setState(() async {
                                  print(
                                      "phoneNumber${_data.phoneNumber}");

                                  if (_formKey.currentState!
                                      .validate()) {
                                    String? phoneNumber =
                                        phoneNumberController
                                            .text;
                                    if (phoneNumber.isNotEmpty) {
                                      if (!_acceptTerms) {
                                        // Show a message or a dialog here
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                                'Please accept the terms and conditions.'),
                                          ),
                                        );
                                      } else {
                                        final random = Random();
                                        final otp =
                                            1000 + random.nextInt(6666);
                                        SharedPreferences pref =
                                            await SharedPreferences
                                                .getInstance();
                                        pref.setString(
                                            'phoneNumber',
                                            phoneNumber);
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
                                        //       await SharedPreferences
                                        //           .getInstance();
                                        //   phoneNumber = pref.getString(
                                        //       'phoneNumber');
                                        //   var res = value;
                                        //   Navigator.push(
                                        //       context,
                                        //       MaterialPageRoute(
                                        //           builder: (context) =>
                                        //               OtpScreen(
                                        //                   otp,
                                        //                   phoneNumber!)));
                                        // });
                                      }
                                    }
                                  }
                                });
                                setState(() async {
                                  SharedPreferences pref =
                                      await SharedPreferences
                                          .getInstance();
                                  var phoneNumber =
                                      pref.getString('phoneNumber');
                                });
                              },
                              child: Center(
                                child: Container(
                                  margin:
                                      const EdgeInsets.only(top: 50),
                                  height: 40,
                                  width: MediaQuery.of(context)
                                          .size
                                          .width *
                                      .50,
                                  decoration:
                                      const BoxDecoration(
                                    color:
                                        Color(0xFF8443BA),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10)),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Get OTP',
                                      style: GoogleFonts.notoSans(
                                          fontWeight:
                                              FontWeight.w600,
                                          fontSize: 14,
                                          color: const Color(
                                              0xffFFFFFF)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
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
