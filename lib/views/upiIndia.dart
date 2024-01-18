import 'package:flutter/material.dart';
import 'package:upi_india/upi_india.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  final double enteredAmount;
  final String phone;
   const HomePage({
    required this.enteredAmount,
    required this.phone,
  });
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<UpiResponse>? _transaction;
  UpiIndia _upiIndia = UpiIndia();
  List<UpiApp>? apps;

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

  TextStyle header = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  TextStyle value = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
  );

  @override
  void initState() {
    _upiIndia.getAllUpiApps(mandatoryTransactionId: false).then((value) {
      setState(() {
        apps = value;
      });
    }).catchError((e) {
      apps = [];
    });
    super.initState();
  }

  Future<UpiResponse> initiateTransaction(UpiApp app) async {
    return _upiIndia.startTransaction(
      app: app,
      receiverUpiId: "8892721109@ybl",
      receiverName: 'funzy11',
      transactionRefId: 'TestingUpiIndiaPlugin',
      transactionNote: 'Not actual. Just an example.',
      amount: widget.enteredAmount
    );
  }

  Widget displayUpiApps() {
    if (apps == null)
      return Center(child: CircularProgressIndicator());
    else if (apps!.length == 0)
      return Center(
        child: Text(
          "No apps found to handle transaction.",
          style: header,
        ),
      );
    else
      return Container(
        height: 300,
        color: Colors.transparent,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Wrap(
              children: apps!.map<Widget>((UpiApp app) {
                return GestureDetector(
                  onTap: () {
                    _transaction = initiateTransaction(app);
                    setState(() {});
                  },
                  child: Container(
                    height: 100,
                    width: 100,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.memory(
                          app.icon,
                          height: 60,
                          width: 60,
                        ),
                        Text(app.name),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      );
  }

  String _upiErrorHandler(error) {
    switch (error) {
      case UpiIndiaAppNotInstalledException:
        return 'Requested app not installed on device';
      case UpiIndiaUserCancelledException:
        return 'You cancelled the transaction';
      case UpiIndiaNullResponseException:
        return 'Requested app didn\'t return any response';
      case UpiIndiaInvalidParametersException:
        return 'Requested app cannot handle the transaction';
      default:
        return 'An Unknown error has occurred';
    }
  }

  void _checkTxnStatus(String status) {
    switch (status) {
      case UpiPaymentStatus.SUCCESS:
        makePostRequest();
        print('Transaction Successful');
        // RingPainter(progress: 100, taskCompletedColor: Colors.green, taskNotCompletedColor: Colors.red);
        break;
      case UpiPaymentStatus.SUBMITTED:
        print('Transaction Submitted');
        break;
      case UpiPaymentStatus.FAILURE:
        print('Transaction Failed');
        _transaction?.then((response) {
          if (response != null) {
            String errorText = _upiErrorHandler(response ?? '');
            print('Error Details: $errorText');
          }
        });
        break;
      default:
        print('Received an Unknown transaction status');
    }
  }

  Widget displayTransactionData(title, body) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("$title: ", style: header),
          Flexible(
              child: Text(
            body,
            style: value,
          )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UPI'),
      ),
      body: 
      Column(
        children: <Widget>[
          displayUpiApps(),      
        ],
      ),
    );
  }
}
