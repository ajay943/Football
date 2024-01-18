import 'package:app/views/top_up.dart';
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class RazorPayPage extends StatefulWidget {
  final double enteredAmount;
  final String phone;
  const RazorPayPage({
    required this.enteredAmount,
     required this.phone,
  });
  @override
  State<RazorPayPage> createState() => _RazorPayPageState();
}

class _RazorPayPageState extends State<RazorPayPage> {
  late Razorpay razorpay;
  Future<void> makePostRequest() async {
  var url = Uri.parse('https://crickx.onrender.com/addBalance');
  var headers = {
    'Content-Type': 'application/json',
  };

  var body = json.encode({
    "phoneNumber": widget.phone,
    "amount": widget.enteredAmount.toInt(),
  });

  try {
    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print('Error: ${response.reasonPhrase}');
    }
  } catch (error) {
    print('Error: $error');
  }
}
  @override
  void initState() {
    super.initState();
    razorpay = Razorpay();
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentErrorResponse);
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccessResponse);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWalletSelected);
    _openRazorpay(widget.enteredAmount);
  }

  void _openRazorpay(double amount) {
    var options = {
      'key': 'rzp_test_kLcl21a6RHqZpK',
      'amount': (amount * 100).toInt(),
      'name': 'Funzy',
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
    razorpay.open(options);
  }

  void _handlePaymentErrorResponse(PaymentFailureResponse response) {
    _showAlertDialog(
      "Payment Failed",
      "Code: ${response.code}\nDescription: ${response.message}\nMetadata:${response.error.toString()}",
    );
  }

  void _handlePaymentSuccessResponse(PaymentSuccessResponse response) {
    makePostRequest();
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
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            ElevatedButton(
              child: const Text("Continue"),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TopUpScreen(),
                    ),
                  );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    razorpay.clear(); // Clear the event listeners
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Razorpay Page'),
      ),
      body: Center(
        child: Text('This is your Razorpay Page'),
      ),
    );
  }
}
