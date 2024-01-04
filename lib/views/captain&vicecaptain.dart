import 'package:flutter/material.dart';

class Captain extends StatefulWidget {
  const Captain({super.key});

  @override
  State<Captain> createState() => _CaptainState();
}

class _CaptainState extends State<Captain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop(); // Add navigation logic here
          },
        ),
        title: Text(
          'Create team',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Text("Choose your Captain and Vice Captain",
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              )),
          Text("C gets 2X points, VC gets 1.5X points",
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              )),
          SizedBox(
            height: 10,
          ),
          Card(
            elevation: 0.5,
            margin: EdgeInsets.all(0.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
            ),
            child: Container(
              width: double.infinity,
              height: 30.0,
              padding: const EdgeInsets.only(bottom: 0, left: 16, right: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 90.0,
                        height: 15.0,
                        margin: EdgeInsets.only(
                            left: 8.0), // Adjust the padding value as needed
                        child: Text(
                          'SELECTED BY',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Container(
                        width: 50.0,
                        height: 15.0,
                        margin: EdgeInsets.only(left: 130.0),
                        child: Text(
                          '% C BY',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Container(
                        width: 40.0,
                        height: 15.0,
                        margin: EdgeInsets.only(
                            right: 0.0), // Adjust the margin value as needed
                        child: Text(
                          '% VC BY',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: .5), // Add some space between the cards
          Card(
            elevation: 0.5,
            margin: EdgeInsets.all(0.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
            ),
            child: Container(
              width: double.infinity,
              height: 80.0,
              padding: const EdgeInsets.only(bottom: 4, left: 19, right: 19),
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    width: 67.0,
                    height: 80.0,
                    child: Image.asset(
                      'assets/image.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  // Positioned(
                  //   left: 0.0, // Adjust the left margin as needed
                  //   bottom: 2.0,
                  //   child: Row(
                  //     children: [
                  //       Container(
                  //         padding: EdgeInsets.symmetric(
                  //             horizontal: 10.0, vertical: 2.0),
                  //         decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(2.0),
                  //           color: Colors.black,
                  //         ),
                  //         child: Text(
                  //           'IND',
                  //           style: TextStyle(
                  //             fontSize: 8.0,
                  //             color: Colors.white,
                  //             fontWeight: FontWeight.bold,
                  //           ),
                  //         ),
                  //       ),
                  //       SizedBox(
                  //           width:
                  //               1.0), // Add some space between 'IND' and 'WK'
                  //       Container(
                  //         padding: EdgeInsets.symmetric(
                  //             horizontal: 10.0, vertical: 2.0),
                  //         decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(2.0),
                  //           color: Color.fromARGB(255, 89, 14, 117),
                  //         ),
                  //         child: Text(
                  //           'WK',
                  //           style: TextStyle(
                  //             fontSize: 8.0,
                  //             color: Colors.white,
                  //             fontWeight: FontWeight.bold,
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  Positioned(
                    left: 83.0,
                    top: 30,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Rishabh Pant',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                            width:
                                80.0), // Adjust the space between 'Rishabh Pant' and circles
                        Row(
                          children: [
                            // Pressable Container for 'C' with text below
                            GestureDetector(
                              onTap: () {
                                // Handle the 'C' button press
                                print('C button pressed');
                              },
                              child: Container(
                                width: 30.0,
                                height:
                                    30.0, // Increased height to avoid overflow
                                child: Column(
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 50.0,
                                      height:
                                          30.0, // Adjusted height of the circle
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Colors.grey,
                                          width: 1.0,
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'C',
                                          style: TextStyle(
                                            fontSize: 15.0,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                                width:
                                    30.0), // Add some space between 'C' and 'VC'
                            // Pressable Container for 'VC' with text below
                            GestureDetector(
                              onTap: () {
                                // Handle the 'VC' button press
                                print('VC button pressed');
                              },
                              child: Container(
                                width: 30.0,
                                height:
                                    30.0, // Increased height to avoid overflow
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 50.0,
                                      height:
                                          30.0, // Adjusted height of the circle
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Colors.grey,
                                          width: 1.0,
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'VC',
                                          style: TextStyle(
                                            fontSize: 15.0,
                                            color: Colors.black,
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
