
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loader_skeleton/loader_skeleton.dart';

class YourNewScreen extends StatefulWidget {
  @override
  _YourNewScreenState createState() => _YourNewScreenState();
}

class _YourNewScreenState extends State<YourNewScreen> {
  String responseData = "";
    bool isLoading = true;
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    var headers = {
      'Content-Type': 'application/json',
    };

    var url = Uri.parse('https://crickx.onrender.com/getRankPrice');

    try {
      var response = await http.post(
        url,
        headers: headers,
        body: json.encode({
          "contest_id": "6570287ec44254db03c35258",
        }),
      );

      if (response.statusCode == 200) {
        setState(() {
          responseData = utf8.decode(response.bodyBytes);
          isLoading = false;
        });
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your New Screen'),
        backgroundColor: Colors.red, // Set red background color
      ),
      body: 
      isLoading // Check if loading, show loader
                ? CardSkeleton(
                    isCircularImage: true,
                    isBottomLinesActive: true,
                  )
                : Column(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: 450,
              height: 200,
              child: Card(
                elevation: 5,
                margin: EdgeInsets.all(20),
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(
                    color: Colors.black,
                    width: 1.0,
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
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 130,
                            child: ElevatedButton(
                              onPressed: () {
                                // Add button click functionality
                                print("Button Pressed");
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.green,
                                padding: EdgeInsets.symmetric(vertical: 10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
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
            color: Colors.lightBlue,
            child: Table(
              border: TableBorder.all(
                color: Colors.transparent,
              ),
              children: [
                TableRow(
                  children: [
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Rank',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 110, top: 8.0),
                        child: Text(
                          'Winnings',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
                ...mapRanksAndPrices(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<TableRow> mapRanksAndPrices() {
    Map<String, dynamic> ranksAndPrices = getRanksAndPricesFromResponse();

    return ranksAndPrices.entries.map((entry) {
      return TableRow(
        children: [
          TableCell(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(entry.key),
            ),
          ),
          TableCell(
            child: Padding(
              padding: const EdgeInsets.only(left: 110, top: 8.0),
              child: Text(entry.value.toString()),
            ),
          ),
        ],
      );
    }).toList();
  }

  Map<String, dynamic> getRanksAndPricesFromResponse() {
    if (responseData.isNotEmpty) {
      Map<String, dynamic> jsonResponse = json.decode(responseData);
      return jsonResponse['data']['ranksAndPrices'];
    }
    return {};
  }
}

void main() {
  runApp(MaterialApp(
    home: YourNewScreen(),
  ));
}
