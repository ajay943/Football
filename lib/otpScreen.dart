// ignore_for_file: file_names, avoid_print, non_constant_identifier_names
import 'dart:async';
import 'dart:math';
import 'package:app/maincricket.dart';
import 'package:app/phone.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/api_service.dart';

class OtpScreen extends StatefulWidget {
  final randomNumber, phonenumber;
  OtpScreen(this.randomNumber, this.phonenumber);
  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController otpController = TextEditingController();
  final _maxSeconds = 120;
  int _currentSecond = 0;
  bool _isOTPSENT = false;
  bool _resendBotton = false;
  Timer? _timer;
  var optSent = '';
  Duration myDuration = Duration(minutes: 1);
  Timer? countdownTimer;

  String get _timerText {
    final secondsPerMinute = 60;
    final secondsLeft = _maxSeconds - _currentSecond;

    final formattedMinutesLeft =
        (secondsLeft ~/ secondsPerMinute).toString().padLeft(2, '0');
    final formattedSecondsLeft =
        (secondsLeft % secondsPerMinute).toString().padLeft(2, '0');

    print('$formattedMinutesLeft : $formattedSecondsLeft');
    return '$formattedMinutesLeft : $formattedSecondsLeft';
  }

  @override
  void initState() {
    otpPin = widget.randomNumber;
    phoneNumber = widget.phonenumber;

    // _startTimer();
    startTimer();
    super.initState();
    startTimer();
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _resendBotton = true;
      });
    });
  }

  void startTimer() {
    countdownTimer =
        Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
  }

  void resetTimer() {
    stopTimer();
    setState(() => myDuration = Duration(minutes: 1));
  }

  void stopTimer() {
    setState(() => countdownTimer!.cancel());
  }

  _ResetTimer() {
    resetTimer();
    startTimer();
  }

  void setCountDown() {
    final reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }

  String userEnterOtp = '';

  var otpPin;
  var phoneNumber;
  var sender;

  var apikey;

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');

    final minutes = strDigits(myDuration.inMinutes.remainder(60));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));
    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
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
                  padding: const EdgeInsets.only(left: 50, top: 10),
                  child: Row(
                    children: [
                      Text(
                        '+91 - $phoneNumber',
                        style: GoogleFonts.notoSans(
                            fontSize: 14,
                            color: const Color(0xff151515),
                            fontWeight: FontWeight.w600),
                      ),
                      IconButton(
                          onPressed: () {
                             Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          SignInNewScreen()));
                          },
                          icon: const Icon(
                            Icons.edit_outlined,
                            color: Color(0xffFF6600),
                            size: 27,
                          )),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.only(top: 50),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 40, right: 40),
                      child: PinCodeTextField(
                        length: 4,
                        keyboardType: const TextInputType.numberWithOptions(),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(4)
                        ],
                        textStyle: const TextStyle(
                          fontSize: 18.0,
                          color: Color(0xff151515),
                          fontWeight: FontWeight.w600,
                        ),
                        controller: otpController,
                        onChanged: (value) {
                          setState(() {
                            userEnterOtp = value;
                            print("userEnterOtp_$userEnterOtp");
                          });
                        },
                        appContext: context,
                        pinTheme: PinTheme(
                          inactiveColor: Colors.grey,
                          activeColor: Colors.grey,
                          selectedColor: Colors.grey,
                          // shape: PinCodeFieldShape.box,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(left: 45, right: 45),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "$minutes:$seconds",
                          style: GoogleFonts.notoSans(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xffFF6600)),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (_resendBotton) {
                              setState(() {
                                if (_formKey.currentState!.validate()) {
                                  ApiService.otpApi(
                                    apikey,
                                    sender,
                                    phoneNumber,
                                    otpPin,
                                  ).then((value) async {
                                    var res = value;
                                    print("secondScreen_$res");
                                    print("success==>${res['status']}");
                                    setState(() {
                                      optSent = res['status'];
                                    });
                                    if (optSent == 'success') {
                                      _ResetTimer();
                                      _isOTPSENT = true;
                                      Future.delayed(const Duration(seconds: 10),
                                          () {
                                        setState(() {
                                          _isOTPSENT = false;
                                          _ResetTimer();
                                        });
                                      });
                                      setState(() {
                                        _resendBotton = false;
                                        resetTimer();
                                      });
                                    }
                                  });
                                }
                              });
                            }
                          },
                          child: Text(
                            _isOTPSENT ? 'OTP sent' : 'Resend Code',
                            style: GoogleFonts.notoSans(
                                decoration: TextDecoration.underline,
                                fontSize: 14,
                                color: const Color(0xff1B439B),
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    )),
                GestureDetector(
                  onTap: () {
                    _submitForm();
                    setState(() async {});
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 60),
                    height: 40,
                    width: MediaQuery.of(context).size.width * .50,
                    decoration: const BoxDecoration(
                      color: Color(0xffFF6600),
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    child: Center(
                      child: Text(
                        'Verify OTP',
                        style: GoogleFonts.notoSans(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: const Color(0xffFFFFFF)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print("OUR1_$otpPin");
      print("YOU1_$userEnterOtp");
       Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => MainPage()),
          (route) => false,
        );
      // if (otpPin.toString() == userEnterOtp.toString()) {
      //   print("OUR_$otpPin");
      //   print("YOU_$userEnterOtp");
      //   Navigator.pushAndRemoveUntil(
      //     context,
      //     MaterialPageRoute(builder: (context) => MainPage()),
      //     (route) => false,
      //   );
      // } else {
      //   showDialog(
      //     context: context,
      //     builder: (BuildContext context) {
      //       return AlertDialog(
      //         title: Text('Invalid OTP'),
      //         actions: <Widget>[
      //           ElevatedButton(
      //             child: Text('OK'),
      //             onPressed: () {
      //               Navigator.of(context).pop();
      //             },
      //           ),
      //         ],
      //       );
      //     },
      //   );
      // }
    }
  }
}
