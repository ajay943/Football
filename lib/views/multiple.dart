import 'dart:convert';
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
        title: Text('Rank & Winnings'),
        backgroundColor: Colors.red,
      ),
      body: 
      isLoading
          ? CardSkeleton(
              isCircularImage: true,
              isBottomLinesActive: true,
            )
          : 
          Column(
              children: [
                _buildInfiniteCardList(buttonWidth), 
                Text("Rank & Winnings"),
                // isLoading ? Text("comming Soon") :
                Container(
                  color: Colors.amber,
                  child: Table(
                    border: TableBorder.all(
                      color: Colors.transparent,
                    ),
                    children: [
                      TableRow(
                        children: [
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: Text(
                                'Rank',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 110, top: 30.0),
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

  Widget _buildInfiniteCardList(double buttonWidth) {
    return Expanded(
      child: ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          var element = suggestions[index];
          return Column(
            children: [
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => YourNewScreen(
                    //       contestId: element["_id"],
                    //     ),
                    //   ),
                    // );
                  },
                  child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Card(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Container(
                          padding: const EdgeInsets.only(top: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Prize ",
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: 'Entry ',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 1),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    element['price_pool'].toString(),
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    width: buttonWidth,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        print("Button Pressed");
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.green,
                                        padding:
                                            EdgeInsets.symmetric(vertical: 10),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4.0),
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
                                              text: element['entry_fee']
                                                  .toString(),
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
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                padding: EdgeInsets.all(0),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 223, 241, 220),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        Fluttertoast.showToast(
                                          msg: 'Winning percentage',
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.black,
                                          textColor: Colors.white,
                                          fontSize: 16.0,
                                        );
                                      },
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.emoji_events,
                                            color: Colors.black,
                                            size: 16,
                                          ),
                                          SizedBox(width: 6),
                                          Text(
                                            '${element['winning_spots_precent'].toString()}%',
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(
                                          Icons.verified,
                                          color: Color.fromARGB(
                                              255, 195, 197, 195),
                                          size: 16,
                                        ),
                                        Text(
                                          '${element['done_spots'].toString()}/${element['total_spots'].toString()}',
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
                      )),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
