import 'package:flutter/material.dart';

void main() {
  runApp(WalletApp());
}

class WalletApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WalletScreen(),
    );
  }
}

class WalletScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            WalletCard(),
            SizedBox(height: 16),
            CustomCard(
              label1: 'Cash Deposit',
              value1: '\₹0',
              label2: 'Net Winnings',
              value2: '\₹0',
              label3: 'Cashback',
              value3: '\₹0',
              label4: 'Withdwawk',
              value4: '\₹0',
            ),
          ],
        ),
      ),
    );
  }
}

class WalletCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.blue,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppBar(
            automaticallyImplyLeading: false,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                // Handle back button press
                Navigator.pop(context);
              },
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          Center(
            child: Text(
              'Available Balance',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
          SizedBox(height: 8),
          Center(
            child: Text(
              '\₹5,000.00',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Handle Withdrawal
                },
                child: Text('Withdraw'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle Top-Up
                },
                child: Text('Top-Up'),
              ),
            ],
          ),
       
        ],
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String label1;
  final String value1;
  final String label2;
  final String value2;
  final String label3;
  final String value3;
  final String label4;
  final String value4;

  const CustomCard({
    required this.label1,
    required this.value1,
    required this.label2,
    required this.value2,
    required this.label3,
    required this.value3,
    required this.label4,
    required this.value4,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 8),
          CardField(label: label1, value: value1),
          SizedBox(height: 8),
          CardField(label: label2, value: value2),
          SizedBox(height: 8),
          CardField(label: label3, value: value3),
          SizedBox(height: 8),
          CardField(label: label4, value: value4),
        ],
      ),
    );
  }
}

class CardField extends StatelessWidget {
  final String label;
  final String value;

  const CardField({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          value,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),

        SizedBox(height: 2),
        Text(
          label,
          style: TextStyle(
            color: Colors.black,
            fontSize: 10,
          ),
        ),

      ],
    );
  }
}
