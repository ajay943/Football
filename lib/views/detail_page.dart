import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:app/views/detail_page.dart';
import 'package:app/views/playercards.dart';
import 'package:app/views/wallet.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:app/services/match_datail_service.dart';
import 'multiple.dart';
import '../services/api_service.dart';


class MatchDetailPage extends StatefulWidget {
  final int matchId;
  const MatchDetailPage({Key? key, required this.matchId}) : super(key: key);
  @override
  State<MatchDetailPage> createState() => _MatchDetailPageState();
}

class _MatchDetailPageState extends State<MatchDetailPage> {
  var MatchData;
  bool isLoaded = true;

  List<dynamic> suggestions = [];
  @override
  void initState() {
    super.initState();
    fetchData(widget.matchId);
  }

  void fetchData(int matchId) async {
    var headers = {
      'Content-Type': 'application/json',
    };

    var url = Uri.parse('https://crickx.onrender.com/getpool-contest');

    var response = await http.post(
      url,
      headers: headers,
      body: json.encode({
        "match_id": matchId,
      }),
    );
    print("response$response[data]");

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);

      setState(() {
        suggestions = jsonResponse['data'];
      });
      print("hello$suggestions");
      // You can parse the response JSON here if needed
    } else {
      print(response.reasonPhrase);
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double buttonWidth = width * 0.2;

    if (isLoaded) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Cricket Khelo',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          backgroundColor: Colors.red,
          centerTitle: true,
          elevation: 10,
          toolbarHeight: 60,
          shape: const RoundedRectangleBorder(
            borderRadius:
                BorderRadius.vertical(bottom: Radius.elliptical(1, 1)),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                height: 200,
                width: double.infinity,
                child: Image.asset(
                  'assets/bannerImage.webp',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              _buildInfiniteCardList(buttonWidth),
              Container(
                width: double.infinity,
              ),
            ],
          ),
        ),
        floatingActionButton: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding:
                const EdgeInsets.only(bottom: 2.0), // Add some bottom padding
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    child: FloatingActionButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TeamSelectionScreen(),
                          ),
                        );
                      },
                      backgroundColor: Colors.green,
                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Text('Choose Team'),
                      ),
                    ),
                  ),
                ),
                // SizedBox(width: 4), // Add some space between the buttons
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: FloatingActionButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TeamSelectionScreen(),
                          ),
                        );
                      },
                      backgroundColor: Colors.blue,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text('Create Team'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.deepOrangeAccent,
            strokeWidth: 7,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.deepOrangeAccent),
          ),
        ),
      );
    }
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
                    // Navigate to a new screen when the card is pressed
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => YourNewScreen(),
                      ),
                    );
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
                                      // Add any other styling properties as needed
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
                                      // children: <TextSpan>[
                                      //   TextSpan(
                                      //     text: element['entry_fee'].toString(),
                                      //     style: TextStyle(
                                      //       fontSize: 14,
                                      //       fontWeight: FontWeight.bold,
                                      //       color: Colors.green,
                                      //     ),
                                      //   ),
                                      // ],
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
                                    "₹35 Lakhs",
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    width: buttonWidth,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        // Add button click functionality
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
                                padding: EdgeInsets.all(10),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 223, 241, 220),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "₹1.5 Lakhs",
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        color: const Color.fromARGB(
                                            255, 139, 136, 136),
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
