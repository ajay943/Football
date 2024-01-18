import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MyCompletedWinningRank extends StatefulWidget {
  const MyCompletedWinningRank({super.key});
  @override
  State<MyCompletedWinningRank> createState() => _MyCompletedWinningRankState();
}

class _MyCompletedWinningRankState extends State<MyCompletedWinningRank> {
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
          'INA vs ENG',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Container(
            height: 130.0,
            width: double.infinity,
            color: Colors.black,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 50.0), // Adjust right padding as needed
                          child: Container(
                            width: 45, // Set your desired width
                            height: 45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  0), // Set border radius as needed
                              image: DecorationImage(
                                image: CachedNetworkImageProvider(
                                    "https://images.entitysport.com/assets/uploads/2023/12/Rectangle-3461-2023-12-23T093509.580.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 50.0),
                          child: Text(
                            "IND",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                            ),
                          ),
                        )
                      ],
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text(
                          'vs',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 1.0),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 60.0), // Adjust right padding as needed
                          child: Container(
                            width: 45, // Set your desired width
                            height: 45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  0), // Set border radius as needed
                              image: DecorationImage(
                                image: CachedNetworkImageProvider(
                                    "https://images.entitysport.com/assets/uploads/2023/12/Rectangle-3461-2023-12-23T093509.580.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 60.0),
                          child: Text(
                            "AUS",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Text(
                  'COMPLETED',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Center(
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.1199,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height *
                            0.015, // Adjust the percentage as needed
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Divider(
                                  color: Colors
                                      .grey, // Color of the horizontal divider
                                  thickness:
                                      6.0, // Adjust the thickness as needed
                                ),
                                Text(
                                  "Prize Pool",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  "₹ 25000",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "Spots",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  "12",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "Entry",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  "₹ 1000",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height *
                            0.014, // Adjust the percentage as needed
                      ),
                      Divider(
                        color: Colors.grey, // Color of the horizontal divider
                        thickness: 1.0, // Adjust the thickness as needed
                      ),
                      // Adjust the height based on your design
                    ],
                  ))),
                  Container(
                    width: double.infinity,
                    height: 80.0,
                    color: Color.fromARGB(255, 51, 10, 86),
                    padding:
                        const EdgeInsets.only(bottom: 4, left: 19, right: 19),
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 5,
                          width: 67.0,
                          height: 70.0,
                          child: CircleAvatar(
                  radius: 50.0, // Adjust the radius as needed
                  backgroundColor: Colors.blue, // Background color of the circle
                  child: ClipOval(
                    child: Image.asset(
                      'assets/profileimage.png',
                      width: 70.0, // Adjust the width as needed
                      height: 70.0, // Adjust the height as needed
                      fit: BoxFit.cover,
                    ),
                  ),
                                  ),
                        ),
                        Positioned(
                          left: 83.0,
                          top: 20,
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "abhishek",
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          left: 83.0,
                          top: 23,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 210),
                                child: Row(
                                  children: [
                                    Text(
                                      "164 pts",
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
           Expanded(
            child: ListView.builder(
              itemCount: 11,
              itemBuilder: (context, index) {
                return 
                Card(
                  elevation: 0.5,
                  margin: EdgeInsets.all(0.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 70.0,
                    padding:
                        const EdgeInsets.only(bottom: 4, left: 19, right: 19),
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 3,
                          width: 67.0,
                          height: 80.0,
                          child: ClipOval(
                    child: Image.asset(
                      'assets/profileimage.png',
                      width: 70.0, // Adjust the width as needed
                      height: 70.0, // Adjust the height as needed
                      fit: BoxFit.cover,
                    ),
                  ),
                      ),
                        Positioned(
                          left: 83.0,
                          top: 20,
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "abhishek",
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          left: 83.0,
                          top: 23,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 210),
                                child: Row(
                                  children: [
                                    Text(
                                      "164 pts",
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
