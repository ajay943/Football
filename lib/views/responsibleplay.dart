import 'package:flutter/material.dart';

class ResponsiblePlayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Responsible Play'),
      ),
      body: ListView(
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
          // Your responsible play content
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Responsible Play Guidelines:',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                Text(
                  '1. Play for fun, not to chase losses.',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 8.0),
                Text(
                  '2. Set a budget and stick to it.',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 8.0),
                Text(
                  '3. Take breaks and avoid excessive play.',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 8.0),
                // Add more responsible play guidelines as needed
              ],
            ),
          ),
        ],
      ),
    );
  }
}
