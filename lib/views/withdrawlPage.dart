import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class withdrawPage extends StatefulWidget {
  const withdrawPage({super.key});

  @override
  State<withdrawPage> createState() => _withdrawPageState();
}

class _withdrawPageState extends State<withdrawPage> {
  TextEditingController _amountController = TextEditingController();
  late String phone;
  @override
  void initState() {
    super.initState();
    _isLoggedIn();
  }

  _isLoggedIn() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var phoneNumber = pref.getString('phoneNumber');
    setState(() {
      phone = phoneNumber!;
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                  Navigator.of(context).pop(); // Add navigation logic here
                },
              ),
              title: Padding(
                padding: EdgeInsets.only(
                  left: 7.0,
                  top: 0.0,
                ),
                child: Text(
                  'Withdraw',
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
                Stack(
                  children: [
                    Container(
                      height: 300.0,
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
                    ),
                    Positioned(
                      top: 40,
                      left: 21,
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 15.0,
                            backgroundColor: Colors.white,
                           backgroundImage: AssetImage('assets/withdraw1.png'),
                          ),
                          SizedBox(width: 15.0),
                          Text(
                            'Withdraw',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 70,
                      left: 21,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10.0),
                          Text(
                            'Enter Amount (Min ₹ 100 )',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 120,
                      left: 21,
                      right: 21,
                      child: Container(
                        width: 350.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(
                              10.0), // Adjust the border radius
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      10.0), // Adjust the border radius
                                  color: Colors
                                      .transparent, // Background color of the entire row
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            left:
                                                10.0), // Padding for the TextFormField
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              10.0),  
                                          border: Border.all(
                                            width:
                                                2.0,  
                                            color: Colors
                                                .grey, 
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            SizedBox(width: 3.0),
                                            Text(
                                              '\u20B9', 
                                              style: TextStyle(
                                                  fontSize: 25.0,
                                                  color: Colors
                                                      .white),
                                            ),
                                            SizedBox(width: 15.0),
                                            VerticalDivider(
                                              thickness:
                                                  1.0, 
                                              color: Colors
                                                  .white, 
                                            ),
                                            SizedBox(
                                                width:
                                                    10.0), 
                                            Expanded(
                                              child: TextFormField(
                                                controller: _amountController,
                                                keyboardType:
                                                    TextInputType.number,
                                                style: TextStyle(
                                                    color: Colors
                                                        .white), 
                                                decoration: InputDecoration(
                                                  hintText: 'Amount',
                                                  hintStyle: TextStyle(
                                                      color: Colors.white,
                                                      fontSize:
                                                          18), // 
                                                  border: InputBorder.none,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 190,
                      left: 21,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10.0),
                          Text(
                            'Instant',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 230,
                      left: 21,
                      child: Row(
                        children: [
                          _buildAmountButton('100'),
                          SizedBox(width: 10.0),
                          _buildAmountButton('200'),
                          SizedBox(width: 10.0),
                          _buildAmountButton('500'),
                          SizedBox(width: 10.0),
                          _buildAmountButton('2000'),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 36,
            left: 21,
            right: 21,
            child: InkWell(
              onTap: () {
                double enteredAmount = double.parse(_amountController.text);
                if (enteredAmount >= 100) {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => PaymentGetwayList(
                  //       enteredAmount: enteredAmount,
                  //       phone : phone
                  //     ),
                  //   ),
                  // );
                } else {
                  // Handle invalid amount
                }
              },
              child: Container(
                height: 50.0,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF8745C0), Color(0xFF351A58)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Center(
                  child: Text(
                    'Proceed',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
       
        ],
      ),
    );
 
  }

  Widget _buildAmountButton(String amount) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _amountController.text = amount;
        });
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.white, // Button background color
        onPrimary: Colors.black, // Text color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0), 
        ),
      ),
      child: Text(
        amount,
        style: TextStyle(
          fontWeight: FontWeight.bold, // Make the text bold
        ),
      ),
    );
  }

}