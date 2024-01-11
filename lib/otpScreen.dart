import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:google_fonts/google_fonts.dart';
import '../services/api_service.dart';
import 'package:app/phone.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:app/maincricket.dart';

class OtpScreen extends StatefulWidget {
  final int randomNumber;
  final String phoneNumber;
  OtpScreen(this.randomNumber, this.phoneNumber);
  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController otpController = TextEditingController();
  bool _resendButtonEnabled = false;
  int _currentSecond = 60;
  Timer? _timer;
  var optSent = '';
  @override
  void initState() {
    super.initState();
    otpPin = widget.randomNumber;
    phoneNumber = widget.phoneNumber;
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_currentSecond > 0) {
          _currentSecond--;
        } else {
          _resendButtonEnabled = true;
          _timer?.cancel();
        }
      });
    });
  }

  void resetTimer() {
    setState(() {
      _currentSecond = 60;
      _resendButtonEnabled = false;
    });
    startTimer();
  }

  String userEnterOtp = '';
  var otpPin;
  var phoneNumber;
  var sender;
  var apikey;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    image: AssetImage("assets/otp.png"),
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * .46,
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 25),
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: Text(
                              "Please enter the OTP sent to",
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          SizedBox(height: 2),
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: Row(
                              children: [
                                Text(
                                  '+91 - ${widget.phoneNumber}',
                                  style: GoogleFonts.notoSans(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SignInNewScreen(),
                                      ),
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.edit_outlined,
                                    color: Colors.white,
                                    size: 27,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 60, right: 60),
                              child: PinCodeTextField(
                                length: 4,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(4),
                                ],
                                textStyle: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                                controller: otpController,
                                onChanged: (value) {
                                  setState(() {
                                    userEnterOtp = value;
                                  });
                                },
                                appContext: context,
                                pinTheme: PinTheme(
                                  shape: PinCodeFieldShape.box,
                                  borderRadius: BorderRadius.circular(10),
                                  fieldHeight: 50,
                                  fieldWidth: 50,
                                  inactiveColor: Colors.white,
                                  activeColor: Colors.white,
                                  selectedColor: Colors.white,
                                  activeFillColor: Colors.white,
                                  selectedFillColor: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.only(left: 45, right: 45),
                              child: Row(
                                children: [
                                  Text(
                                    "Didn't receive OTP?",
                                    style: GoogleFonts.notoSans(
                                      fontSize: MediaQuery.of(context).size.width * 0.032,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    ),
                                  ),
                                  _resendButtonEnabled
                                      ? GestureDetector(
                                          onTap: () {
                                            if (_resendButtonEnabled) {
                                              setState(() {
                                                if (_formKey.currentState!
                                                    .validate()) {
                                                  resetTimer();
                                                  ApiService.otpApi(
                                                    apikey,
                                                    sender,
                                                    phoneNumber,
                                                    otpPin,
                                                  ).then((value) async {
                                                    var res = value;
                                                    print("secondScreen_$res");
                                                    print(
                                                        "success==>${res['status']}");
                                                    setState(() {
                                                      optSent = res['status'];
                                                    });
                                                  });
                                                }
                                              });
                                            }
                                          },
                                          child: Text(
                                            ' Resend OTP',
                                            style: GoogleFonts.notoSans(
                                              decoration:
                                                  TextDecoration.underline,
                                              fontSize: MediaQuery.of(context).size.width * 0.032,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white,
                                            ),
                                          ),
                                        )
                                      : Text(
                                          " Resend in $_currentSecond Seconds",
                                          style: GoogleFonts.notoSans(
                                            fontSize: MediaQuery.of(context).size.width * 0.032,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white,
                                          ),
                                        ),
                                ],
                              ),
                            ),
                          ),
                          Center(
                            child: GestureDetector(
                              onTap: () {
                                _submitForm();
                              },
                              child: Container(
                                margin: const EdgeInsets.only(top: 45),
                                height: 40,
                                width: MediaQuery.of(context).size.width * .50,
                                decoration: const BoxDecoration(
                                  color: Color(0xFF8443BA),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                child: Center(
                                  child: Text(
                                    'Verify OTP',
                                    style: GoogleFonts.notoSans(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: const Color(0xffFFFFFF),
                                    ),
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
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => MainPage()),
          (route) => false,
        );
      // if (otpPin.toString() == userEnterOtp.toString()) {
      //   Navigator.pushAndRemoveUntil(
      //     context,
      //     MaterialPageRoute(builder: (context) => MainPage()),
      //     (route) => false,
      //   );
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Invalid OTP'),
              actions: <Widget>[
                ElevatedButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    }
  }
// }
