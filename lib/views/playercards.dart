import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:percent_indicator/percent_indicator.dart';
import 'package:loader_skeleton/loader_skeleton.dart';

class TeamSelectionScreen extends StatefulWidget {
  @override
  _TeamSelectionScreenState createState() => _TeamSelectionScreenState();
}

class _TeamSelectionScreenState extends State<TeamSelectionScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<Player> players = [];
  List<Player> selectedPlayers = [];
  int totalCredits = 100;
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
          'https://rest.entitysport.com/v2/matches/49629/squads?token=ec471071441bb2ac538a0ff901abd249'));

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);

        if (jsonResponse.containsKey('response')) {
          List<Player> apiPlayers = [];
          for (var data in jsonResponse['response']['players']) {
            Player player = Player(
              name: data['first_name'].toString() ?? '',
              position: data['playing_role'].toString() ?? '',
              skill: data['playing_role'].toString() ?? '',
              photo: 'assets/player8.jpg',
              point: data['fantasy_player_rating'].toString() ?? '',
              fielding: data['fielding_position'].toString() ?? '',
            );
            apiPlayers.add(player);
          }

          setState(() {
            players = apiPlayers;
            isLoading = false;
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
          title: Text('Team Selection'),
          backgroundColor: Colors.red,
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
                      color: Colors.black,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Maximum of 10 players from one team',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 30.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Players',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15.0,
                                  ),
                                ),
                                CircleAvatar(
                                  radius: 20.0,
                                  backgroundImage:
                                      AssetImage('assets/india_flag.png'),
                                ),
                                SizedBox(width: 1.0),
                                CircleAvatar(
                                  radius: 20.0,
                                  backgroundImage:
                                      AssetImage('assets/usa_flag.png'),
                                ),
                                Text(
                                  'Credits Left',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15.0,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${selectedPlayers.length}/$maxPlayers',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.0,
                                  ),
                                ),
                                Text(
                                  '$totalCredits',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.0,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.0),
                            Center(
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  LinearPercentIndicator(
                                    width: 310.0,
                                    lineHeight: 27.0,
                                    percent:
                                        (selectedPlayers.length / maxPlayers)
                                            .toDouble(),
                                    center: Text(
                                      '${(selectedPlayers.length / maxPlayers * 100).toStringAsFixed(1)}%',
                                      style: TextStyle(fontSize: 12.0),
                                    ),
                                    trailing: Icon(Icons.mood),
                                    linearStrokeCap: LinearStrokeCap.roundAll,
                                    backgroundColor: Colors.grey,
                                    progressColor: Colors.white,
                                  ),
                                  Positioned(
                                    right: 0.0,
                                    child: Container(
                                      padding: EdgeInsets.all(0.0),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.black,
                                        border: Border.all(
                                          color: Colors.white,
                                          width: 1.5,
                                        ),
                                      ),
                                      child: Icon(
                                        Icons.remove,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ],
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
                                  final player =
                                      _getPlayersBySkill(skill)[index];
                                  return Card(
                                    elevation: 0.5,
                                    margin: EdgeInsets.all(0.0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0.0),
                                    ),
                                    color: player?.isSelected == true ? Colors.grey : null,
                                    child: Container(
                                      width: 400,
                                      height: 150.0,
                                      padding: const EdgeInsets.all(19.0),
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
                                                    Text(
                                                      player.fielding,
                                                      style: TextStyle(
                                                        fontSize: 11.0,
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                    SizedBox(width: 75.0),
                                                    Text(
                                                      '92',
                                                      style: TextStyle(
                                                        fontSize: 13.0,
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                    SizedBox(width: 45.0),
                                                    Text(
                                                      player.point,
                                                      style: TextStyle(
                                                        fontSize: 13.0,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    SizedBox(width: 15.0),
                                                    IconButton(
                                                      icon:
                                                          (player?.isSelected ==
                                                                  true)
                                                              ? Icon(
                                                                  Icons.remove,
                                                                  color: Colors
                                                                      .red)
                                                              : Icon(Icons.add,
                                                                  color: Colors
                                                                      .green),
                                                      onPressed: () {
                                                        setState(() {
                                                          // Toggle the isSelected property
                                                          if (player != null) {
                                                            player.isSelected =
                                                                !(player.isSelected ??
                                                                    false);

                                                            // Update the selectedPlayers list based on the selection
                                                            if (player
                                                                    .isSelected ??
                                                                false) {
                                                              if (selectedPlayers
                                                                      .length <
                                                                  maxPlayers) {
                                                                selectedPlayers
                                                                    .add(
                                                                        player);
                                                              } else {
                                                                // You can display a message or handle the case when the maximum players are selected
                                                                print(
                                                                    'Maximum players reached');
                                                                player.isSelected =
                                                                    false; // Deselect the player
                                                              }
                                                            } else {
                                                              selectedPlayers
                                                                  .remove(
                                                                      player);
                                                            }
                                                          }
                                                        });
                                                      },
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  'Played last match',
                                                  style: TextStyle(
                                                    fontSize: 12.0,
                                                    color: Color.fromARGB(
                                                        255, 223, 198, 35),
                                                  ),
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
        floatingActionButton: Container(
          margin: EdgeInsets.only(
              right: 140), // Set the desired margin from the top
          child: ElevatedButton(
            onPressed: () {
              // Your onPressed logic here
              print('Selected Players: ${selectedPlayers.map((e) => e.name)}');
            },
            child: Text('Submit'),
          ),
        ));
  }
}

class Player {
  final String name;
  final String position;
  final String skill;
  final String photo;
  final String point;
  final String fielding;
  bool isSelected;

  Player({
    required this.name,
    required this.position,
    required this.skill,
    required this.photo,
    required this.point,
    required this.fielding,
    this.isSelected = false, // Default to unselected
  });
}
