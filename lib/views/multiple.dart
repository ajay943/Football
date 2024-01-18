import 'dart:convert';
import 'package:app/views/home_page.dart';
import 'package:app/views/playercards.dart';
import 'package:app/views/team.dart';
import 'package:app/views/wallet.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:loader_skeleton/loader_skeleton.dart';
import 'package:shared_preferences/shared_preferences.dart';

class YourNewScreen extends StatefulWidget {
  final int matchId;
  final int competition;
  final String contestId;
  final String short_title;
  final String date_start_ist;
  final int balance;

  const YourNewScreen({
    Key? key,
    required this.matchId,
    required this.contestId,
    required this.short_title,
    required this.balance,
    required this.competition,
    required this.date_start_ist,
  }) : super(key: key);
  @override
  _YourNewScreenState createState() => _YourNewScreenState();
}

class _YourNewScreenState extends State<YourNewScreen> {
  String responseData = "";
  late String phone;
  // bool rankData = true;
  bool isLoading = false;
  List<dynamic> suggestions = [];
  int? poolprize;
  int? joinamount;
  late Duration timeDifference;
  late String formattedTimer;
  late DateTime matchDateTime;
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
    fetchPool(widget.contestId);
    fetchData(widget.contestId);
  }

  _isLoggedIn() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var phoneNumber = pref.getString('phoneNumber');
    setState(() {
      phone = phoneNumber!;
    });
  }

  void submitPayment() async {
    var headers = {
      'Content-Type': 'application/json',
    };
    var body = {
      "poolContestId": widget.contestId,
      "phoneNumber": phone,
       "teamID": ""
    };
    var uri = Uri.parse('https://crickx.onrender.com/joinContest');
    http.Response response = await http.post(
      uri,
      headers: headers,
      body: jsonEncode(body),
    );
    if (response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SidebarXExampleApp(),),
      );
      print(response.body);
    } else {
      print(response.reasonPhrase);
    }
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
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      if (jsonResponse.containsKey('data') && jsonResponse['data'] is List) {
        var poolList = jsonResponse['data'];
        if (poolList.isNotEmpty) {
          var firstPool = poolList[0];
          var pricePool = firstPool['price_pool'];
          var entryfee = firstPool['entry_fee'];
          setState(() {
            poolprize = pricePool;
            joinamount = entryfee;
          });
        } else {
          print("Empty 'pool' array in the JSON response.");
        }
      } else {
        print("Missing or invalid 'pool' key in the JSON response.");
      }
      setState(() {
        suggestions = jsonResponse['data'];
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

  Future<void> makePostRequest() async {
    var headers = {
      'Content-Type': 'application/json',
    };
    var request = http.Request(
        'POST', Uri.parse('https://crickx.onrender.com/getCreatedTeam'));
    request.body = json.encode({
      "match_id": widget.matchId,
      "contest_id": widget.contestId,
      "phoneNumber": phone,
    });
    request.headers.addAll(headers);
    try {
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        String responseString = await response.stream.bytesToString();
        var jsonResponse = json.decode(responseString);
        bool balanc = jsonResponse['balance'];
        int teamslength = jsonResponse['teams']?.length ?? 0;
        setState(() {
          teams = jsonResponse['teams'] ?? [];
        });
        if (balanc == true) {
          if (teamslength == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TeamSelectionScreen(
                  matchId: widget.matchId,
                  competitionId: widget.competition,
                  short_title: widget.short_title,
                  date_start_ist: widget.date_start_ist,
                  fromContest: true,
                  balance: widget.balance,
                  contestId: widget.contestId,
                ),
              ),
            );
          } else if (teamslength == 1) {
            _showBottomSheet(context);
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MyTeam(
                  matchId: widget.matchId,
                  competition: widget.matchId,
                  short_title: widget.short_title,
                  date_start_ist: widget.date_start_ist,
                  fromContest: true,
                  balance: widget.balance,
                  contestId: widget.contestId,
                ),
              ),
            );
          }
        } else if (balanc == false) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WalletScreen(),
            ),
          );
        }
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
    double width = MediaQuery.of(context).size.width;
    double buttonWidth = width * 0.2;
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 65),
              child: Text(
                '${widget.short_title}',
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
                '$formattedTimer',
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
                          child: Container(
                            height:MediaQuery.of(context).size.height * .288,
                            width:MediaQuery.of(context).size.width * .899,
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
                                          height: MediaQuery.of(context).size.width * .15,
                                          width:MediaQuery.of(context).size.width * .877,
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
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: MediaQuery.of(context).size.height * .002,
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
                                                height: MediaQuery.of(context).size.height * .002,
                                              ),
                                              Text(
                                                "$poolprize",
                                                style: TextStyle(
                                                  fontSize: 22,
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
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: MediaQuery.of(context).size.height * .018,),
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
                                      SizedBox(height: MediaQuery.of(context).size.height * .012,),
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
                                      SizedBox(height:MediaQuery.of(context).size.height * .012,),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Center(
                                        child: SizedBox(
                                          height:MediaQuery.of(context).size.height * .047,
                                          width: MediaQuery.of(context).size.width * .75,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              makePostRequest();
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
                                                    text: " $joinamount",
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
                                  SizedBox(height: MediaQuery.of(context).size.height * .056,),
                                  Container(
                                    child: Container(
                                      height: MediaQuery.of(context).size.height * .035,
                                      width:MediaQuery.of(context).size.width * .879,
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
                                          Row(
                                                        children: [
                                                          SizedBox(
                                                        width: 5,
                                                      ),
                                                          Container(
                                                            height: 15,
                                                            width: 15,
                                                            child: Image.asset(
                                                              'assets/filledicon.png', // Replace with the actual path to your PNG image
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                           SizedBox(
                                                        width: 2,
                                                      ),
                                                          Text(
                                                            '₹80',
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: Colors
                                                                  .white,
                                                            ),
                                                          ),
                                                           SizedBox(
                                                        width: 10,
                                                      ),
                                                          Container(
                                                            height: 13,
                                                            width: 13,
                                                            child: Image.asset(
                                                              'assets/cup.png', // Replace with the actual path to your PNG image
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                           SizedBox(
                                                        width: 2,
                                                      ),
                                                          Text(
                                                            '21%',
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: Colors
                                                                  .white,
                                                            ),
                                                          ),
                                                           SizedBox(
                                                        width: 10,
                                                      ),
                                                          Container(
                                                            height: 15,
                                                            width: 15,
                                                            child: Image.asset(
                                                              'assets/micon.png', // Replace with the actual path to your PNG image
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                           SizedBox(
                                                        width: 2,
                                                      ),
                                                          Text(
                                                            'Upto 11',
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: Colors
                                                                  .white,
                                                            ),
                                                          ),
                                                           SizedBox(
                                                        width: 120,
                                                      ),
                                                          Container(
                                                            height: 15,
                                                            width: 15,
                                                            child: Image.asset(
                                                              'assets/rupeeicon.png', // Replace with the actual path to your PNG image
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                        width: 2,
                                                      ),
                                                          Text(
                                                            'Flexible',
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: Colors
                                                                  .white,
                                                            ),
                                                          ),
                                                        ],
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

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          width: double.infinity,
          padding: EdgeInsets.all(0.0),
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 12.0),
                  Center(
                      child: Text(
                    'CONFIRMATION',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                    ),
                  )),
                  SizedBox(height: 4.0),
                  Container(
                    height: 1,
                    width: double.infinity,
                    color: Colors.grey,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                  ),
                  SizedBox(height: 8.0),
                  InkWell(
                    onTap: () {
                      print("object");
                      makePostRequest();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20, left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Entry',
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '₹ ${joinamount.toString()}',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Container(
                      height: 1,
                      width: double.infinity,
                      color: Colors.grey,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20, left: 20, top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'To Pay',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '₹ ${joinamount.toString()}',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24.0),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("I agree with the standard T&Cs"),
                      ],
                    ),
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        submitPayment();
                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: 16),
                        height: 40,
                        width: MediaQuery.of(context).size.width * .85,
                        decoration: const BoxDecoration(
                          color: Color(0xFF8443BA),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Center(
                          child: Text(
                            'JION CONTEST',
                            style: GoogleFonts.notoSans(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: const Color(0xffFFFFFF),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                ],
              ),
              // Close button at top left
              Positioned(
                top: 4.0,
                left: 4.0,
                child: IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Map<String, dynamic> getRanksAndPricesFromResponse() {
    if (responseData.isNotEmpty) {
      Map<String, dynamic> jsonResponse = json.decode(responseData);
      return jsonResponse['data']['ranksAndPrices'];
    }
    return {};
  }
}
