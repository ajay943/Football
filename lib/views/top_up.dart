// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'razerpay.dart'; // Import your Razorpay page

// class TopUpScreen extends StatefulWidget {
//   @override
//   _TopUpScreenState createState() => _TopUpScreenState();
// }

// class _TopUpScreenState extends State<TopUpScreen> {
//   TextEditingController controller = TextEditingController(); // Add controller

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Top - Up',
//           style: TextStyle(color: Colors.white),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.red,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 Text(
//                   'TOP - UP',
//                   style: TextStyle(
//                     fontSize: 18.0,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 8.0),
//                 Text(
//                   'Enter Amount (Min ₹1)',
//                   style: TextStyle(
//                     fontSize: 16.0,
//                     color: Colors.grey,
//                   ),
//                 ),
//               ],
//             ),
//             TextField(
//               controller: controller,
//               keyboardType: TextInputType.numberWithOptions(decimal: true),
//               inputFormatters: <TextInputFormatter>[
//                 FilteringTextInputFormatter.digitsOnly,
//               ],
//               decoration: InputDecoration(
//                 labelText: 'Enter Numeric Value',
//               ),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => MyHomePage(),
//                   ),
//                 );
//               },
//               style: ElevatedButton.styleFrom(
//                 minimumSize: Size(double.infinity, 50),
//                 primary: Colors.yellow,
//               ),
//               child: Text('Add Money'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class TopUpScreen extends StatefulWidget {
  @override
  _TopUpScreenState createState() => _TopUpScreenState();
}

class _TopUpScreenState extends State<TopUpScreen> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Top - Up',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'TOP - UP',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Enter Amount (Min ₹1)',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            TextField(
              controller: controller,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ],
              // decoration: InputDecoration(
              //   labelText: 'Enter Numeric Value',
              // ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                double enteredAmount = double.parse(controller.text);
                if (enteredAmount >= 1) {
                  _openRazorpay(enteredAmount);
                } else {
                  // Handle invalid amount
                  // You can show an error message or perform other actions
                }
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                primary: Colors.yellow,
              ),
              child: Text('Add Money'),
            ),
          ],
        ),
      ),
    );
  }

  void _openRazorpay(double amount) {
    Razorpay razorpay = Razorpay();
    var options = {
      'key': 'rzp_live_ILgsfZCZoFIKMb',
      'amount': (amount * 100).toInt(), // Convert amount to paise
      'name': 'Acme Corp.',
      'description': 'Fine T-Shirt',
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {
        'contact': '8888888888',
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
