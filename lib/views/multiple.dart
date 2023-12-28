import 'dart:convert';
import 'package:app/views/wallet.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:loader_skeleton/loader_skeleton.dart';

class YourNewScreen extends StatefulWidget {
  final String contestId;
  const YourNewScreen({Key? key, required this.contestId}) : super(key: key);
  @override
  _YourNewScreenState createState() => _YourNewScreenState();
}

class _YourNewScreenState extends State<YourNewScreen> {
  String responseData = "";
  // bool rankData = true;
  bool isLoading = true;
  List<dynamic> suggestions = [];
  @override
  void initState() {
    super.initState();
    fetchPool(widget.contestId);
    fetchData(widget.contestId);
  }

  void fetchPool(String contestId) async {
    var headers = {
      'Content-Type': 'application/json',
    };
    var url = Uri.parse('https://crickx.onrender.com/getpool-contest');
    var response = await http.post(
      url,
      headers: headers,
      body: json.encode({
        "contest_id": contestId,
      }),
    );
    print("response$response[data]");
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      setState(() {
        suggestions = jsonResponse['data'];
        // isLoading = false;
      });
      print("hello$suggestions");
    } else {
      print(response.reasonPhrase);
    }
  }

  void fetchData(String contestId) async {
    var headers = {
      'Content-Type': 'application/json',
    };
    var url = Uri.parse('https://crickx.onrender.com/getRankPrice');
    try {
      var response = await http.post(
        url,
        headers: headers,
        body: json.encode({
          "contest_id": contestId,
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
    double width = MediaQuery.of(context).size.width;
    double buttonWidth = width * 0.2;
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 65),
              child: Text(
                'IND vs ENG',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 65),
              child: Text(
                '1d:21m left',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.white70,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              icon: Icon(Icons.account_balance_wallet, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WalletScreen(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      body: isLoading
          ? CardSkeleton(
              isCircularImage: true,
              isBottomLinesActive: true,
            )
          : Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Center(
                            child: Container(
                              height: 210,
                              width: 370,
                              child: Card(
                                elevation: 5,
                                shadowColor: Colors.grey,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                color: Colors.white,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: Container(
                                            height: 60,
                                            width: 362,
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  Color.fromARGB(
                                                      255, 169, 74, 228),
                                                  Color.fromARGB(255, 51, 10,
                                                      86), // End color
                                                ],
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                              ),
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10.0),
                                                topRight: Radius.circular(10.0),
                                              ),
                                            ),
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: 2,
                                                ),
                                                Text(
                                                  'Max Prize Pool',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.white54,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 2,
                                                ),
                                                Text(
                                                  '₹ 25000',
                                                  style: TextStyle(
                                                    fontSize: 25,
                                                    fontWeight: FontWeight.w900,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(height: 15),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 20, left: 20),
                                            child: LinearProgressIndicator(
                                              value: 0,
                                              backgroundColor: Colors.grey[300],
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                      const Color(0xFF8443BA)),
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 20, left: 20),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  '1,567 spots left',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                    color:
                                                        const Color(0xFF8443BA),
                                                  ),
                                                ),
                                                Text(
                                                  '2,000 spots',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.black54,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Center(
                                          child: SizedBox(
                                            height: 40,
                                            width: 250,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                print("Button Pressed");
                                              },
                                              style: ElevatedButton.styleFrom(
                                                primary: Colors.green,
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 10),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          4.0),
                                                ),
                                              ),
                                              child: RichText(
                                                text: TextSpan(
                                                  text: 'Entry: ₹',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                  ),
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                      text: "50",
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 12),
                                    Container(
                                      child: Container(
                                        height: 34,
                                        width: 370,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Color.fromARGB(255, 169, 74, 228),
                                              Color.fromARGB(
                                                  255, 51, 10, 86), // End color
                                            ],
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                          ),
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(10.0),
                                            bottomRight: Radius.circular(10.0),
                                          ),
                                        ),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 6,
                                            ),
                                            Text(
                                              'Max Prize Pool',
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white54,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          child: Column(
                            children: [
                              Divider(
                                color: const Color.fromARGB(221, 237, 236, 236),
                                thickness: 1.0,
                                height: 15.0,
                              ),
                              Table(
                                border: TableBorder.all(
                                  color: Colors.transparent,
                                ),
                                children: [
                                  TableRow(
                                    children: [
                                      TableCell(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, left: 10, bottom: 10),
                                          child: Text(
                                            'Rank',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ),
                                      ),
                                      TableCell(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 110, top: 10.0, bottom: 10),
                                          child: Text(
                                            'Winnings',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  ...mapRanksAndPrices(),
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

  List<TableRow> mapRanksAndPrices() {
    Map<String, dynamic> ranksAndPrices = getRanksAndPricesFromResponse();

    List<TableRow> tableRows = [];
    tableRows.add(
      TableRow(
        children: [
          TableCell(
            child: Divider(
              color: const Color.fromARGB(221, 237, 236, 236),
              thickness: 1.0,
              height: 15.0,
            ),
          ),
          TableCell(
            child: Divider(
              color: const Color.fromARGB(221, 237, 236, 236),
              thickness: 1.0,
              height: 15.0,
            ),
          ),
        ],
      ),
    );

    ranksAndPrices.entries.forEach((entry) {
      // Add a TableRow
      tableRows.add(
        TableRow(
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
        ),
      );

      // Add a Divider as a separate TableRow with two cells
      tableRows.add(
        TableRow(
          children: [
            TableCell(
              child: Divider(
                color: const Color.fromARGB(221, 237, 236, 236),
                thickness: 1.0,
                height: 15.0,
              ),
            ),
            TableCell(
              child: Divider(
                color: const Color.fromARGB(221, 237, 236, 236),
                thickness: 1.0,
                height: 15.0,
              ),
            ),
          ],
        ),
      );
    });

    return tableRows;
  }

  Map<String, dynamic> getRanksAndPricesFromResponse() {
    if (responseData.isNotEmpty) {
      Map<String, dynamic> jsonResponse = json.decode(responseData);
      return jsonResponse['data']['ranksAndPrices'];
    }
    return {};
  }
}
