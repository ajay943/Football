import 'package:flutter/material.dart';

class TermsAndConditionsPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Terms & Conditions'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          // Your banner widget here
          Container(
            height: 200.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/slider1.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 16.0),
          // Your terms and conditions content
          Text(
            '1. Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 8.0),
          Text(
            '2. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 8.0),
          Text(
            '3. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.',
            style: TextStyle(fontSize: 16.0),
          ),
          // Add more terms and conditions as needed
        ],
      ),
    );
  }
}
