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
      var response = await http.get(
          Uri.parse('https://rest.entitysport.com/v2/matches/49629/squads?token=ec471071441bb2ac538a0ff901abd249'));

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
          :Column(
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
                        fontSize: 15.0,
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
                            percent: (selectedPlayers.length / maxPlayers).toDouble(),
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
                                  color: Colors
                                      .white,
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
            tabs: _getUniqueSkills().map((skill) => Tab(text: skill)).toList(),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: _getUniqueSkills().map((skill) {
                return Column(
                  children: [
                    Text(
                      'Select 1 - 8 your $skill team:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: _getPlayersBySkill(skill).length,
                        itemBuilder: (context, index) {
                          final player = _getPlayersBySkill(skill)[index];
                          return ListTile(
                            title: Row(
                              children: [
                                CircleAvatar(
                                  backgroundImage: AssetImage(player.photo),
                                ),
                                SizedBox(width: 16.0),
                                Text(player.name),
                              ],
                            ),
                            subtitle: Text(player.position),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.remove),
                                  onPressed: () {
                                    setState(() {
                                      if (selectedPlayers.contains(player)) {
                                        selectedPlayers.remove(player);
                                        totalCredits += int.parse(player.point);
                                      }
                                    });
                                  },
                                ),
                                Text(player.point),
                                IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: () {
                                    setState(() {
                                      if (selectedPlayers.length < maxPlayers &&
                                          !selectedPlayers.contains(player) &&
                                          totalCredits >= int.parse(player.point)) {
                                        selectedPlayers.add(player);
                                        totalCredits -= int.parse(player.point);
                                      }
                                    });
                                  },
                                ),
                              ],
                            ),
                            tileColor: selectedPlayers.contains(player)
                                ? Colors.blue.withOpacity(0.3)
                                : null,
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
      floatingActionButton: ElevatedButton(
        onPressed: () {
          print('Selected Players: ${selectedPlayers.map((e) => e.name)}');
        },
        child: Text('Submit'),
      ),
    );
  }
}

class Player {
  final String name;
  final String position;
  final String skill;
  final String photo;
  final String point;

  Player({
    required this.name,
    required this.position,
    required this.skill,
    required this.photo,
    required this.point,
  });
}
