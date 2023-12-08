import 'package:flutter/material.dart';

class TeamSelectionScreen extends StatefulWidget {
  @override
  _TeamSelectionScreenState createState() => _TeamSelectionScreenState();
}

class _TeamSelectionScreenState extends State<TeamSelectionScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<Player> players = [
    Player(
        name: 'Player 1',
        position: 'Forward',
        skill: 'Attack',
        photo: 'assets/player1.jpg'),
    Player(
        name: 'Player 2',
        position: 'Forward',
        skill: 'Attack',
        photo: 'assets/player2.jpg'),
    Player(
        name: 'Player 3',
        position: 'Midfielder',
        skill: 'Midfield',
        photo: 'assets/player3.jpg'),
    Player(
        name: 'Player 4',
        position: 'Midfielder',
        skill: 'Midfield',
        photo: 'assets/player4.jpg'),
    Player(
        name: 'Player 5',
        position: 'Defender',
        skill: 'Defense',
        photo: 'assets/player5.jpg'),
    Player(
        name: 'Player 6',
        position: 'Defender',
        skill: 'Defense',
        photo: 'assets/player6.jpg'),
    Player(
        name: 'Player 7',
        position: 'Goalkeeper',
        skill: 'Goalkeeping',
        photo: 'assets/player7.jpg'),
    Player(
        name: 'Player 8',
        position: 'Goalkeeper',
        skill: 'Goalkeeping',
        photo: 'assets/player8.jpg'),
  ];
  List<Player> selectedPlayers = [];

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: _getUniqueSkills().length, vsync: this);
  }

  List<String> _getUniqueSkills() {
    return players.map((player) => player.skill).toSet().toList();
  }

  List<Player> _getPlayersBySkill(String skill) {
    return players.where((player) => player.skill == skill).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    borderRadius: BorderRadius.vertical(bottom: Radius.elliptical(1, 1)),
  ),
  leading: IconButton(
  icon: Icon(Icons.arrow_back),
  onPressed: () {
    Navigator.pop(context); // Navigate back to the previous screen
  },
),
),
      body: TabBarView(
        controller: _tabController,
        children: _getUniqueSkills().map((skill) {
          return Column(
            children: [
              Text('Select your $skill team:'),
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
                                }
                              });
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {
                              setState(() {
                                if (!selectedPlayers.contains(player)) {
                                  selectedPlayers.add(player);
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
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: ElevatedButton(
          onPressed: () {
            print('Selected Players: ${selectedPlayers.map((e) => e.name)}');
          },
          child: Text('Submit'),
        ),
      ),
    );
  }
}

class Player {
  final String name;
  final String position;
  final String skill;
  final String photo;
  Player(
      {required this.name,
      required this.position,
      required this.skill,
      required this.photo});
}
