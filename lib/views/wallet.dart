import 'package:app/views/top_up.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loader_skeleton/loader_skeleton.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);
  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  late String phone;
  late String balance;
  bool isLoading = true;

  Future<void> balanceData() async {
    var headers = {'Content-Type': 'application/json'};
    var request =
        http.Request('POST', Uri.parse('https://crickx.onrender.com/balance'));
    request.body = json.encode({
      "phoneNumber": phone,
    });
    request.headers.addAll(headers);
    try {
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(await response.stream.bytesToString());
        setState(() {
          balance = (jsonResponse['balance']).toString();
          isLoading = false;
        });
        print(await response.stream.bytesToString());
      } else {
        print(response.reasonPhrase);
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  _isLoggedIn() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var phoneNumber = pref.getString('phoneNumber');
    setState(() {
      phone = phoneNumber!;
    });
  }

  @override
  void initState() {
    super.initState();
    _isLoggedIn();
    Future.delayed(Duration(seconds: 1), () {
      balanceData();
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return isLoading
        ? CardSkeleton(
            isCircularImage: true,
            isBottomLinesActive: true,
          )
        : Scaffold(
            body: Stack(
              children: [
                Container(
                  color: Colors.white,
                  width: double.infinity,
                  height: double.infinity,
                ),
                Positioned(
                  top: 0,
                  height: 83.0,
                  left: 0,
                  right: 0,
                  child: AppBar(
                    backgroundColor: Colors.black,
                    elevation: 0,
                    leading: IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    title: Padding(
                      padding: EdgeInsets.only(
                        left: screenWidth < 400 ? 24.0 : 77.0,
                        top: 0.0,
                      ),
                      child: Text(
                        'My Wallet',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 82,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      Container(
                        height: screenWidth < 400 ? 217.0 : 217.0,
                        width: screenWidth < 400 ? screenWidth : 400.0,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFF8745C0),
                              Color(0xFF351A58),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(50.0),
                            bottomRight: Radius.circular(50.0),
                          ),
                        ),
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Available Balance',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                balance,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(height: 16.0),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: screenWidth < 400
                                        ? screenWidth / 2 - 24
                                        : 170.0,
                                    height: 39,
                                    child: Container(
                                      margin: EdgeInsets.only(
                                        left: screenWidth < 400 ? 24.0 : 34.0,
                                      ),
                                      child: FloatingActionButton(
                                        onPressed: () {
                                          // Add your logic for the left FloatingActionButton
                                        },
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Withdraw',
                                              style: TextStyle(
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                        backgroundColor: Colors.transparent,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          side: BorderSide(
                                            color: Colors.white,
                                            width: 1.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: screenWidth < 400
                                        ? screenWidth / 2 - 24
                                        : 180.0,
                                    height: 39,
                                    child: Container(
                                      margin: EdgeInsets.only(
                                        right: screenWidth < 400 ? 24.0 : 34.0,
                                      ),
                                      child: FloatingActionButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  TopUpScreen(),
                                            ),
                                          );
                                        },
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Top-Up',
                                              style: TextStyle(
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(
                                                    255, 156, 31, 181),
                                              ),
                                            ),
                                          ],
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          side: BorderSide(
                                            color: Colors.white,
                                            width: 1.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 16.0),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 30.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            '₹ 0',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '₹ 0',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '₹ 0',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '₹ 0',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 2.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Cash Deposit',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 10.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Net Winnings',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 10.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Cashback',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 10.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Withdraw',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 10.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}
