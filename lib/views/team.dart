import 'package:app/views/detail_page.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class MyTeam extends StatefulWidget {
  final int matchId;
  final int competition;
  final bool fromContest;
  final String short_title;
  final String date_start_ist;
  final int balance;
  final String contestId;
  const MyTeam({
    Key? key,
    required this.matchId,
    required this.contestId,
    required this.competition,
    required this.fromContest,
    required this.short_title,
    required this.balance,
    required this.date_start_ist,
  }) : super(key: key);

  @override
  State<MyTeam> createState() => _MyTeamState();
}

class _MyTeamState extends State<MyTeam> {
  int? _selectedCheckboxIndex;
  late String phone;
  late String teamId;
  List teams = [];
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
        print("Response: $jsonResponse"); // Add this line
        setState(() {
          teams = jsonResponse['array'] ?? [];
        });
        print("Teams: $teams");
      } else {
        print(
            'Request failed with status: ${response.statusCode}, ${response.reasonPhrase}');
      }
    } catch (error) {
      print('Error making the request: $error');
    }
  }

  String _getCaptainName(Map<String, dynamic> team) {
    for (int i = 1; i <= 11; i++) {
      String playerKey = 'player$i';
      if (team['team'][playerKey]['c'] == true) {
        return team['team'][playerKey]['name'];
      }
    }
    return ''; // Handle the case where no captain is found
  }

  String _getViceCaptainName(Map<String, dynamic> team) {
    for (int i = 1; i <= 11; i++) {
      String playerKey = 'player$i';
      if (team['team'][playerKey]['vc'] == true) {
        return team['team'][playerKey]['name'];
      }
    }
    return ''; // Handle the case where no vice-captain is found
  }

  _isLoggedIn() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var phoneNumber = pref.getString('phoneNumber');
    setState(() {
      phone = phoneNumber!;
    });
  }

  @override
  void initState() {
    super.initState();
    _isLoggedIn();
    Future.delayed(Duration(seconds: 1), () {
      makePostRequest();
    });
    makePostRequest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${widget.short_title}',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
        toolbarHeight: 60,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.elliptical(1, 1),
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Container(
                    height: 70,
                    width: double.infinity,
                    color: Colors.black,
                    child: Center(
                      child: Text(
                        'Select one team by which you want to participate',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: ListView(
                      children: List.generate(teams.length, (index) {
                        var element = teams[index];
                        return InkWell(
                          onTap: () {
                            setState(() {});
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Container(
                              color: Colors.white,
                              height: 160,
                              width: double.infinity,
                              child: Stack(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage('assets/img4.png'),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 5, right: 5),
                                          child: Container(
                                            color: Colors.black,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    'SQUAD',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18.0,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 220),
                                                    child: Checkbox(
                                                      value:
                                                          _selectedCheckboxIndex ==
                                                              index,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          _selectedCheckboxIndex =
                                                              value!
                                                                  ? index
                                                                  : null;
                                                          _selectedCheckboxIndex =
                                                              index;
                                                          teamId =
                                                              element["team"]['_id'];
                                                        });
                                                      },
                                                      checkColor: Colors.black,
                                                      fillColor:
                                                          MaterialStateColor
                                                              .resolveWith(
                                                        (states) =>
                                                            Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 50),
                                                  child: CircleAvatar(
                                                    backgroundColor:
                                                        Colors.white,
                                                    backgroundImage: AssetImage(
                                                        'assets/profileimage.png'),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 40),
                                                  child: Text(
                                                    "${_getCaptainName(element)}",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 14.0,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 40),
                                                  child: Text(
                                                    "Captain",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 14.0,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 50),
                                                  child: CircleAvatar(
                                                    backgroundColor:
                                                        Colors.white,
                                                    backgroundImage: AssetImage(
                                                        'assets/profileimage.png'),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 40),
                                                  child: Text(
                                                    "${_getViceCaptainName(element)}",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 14.0,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 40),
                                                  child: Text(
                                                    "Vice Captain",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 14.0,
                                                    ),
                                                  ),
                                                )
                                              ],
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
                        );
                      }).toList(),
                    ),
                  ),
                  if (_selectedCheckboxIndex != null)
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MatchDetailPage(
                              matchId: widget.matchId,
                              short_title: widget.short_title,
                              date_start_ist: widget.date_start_ist,
                              competition: widget.competition,
                              fromContest: widget.fromContest,
                              teamId: teamId,
                              balance: widget.balance,
                              contestId: widget.contestId,
                            ),
                          ),
                        );
                      },
                      child: Text('Proceed'),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
