import 'dart:convert';
import 'package:app/views/captain&vicecaptain.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:percent_indicator/percent_indicator.dart';
import 'package:loader_skeleton/loader_skeleton.dart';

class TeamSelectionScreen extends StatefulWidget {
  final int matchId;
  final int competitionId;
  const TeamSelectionScreen(
      {Key? key, required this.matchId, required this.competitionId})
      : super(key: key);
  @override
  _TeamSelectionScreenState createState() => _TeamSelectionScreenState();
}

class _TeamSelectionScreenState extends State<TeamSelectionScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<Player> players = [];
  List<Player> selectedPlayers = [];
  double totalCredits = 100;
  int maxPlayers = 11;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 4,
      vsync: this,
    );
    _fetchPlayers();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _fetchPlayers() async {
    try {
      var response = await http.get(Uri.parse(
          'https://rest.entitysport.com/v2/competitions/${widget.competitionId}/squads/${widget.matchId}/?token=444b8b1e48d9cd803ea3820c5c17ecc4'));

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        if (jsonResponse.containsKey('response')) {
          List<Player> apiPlayers = [];
          for (int i = 0; i < jsonResponse['response']['squads'].length; i++) {
            for (int j = 0;
                j < jsonResponse['response']['squads'][i]["players"].length;
                j++) {
              Player player = Player(
                pid: jsonResponse['response']['squads'][i]["players"][j]["pid"]
                        .toString() ??
                    '',
                name: jsonResponse['response']['squads'][i]["players"][j]
                            ["first_name"]
                        .toString() ??
                    '',
                skill: jsonResponse['response']['squads'][i]["players"][j]
                            ["playing_role"]
                        .toString() ??
                    '',
                photo: 'assets/player8.jpg',
                point: jsonResponse['response']['squads'][i]["players"][j]
                            ["fantasy_player_rating"]
                        .toString() ??
                    '',
                fielding: jsonResponse['response']['squads'][i]["players"][j]
                            ["fielding_position"]
                        .toString() ??
                    '',
              );
              apiPlayers.add(player);
            }
          }
          setState(() {
            players = apiPlayers;
            isLoading = false;
            print("hello$players");
          });
        } else {
          print('Error: Data not found in API response');
        }
      } else {
        print('Error: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  List<String> _getUniqueSkills() {
    return players
        .where((player) => player.skill.isNotEmpty)
        .map((player) => player.skill)
        .toSet()
        .toList();
  }

  List<Player> _getPlayersBySkill(String skill) {
    return players.where((player) => player.skill == skill).toList();
  }

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
      body: isLoading // Check if loading, show loader
          ? CardSkeleton(
              isCircularImage: true,
              isBottomLinesActive: true,
            )
          : Column(
              children: [
                Container(
                  height: 200.0,
                  width: 700.0,
                  child: Card(
                    color: const Color(0xFF8443BA),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left:
                                        50.0), // Adjust left padding as needed
                                child: CircleAvatar(
                                  radius: 20.0,
                                  backgroundImage:
                                      AssetImage('assets/india_flag.png'),
                                ),
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
                              Padding(
                                padding: const EdgeInsets.only(
                                    right:
                                        50.0), // Adjust right padding as needed
                                child: CircleAvatar(
                                  radius: 20.0,
                                  backgroundImage:
                                      AssetImage('assets/usa_flag.png'),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 30.0),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 40.0), // Adjust left padding as needed
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  LinearPercentIndicator(
                                    width: 280.0,
                                    lineHeight: 27.0,
                                    percent:
                                        (selectedPlayers.length / maxPlayers)
                                            .toDouble(),
                                    center: Text(
                                      '${(selectedPlayers.length / maxPlayers * 100).toStringAsFixed(1)}%',
                                      style: TextStyle(fontSize: 12.0),
                                    ),
                                    linearStrokeCap: LinearStrokeCap.roundAll,
                                    backgroundColor: Colors.grey,
                                    progressColor: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Row(
                                  children: [
                                    Text(
                                      'Players ',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 10.0,
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      '${selectedPlayers.length}/$maxPlayers',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 20.0),
                                child: Row(
                                  children: [
                                    Text(
                                      'Credits Left ',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 10.0,
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      '$totalCredits',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 12.0),
                          Text(
                            'Maximum of 10 players from a team',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                TabBar(
                  controller: _tabController,
                  tabs: _getUniqueSkills()
                      .map((skill) => Tab(text: skill))
                      .toList(),
                ),
                Card(
                  elevation: 0.5,
                  margin: EdgeInsets.all(0.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                  child: Container(
                    width: 400,
                    height: 50.0,
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 100.0,
                              height: 15.0,
                              margin: EdgeInsets.only(
                                  left:
                                      8.0), // Adjust the padding value as needed
                              child: Text(
                                'SELECTED BY',
                                style: TextStyle(
                                  fontSize: 10.0,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            Container(
                              width: 80.0,
                              height: 15.0,
                              margin: EdgeInsets.only(left: 90.0),
                              child: Text(
                                'POINTS',
                                style: TextStyle(
                                  fontSize: 10.0,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            Container(
                              width: 70.0,
                              height: 15.0,
                              margin: EdgeInsets.only(
                                  right:
                                      0.0), // Adjust the margin value as needed
                              child: Text(
                                'CREDITS',
                                style: TextStyle(
                                  fontSize: 10.0,
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
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: _getUniqueSkills().map((skill) {
                      return Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              itemCount: _getPlayersBySkill(skill).length,
                              itemBuilder: (context, index) {
                                final player = _getPlayersBySkill(skill)[index];
                                return Card(
                                  elevation: 0.5,
                                  margin: EdgeInsets.all(0.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0.0),
                                  ),
                                  color: player?.isSelected == true
                                      ? Colors.grey
                                      : null,
                                  child: Container(
                                    width: 400,
                                    height: 110.0,
                                    padding: const EdgeInsets.only(
                                        left: 19, right: 19, bottom: 8),
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          left: 0,
                                          top: 0,
                                          width: 55.0,
                                          height:
                                              100.0, // Adjusted height to cover full card height
                                          child: Image.asset(
                                            'assets/profileimage.png', // Replace with the actual path to your PNG image
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Positioned(
                                          left:
                                              83.0, // Adjusted left position for the text content
                                          top: 25,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                player.name,
                                                style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(height: 3.0),
                                              Row(
                                                children: [
                                                  SizedBox(width: 30.0),
                                                  Text(
                                                    player.skill,
                                                    style: TextStyle(
                                                      fontSize: 16.0,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                  SizedBox(width: 75.0),
                                                  SizedBox(width: 45.0),
                                                  Text(
                                                    player.point,
                                                    style: TextStyle(
                                                      fontSize: 13.0,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  SizedBox(width: 20.0),
                                                  // IconButton(
                                                  //   icon: (player?.isSelected ==
                                                  //           true)
                                                  //       ? Icon(Icons.remove,
                                                  //           color: Colors.red)
                                                  //       : Icon(Icons.add,
                                                  //           color:
                                                  //               Colors.green),
                                                  //   onPressed: () {
                                                  //     setState(() {
                                                  //       if (player != null) {
                                                  //         if (player
                                                  //                 .isSelected ??
                                                  //             false) {
                                                  //           // Remove the player
                                                  //           totalCredits +=
                                                  //               double.parse(player
                                                  //                   .point);
                                                  //           selectedPlayers
                                                  //               .remove(player);
                                                  //         } else {
                                                  //           // Add the player
                                                  //           if (selectedPlayers
                                                  //                   .length <
                                                  //               maxPlayers) {
                                                  //             totalCredits -= double
                                                  //                 .parse(player
                                                  //                     .point);
                                                  //             selectedPlayers
                                                  //                 .add(player);
                                                  //           } else {
                                                  //             // Maximum players reached
                                                  //             print(
                                                  //                 'Maximum players reached');
                                                  //           }
                                                  //         }
                                                  //         player.isSelected =
                                                  //             !(player.isSelected ??
                                                  //                 false);
                                                  //       }
                                                  //     });
                                                  //   },
                                                  // ),
                                                  IconButton(
                                                    icon: (player?.isSelected ==
                                                            true)
                                                        ? Icon(Icons.remove,
                                                            color: Colors.red)
                                                        : Icon(Icons.add,
                                                            color:
                                                                Colors.green),
                                                    onPressed: () {
                                                      setState(() {
                                                        if (player != null) {
                                                          if (player
                                                                  .isSelected ??
                                                              false) {
                                                            totalCredits +=
                                                                double.parse(
                                                                    player
                                                                        .point);
                                                            selectedPlayers
                                                                .remove(player);
                                                          } else {
                                                            if (selectedPlayers
                                                                    .length <
                                                                maxPlayers) {
                                                              totalCredits -=
                                                                  double.parse(
                                                                      player
                                                                          .point);
                                                              selectedPlayers
                                                                  .add(player);
                                                            } else {
                                                              final snackBar =
                                                                  SnackBar(
                                                                content: Text(
                                                                    'Maximum players reached (11 players)'),
                                                              );
                                                              ScaffoldMessenger
                                                                      .of(
                                                                          context)
                                                                  .showSnackBar(
                                                                      snackBar);
                                                              return; // Do not proceed further
                                                            }
                                                          }
                                                          player.isSelected =
                                                              !(player.isSelected ??
                                                                  false);
                                                        }
                                                      });
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Positioned(
                                          left:
                                              0.0, // Adjusted left position for the rectangle text
                                          bottom:
                                              8.0, // Adjusted bottom position for the rectangle text
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10.0,
                                                vertical: 2.0),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(
                                                  10.0), // Adjust the border radius as needed
                                              color: Colors
                                                  .black, // Rectangle color
                                            ),
                                            child: Text(
                                              'IND',
                                              style: TextStyle(
                                                fontSize: 15.0,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
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
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
      floatingActionButton: selectedPlayers.length == maxPlayers
          ? Container(
              margin: EdgeInsets.only(
                right: 120,
              ), // Set the desired margin from the top
              child: ElevatedButton(
                onPressed: () async {
                  if (selectedPlayers.length == maxPlayers) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Captain(
                          selectedPlayers: selectedPlayers,
                          matchId: widget.matchId,
                        ),
                      ),
                    );
                  } else {
                    final snackBar = SnackBar(
                      content:
                          Text('Please select exactly $maxPlayers players.'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(
                      255, 88, 13, 123), // Set the desired button color
                  minimumSize: Size(150, 3), // Set the desired width and height
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        10.0), // Set the desired border radius
                  ),
                ),
                child: Text(
                  'Next',
                  style: TextStyle(
                    color: Colors.white,
                    // Add other text styles as needed
                  ),
                ),
              ),
            )
          : SizedBox.shrink(),
    );
  }
}

class Player {
  final String pid;
  final String name;
  final String skill;
  final String photo;
  final String point;
  final String fielding;
  bool isCaptain;
  bool isViceCaptain;

  bool isSelected;
  Player({
    required this.pid,
    required this.name,
    required this.skill,
    required this.photo,
    required this.point,
    required this.fielding,
    this.isSelected = false,
    this.isCaptain = false,
    this.isViceCaptain = false, // Default to unselected
  });

  Map<String, dynamic> toJson() {
    return {"pid": pid, "name": name, "skill": skill, "point": point};
  }
}
