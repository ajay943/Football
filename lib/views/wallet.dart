import 'package:flutter/material.dart';

class WalletScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Add navigation functionality as needed
          },
        ),
        title: Text('Wallet'),
      ),
      body: Card(
        elevation: 5,
        child: Column(
          children: [
            Container(
              color: Colors.blue, // Blue color for the container
              height: 300, // Adjust the height as needed
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Left Button
                    ElevatedButton(
                      onPressed: () {
                        // Handle left button press
                      },
                      child: Text('Left Button'),
                    ),
                    
                    // Right Button
                    ElevatedButton(
                      onPressed: () {
                        // Handle right button press
                      },
                      child: Text('Right Button'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
