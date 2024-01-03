import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:flutter/material.dart';

class TopUpScreen extends StatefulWidget {
  const TopUpScreen({Key? key}) : super(key: key);

  @override
  State<TopUpScreen> createState() => _TopUpScreenState();
}

class _TopUpScreenState extends State<TopUpScreen> {
  TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  'Top - Up',
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
                            radius: 12.0,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.person,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(width: 15.0),
                          Text(
                            'TOP - UP',
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
                            'Enter Amount (Min ₹ 1 )',
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
                            // Padding(
                            //   padding: const EdgeInsets.only(
                            //     left: 40.0,
                            //   ), // Adjust the left margin for the hintText
                            //   child: VerticalDivider(
                            //     color: Colors.grey, // Adjust the color of the vertical divider
                            //     width: 2.0, // Adjust the width of the vertical divider
                            //   ),
                            // ),
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
                                              10.0), // Adjust the border radius
                                          border: Border.all(
                                            width:
                                                2.0, // Adjust the width of the border
                                            color: Colors
                                                .grey, // Adjust the color of the border
                                          ),
                                        ),
                                        child: TextFormField(
                                          controller: _amountController,
                                          decoration: InputDecoration(
                                            border: InputBorder
                                                .none, // No need for the default border
                                            hintText: 'Amount',
                                          ),
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
                          _buildAmountButton('₹100'),
                          SizedBox(width: 10.0),
                          _buildAmountButton('₹200'),
                          SizedBox(width: 10.0),
                          _buildAmountButton('₹500'),
                          SizedBox(width: 10.0),
                          _buildAmountButton('₹2000'),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Container at the bottom
          Positioned(
            bottom: 36,
            left: 21,
            right: 21,
            child: InkWell(
              onTap:() {
                 double enteredAmount = double.parse(_amountController.text);
                if (enteredAmount >= 1) {
                  _openRazorpay(enteredAmount);
                } else {
                  // Handle invalid amount
                  // You can show an error message or perform other actions
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
          borderRadius: BorderRadius.circular(10.0), // Adjust the border radius
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

   void _openRazorpay(double amount) {
    Razorpay razorpay = Razorpay();
    var options = {
      'key': 'rzp_test_kLcl21a6RHqZpK',
      'amount': (amount * 100).toInt(), // Convert amount to paise
      'name': 'abhi',
      'description': 'Fine T-Shirt',
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {
        'contact': '6200345898',
        'email': 'test@razorpay.com',
      },
      'external': {
        'wallets': ['paytm'],
      },
    };
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentErrorResponse);
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccessResponse);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWalletSelected);
    razorpay.open(options);
  }

  void _handlePaymentErrorResponse(PaymentFailureResponse response) {
    _showAlertDialog(
      "Payment Failed",
      "Code: ${response.code}\nDescription: ${response.message}\nMetadata:${response.error.toString()}",
    );
  }

  void _handlePaymentSuccessResponse(PaymentSuccessResponse response) {
    _showAlertDialog(
      "Payment Successful",
      "Payment ID: ${response.paymentId}",
    );
  }

  void _handleExternalWalletSelected(ExternalWalletResponse response) {
    _showAlertDialog(
      "External Wallet Selected",
      "${response.walletName}",
    );
  }

  void _showAlertDialog(String title, String message) {
    Widget continueButton = ElevatedButton(
      child: const Text("Continue"),
      onPressed: () {},
    );
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        continueButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

}
