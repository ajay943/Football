import 'package:app/views/kyc.dart';
import 'package:flutter/material.dart';

class YourNewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your New Screen'),
      ),
      body: Column(
        children: [
          // First Row with Three Columns of Text
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     // Left Column
          //     Text("Left Column"),
          //     // Center Column
          //     Text("Center Column"),
          //     // Right Column
          //     Text("Right Column"),
          //   ],
          // ),
          // Card Section
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: 450, // Set the desired width
              height: 200, // Set the desired height
              child: Card(
                elevation: 5,
                margin: EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // Set border radius
                  side: BorderSide(
                    color: Colors.black, // Set border color
                    width: 1.0, // Set border width
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Prize Pool"),
                          RichText(
                            text: TextSpan(
                              text: 'Entry: ',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: '₹ 33',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "₹35 Lakhs",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 150, // Set the desired width
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    // builder: (context) => SidebarXExampleApp()),
                                      builder: (context) => KycScreen()),
                                  (route) => false,
                                );
                                // Add button click functionality
                                print("Button Pressed");
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.green,
                                padding: EdgeInsets.symmetric(vertical: 10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                              ),
                              child: RichText(
                                text: TextSpan(
                                  text: '₹',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: '49',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 0),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 223, 241, 220),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "₹1.5 Lakhs",
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(255, 139, 136, 136),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  "Flexible",
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.verified,
                                  color: Color.fromARGB(255, 195, 197, 195),
                                  size: 16,
                                ),
                                Text(
                                  "Guaranteed",
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: const Color.fromARGB(
                                        255, 125, 123, 123),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Second Row with Three Columns of Text
          Row(
            children: [
              // Text with space on the left
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Text(
                  "Winnings",
                  style: TextStyle(
                    color: Colors.blue, // Set text color to blue
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Left Column
                Text(
                  "Prize Pool",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 113, 112, 112),
                  ),
                ),
                // Center Column
                Text(
                  "Sports",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 113, 112, 112),
                  ),
                ),
                // Right Column
                Text(
                  "Joining Fee",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 113, 112, 112),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),

          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Left Column
                Text(
                  "₹1.5 Lakhs",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                // Center Column
                Container(
                  margin: EdgeInsets.only(right: 50),
                  child: Text(
                    "15000",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                // Right Column
                Text(
                  "₹10",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),

          Container(
            // Set background color to light blue
            color: Colors.lightBlue,
            child: Table(
              // Remove border
              border: TableBorder.all(
                color: Colors.transparent, // Set border color to transparent
              ),
              children: [
                TableRow(
                  children: [
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Rank',
                          style: TextStyle(color: Colors.black), // Text color
                        ),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 100, top: 8.0),
                        child: Text(
                          'Winnings',
                          style: TextStyle(color: Colors.black), // Text color
                        ),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Data 1'),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 110, top: 8.0),
                        child: Text('Data 2'),
                      ),
                    ),
                  ],
                ),
                // Add more TableRow widgets as needed
              ],
            ),
          )
        ],
      ),
    );
  }
}
