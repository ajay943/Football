import 'package:flutter/material.dart';

class TopUpScreen extends StatefulWidget {
  @override
  _TopUpScreenState createState() => _TopUpScreenState();
}

class _TopUpScreenState extends State<TopUpScreen> {
  TextEditingController amountController = TextEditingController();
  double currentBalance = 100.0; // Replace with actual user balance

  @override
  Widget build(BuildContext context) {
    var condition;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Top - Up',
          style: TextStyle(color: Colors.white), // Set text color to red
        ),
        centerTitle: true, // Center the title
        backgroundColor: Colors.red, // Set the background color to red
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
                SizedBox(height: 8.0), // Add some space between the two lines
                Text(
                  'Enter Amount (Min ₹1)',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.grey), // Set the border color to grey
                borderRadius: BorderRadius.circular(
                    8.0), // Optionally, set border radius for rounded corners
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: amountController,
                      decoration: InputDecoration(
                        labelText: condition ?? false ? 'Custom Label' : null,
                        labelStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.zero,
                      ),
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Instant',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10.0),
            Row(
              children: [
                Container(
                  height: 40.0,
                  width: 105.0,
                  margin: EdgeInsets.all(5.0),
                  child: ElevatedButton(
                    onPressed: () {
                      topUp();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(
                          255, 210, 209, 209), // Background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            1.0), // Rectangular shape with border radius
                      ),
                    ),
                    child: Text(
                      '₹100',
                      style: TextStyle(
                        color: Color.fromARGB(255, 93, 92, 92),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 40.0,
                  width: 105.0,
                  margin: EdgeInsets.all(5.0),
                  child: ElevatedButton(
                    onPressed: () {
                    },
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(
                          255, 204, 203, 203), // Background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            1.0), // Rectangular shape with border radius
                      ),
                    ),
                    child: Text(
                      '₹500',
                      style: TextStyle(
                        color: Color.fromARGB(255, 103, 102, 102),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 40.0,
                  width: 105.0,
                  margin: EdgeInsets.all(5.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle the onPressed for the third button
                    },
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(
                          255, 206, 204, 204), // Background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            1.0), // Rectangular shape with border radius
                      ),
                    ),
                    child: Text(
                      '₹2000',
                      style: TextStyle(
                        color: Color.fromARGB(255, 96, 95, 95),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void topUp() {
    // Validate the amount
    if (amountController.text.isNotEmpty) {
      double topUpAmount = double.tryParse(amountController.text) ?? 0.0;

      // Update the user's balance
      setState(() {
        currentBalance += topUpAmount;
      });

      // Optionally, you can implement logic to update the backend or perform other actions.
    }
  }
}
