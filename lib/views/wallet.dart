import 'package:app/views/top_up.dart';
import 'package:flutter/material.dart';
class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);
  @override
  State<WalletScreen> createState() => _WalletScreenState();
}
class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.white, // Set the background color or use an image
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            top: 0,
            height:83.0,
            left: 0,
            right: 0,
            child: AppBar(
              backgroundColor: Colors.black,
              elevation: 0,
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.of(context).pop(); // Add navigation logic here
                },
              ),
              // centerTitle: true,
              title: Padding(
                padding: EdgeInsets.only(
                  left: 77.0,
                  top: 0.0,
                ),
                child: Text(
                  'My Wallet',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          // Container on top with specified height, width, and border radius at the bottom
          Positioned(
            top: 82,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Container(
                  height: 217.0,
                  width: 400.0,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF8745C0), Color(0xFF351A58)],
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
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '₹ 5,000.00',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 16.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Positioned(
                                left: 16.0,
                                child: SizedBox(
                                  width: 180.0,
                                  height: 39,
                                  child: Container(
                                    margin: EdgeInsets.only(left: 34.0),
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
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      backgroundColor: Colors.transparent,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                        side: BorderSide(
                                            color: Colors.white, width: 1.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 16.0,
                                child: SizedBox(
                                  width: 180.0,
                                  height: 39,
                                  child: Container(
                                    margin: EdgeInsets.only(right: 34.0),
                                    child: FloatingActionButton(
                                      onPressed: () {
                                        Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => TopUpScreen(),
                                          // builder: (context) => MatchDetailPage( matchId: 12345),
                                        ),
                                      );
                                        // Add your logic for the right FloatingActionButton
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
                                        borderRadius: BorderRadius.circular(10.0),
                                        side: BorderSide(
                                            color: Colors.white, width: 1.0),
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
                    // ),
                  ),
                ),
                SizedBox(height: 30.0),
                // New Row outside the Container
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