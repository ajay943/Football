import 'dart:convert';
import 'package:app/views/stadium.dart';
import 'package:http/http.dart' as http;
import 'package:app/views/detail_page.dart';
import 'package:app/views/playercards.dart';
import 'package:app/views/wallet.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:app/services/match_datail_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'multiple.dart';
import '../services/api_service.dart';
import 'package:loader_skeleton/loader_skeleton.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MatchDetailPage extends StatefulWidget {
  final int matchId;
  final int competition;
  final String short_title;
  final String date_start_ist;
  const MatchDetailPage(
      {Key? key,
      required this.matchId,
      required this.short_title,
      required this.date_start_ist,
      required this.competition})
      : super(key: key);
  @override
  State<MatchDetailPage> createState() => _MatchDetailPageState();
}

class _MatchDetailPageState extends State<MatchDetailPage> {
  var MatchData;
  bool isLoading = true;
  late final int totalSports;
  late final int filledSports;
  late DateTime matchDateTime;
  late String phone;
  late String contest_id;
  late Duration timeDifference;
  late String formattedTimer;

  // double progress = filledSports / totalSports;
  List<dynamic> suggestions = [];
  List<dynamic> teams = [];

  @override
  void initState() {
    super.initState();

    _isLoggedIn();
    matchDateTime = DateTime.parse(widget.date_start_ist);

    // Calculate the difference between the current time and the match time
    timeDifference = matchDateTime.difference(DateTime.now());

    // Format the timer
    formattedTimer =
        '${timeDifference.inDays}d:${(timeDifference.inHours % 24)}h:${(timeDifference.inMinutes % 60)}m';
    fetchData(widget.matchId);
  }

  _isLoggedIn() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var phoneNumber = pref.getString('phoneNumber');
    setState(() {
      phone = phoneNumber!;
    });
  }

  void fetchData(int matchId) async {
    var headers = {
      'Content-Type': 'application/json',
    };
    var url = Uri.parse('https://crickx.onrender.com/getpool');
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
        isLoading = false;
      });
      print("hello$suggestions");
    } else {
      print(response.reasonPhrase);
    }
  }

  Future<void> makePostRequest() async {
    var headers = {
      'Content-Type': 'application/json',
    };

    var request = http.Request(
        'POST', Uri.parse('https://crickx.onrender.com/getCreatedTeam'));
    request.body = json.encode({
      "match_id": widget.matchId,
      "contest_id": contest_id,
      "phoneNumber": phone,
    });
    request.headers.addAll(headers);

    try {
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        String responseString = await response.stream.bytesToString();
        var jsonResponse = json.decode(responseString);
        print("0bjkbd${jsonResponse['balance']}");
        int teamslength = jsonResponse['teams'].length;
        setState(() {
          teams = jsonResponse['teams'];

          // isLoading = false;
        });
        if (jsonResponse['balance'] == true) {
           print("object12345");
          if (teamslength == 0) {
            print("object123");
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TeamSelectionScreen(
                  matchId: widget.matchId,
                  competitionId: widget.competition,
                  short_title: widget.short_title,
                  date_start_ist: widget.date_start_ist,
                ),
              ),
            );
          } else if (teamslength == 1) {
            

          } else {

          }
        } else {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => WalletScreen(),
              ),
            );
        }
        print("Teams: $jsonResponse");
      } else {
        print(
            'Request failed with status: ${response.statusCode}, ${response.reasonPhrase}');
      }
    } catch (error) {
      print('Error making the request: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
                child: Image.asset(
                  'assets/indianCricket.gif',
                  width: 400,
                  height: 170,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 70.0,
                left: 140.0,
                child: Text(
                  '${widget.short_title}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Positioned(
                top: 100.0,
                left: 160.0,
                child: Text(
                  formattedTimer,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Positioned(
                top: 55,
                left: 16,
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(
                        100.0), // Adjust the radius as needed
                  ),
                  padding: EdgeInsets.all(1.0),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ),
            ],
          ),
          isLoading
              ? CardSkeleton(
                  isCircularImage: true,
                  isBottomLinesActive: true,
                )
              : suggestions.isEmpty
                  ? Padding(
                      padding: const EdgeInsets.only(top: 200),
                      child: Center(
                        child: Text("Please Wait For Some Time"),
                      ),
                    )
                  : Expanded(
                      child: ListView.builder(
                        itemCount: suggestions.length,
                        itemBuilder: (context, index) {
                          var element = suggestions[index];
                          return Expanded(
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 0),
                                  // padding: EdgeInsets.symmetric(horizontal: 15.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => YourNewScreen(
                                            contestId: element["_id"],
                                          ),
                                        ),
                                      );
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 0),
                                      child: Center(
                                        child: Container(
                                          height: 165,
                                          width: 370,
                                          child: Card(
                                            elevation: 5,
                                            shadowColor: Colors.grey,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            color: Colors.white,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 20, right: 20),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Container(
                                                        child: Container(
                                                          height: 60,
                                                          width: 130,
                                                          decoration:
                                                              BoxDecoration(
                                                            gradient:
                                                                LinearGradient(
                                                              colors: [
                                                                Color.fromARGB(
                                                                    255,
                                                                    169,
                                                                    74,
                                                                    228),
                                                                Color.fromARGB(
                                                                    255,
                                                                    51,
                                                                    10,
                                                                    86), // End color
                                                              ],
                                                              begin: Alignment
                                                                  .topCenter,
                                                              end: Alignment
                                                                  .bottomCenter,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      10.0),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          10.0),
                                                            ),
                                                          ),
                                                          child: Column(
                                                            children: [
                                                              SizedBox(
                                                                height: 2,
                                                              ),
                                                              Text(
                                                                'Max Prize Pool',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color: Colors
                                                                      .white54,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: 2,
                                                              ),
                                                              Text(
                                                                '₹ 25000',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 25,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w900,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Column(
                                                        children: [
                                                          SizedBox(
                                                            height: 3,
                                                          ),
                                                          Text("Entry"),
                                                          SizedBox(
                                                            height: 35,
                                                            width: 80,
                                                            child:
                                                                ElevatedButton(
                                                              onPressed: () {
                                                                setState(() {
                                                                  contest_id =
                                                                      element[
                                                                          "_id"];
                                                                });
                                                                makePostRequest();
                                                                print(
                                                                    "Button Pressed");
                                                              },
                                                              style:
                                                                  ElevatedButton
                                                                      .styleFrom(
                                                                primary: Colors
                                                                    .green,
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        vertical:
                                                                            10),
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4.0),
                                                                ),
                                                              ),
                                                              child: RichText(
                                                                text: TextSpan(
                                                                  text: '₹',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                  children: <TextSpan>[
                                                                    TextSpan(
                                                                      text:
                                                                          " 50",
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            14,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Center(
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      SizedBox(height: 15),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                right: 20,
                                                                left: 20),
                                                        child:
                                                            LinearProgressIndicator(
                                                          value: 0,
                                                          backgroundColor:
                                                              Colors.grey[300],
                                                          valueColor:
                                                              AlwaysStoppedAnimation<
                                                                      Color>(
                                                                  const Color(
                                                                      0xFF8443BA)),
                                                        ),
                                                      ),
                                                      SizedBox(height: 15),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                right: 20,
                                                                left: 20),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              '1,567 spots left',
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: const Color(
                                                                    0xFF8443BA),
                                                              ),
                                                            ),
                                                            Text(
                                                              '2,000 spots',
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: Colors
                                                                    .black54,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(height: 15),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  child: Container(
                                                    height: 31,
                                                    width: 370,
                                                    decoration: BoxDecoration(
                                                      gradient: LinearGradient(
                                                        colors: [
                                                          Color.fromARGB(255,
                                                              169, 74, 228),
                                                          Color.fromARGB(
                                                              255,
                                                              51,
                                                              10,
                                                              86), // End color
                                                        ],
                                                        begin:
                                                            Alignment.topCenter,
                                                        end: Alignment
                                                            .bottomCenter,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                10.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                10.0),
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
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color:
                                                                Colors.white54,
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
                                  ),
                                ),
                                SizedBox(height: 10),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
        ],
      ),
      floatingActionButton: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 1), // Adjust as needed
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StadiumPage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20.0),
                          topLeft: Radius.circular(20.0),
                        ),
                      ),
                    ),
                    child: Container(
                      height: 30,
                      width: 95,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/detailfloatingicon2.png',
                                    height: 18,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'CONTESTS',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 1), // Adjust as needed
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TeamSelectionScreen(
                            matchId: widget.matchId,
                            competitionId: widget.competition,
                            short_title: widget.short_title,
                            date_start_ist: widget.date_start_ist,
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        ),
                      ),
                    ),
                    child: Container(
                      height: 30,
                      width: 120,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/detailfloatingicon1.png',
                                height: 20,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'CREATE TEAM',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
