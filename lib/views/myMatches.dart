import 'package:app/views/myCompletedMatchesTeam.dart';
import 'package:flutter/material.dart';

class MyMatches extends StatefulWidget {
  const MyMatches({super.key});
  @override
  State<MyMatches> createState() => _MyMatchesState();
}

class _MyMatchesState extends State<MyMatches>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF924ACD), Color(0xFF391C5D)],
            ),
          ),
        ),
        title: Text(
          'My Matches',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        toolbarHeight: 60,
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.25,
            width: double.infinity,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Image.asset(
                    'assets/stadium.png',
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(0),
                    border: Border.all(
                      color: Color(0xFF8544BD),
                    ),
                  ),
                  child: TabBar(
                    controller: _tabController,
                    tabs: [
                      Tab(text: 'Live'),
                      Tab(text: 'Completed'),
                    ],
                    indicatorColor: Color(0xFF8544BD),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.020),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Live Matches
                _buildLiveMatches(),
                // Completed Matches
                _buildCompletedMatches(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLiveMatches() {
    return Expanded(
      child: ListView.builder(
        // itemCount: competitions.length,
        itemCount: 2,
        itemBuilder: (context, index) {
          // var element = competitions[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyCompletedMatchesTeam(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Center(
                  child: Container(
                      height: MediaQuery.of(context).size.height * 0.207,
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 29,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color.fromARGB(255, 169, 74, 228),
                                    Color.fromARGB(255, 51, 10, 86),
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.0),
                                  topRight: Radius.circular(10.0),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20, right: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        "ICC Men’s ODI Cricket World Cup 2023",
                                        style: TextStyle(
                                          fontSize: 10.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                        ),
                                    ),
                                    Text(
                                        "14 Oct, 2:00pm",
                                        style: TextStyle(
                                          fontSize: 8.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                        ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.016,
                            ), // Adjust the height based on your design
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 30,
                                      backgroundImage:
                                          AssetImage('assets/india.png'),
                                    ),
                                    Text(
                                      'IND',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  'Live',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                                Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 30,
                                      backgroundImage:
                                          AssetImage('assets/aus.png'),
                                    ),
                                    Text(
                                      'AUS',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            SizedBox(
                              height: MediaQuery.of(context).size.height *
                                  0.016, // Adjust the percentage as needed
                            ),
                            // Adjust the height based on your design
                            Row(
                              children: [
                                Container(
                                  height: 30,
                                  width:
                                      MediaQuery.of(context).size.width * .60,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color.fromARGB(255, 169, 74, 228),
                                        Color.fromARGB(255, 51, 10, 86),
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10.0),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                        " 1 Team   |   1 Contest",
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                    ),
                                ),),
                                Container(
                                  color: Colors
                                      .white, // Color of the right container
                                  height: 30,
                                  width:
                                      MediaQuery.of(context).size.width * .025,
                                ),
                                Container(
                                  height: 30,
                                  width:
                                      MediaQuery.of(context).size.width * .25,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [Colors.green, Colors.green],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(10.0),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                        "₹ 1000",
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                  )
                                ),
                              ],
                            )
                          ],
                        ),
                      ))),
            ),
          );
        },
      ),
    );
  
  }

  Widget _buildCompletedMatches() {
    return 
    Expanded(
      child: ListView.builder(
        // itemCount: competitions.length,
        itemCount: 2,
        itemBuilder: (context, index) {
          // var element = competitions[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyCompletedMatchesTeam(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Center(
                  child: Container(
                      height: MediaQuery.of(context).size.height * 0.207,
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 29,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color.fromARGB(255, 169, 74, 228),
                                    Color.fromARGB(255, 51, 10, 86),
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.0),
                                  topRight: Radius.circular(10.0),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20, right: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        "ICC Men’s ODI Cricket World Cup 2023",
                                        style: TextStyle(
                                          fontSize: 10.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                        ),
                                    ),
                                    Text(
                                        "14 Oct, 2:00pm",
                                        style: TextStyle(
                                          fontSize: 8.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                        ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.016,
                            ), // Adjust the height based on your design
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 30,
                                      backgroundImage:
                                          AssetImage('assets/india.png'),
                                    ),
                                    Text(
                                      'IND',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  'Completed',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                                Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 30,
                                      backgroundImage:
                                          AssetImage('assets/aus.png'),
                                    ),
                                    Text(
                                      'AUS',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            SizedBox(
                              height: MediaQuery.of(context).size.height *
                                  0.016, // Adjust the percentage as needed
                            ),
                            // Adjust the height based on your design
                            Row(
                              children: [
                                Container(
                                  height: 30,
                                  width:
                                      MediaQuery.of(context).size.width * .60,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color.fromARGB(255, 169, 74, 228),
                                        Color.fromARGB(255, 51, 10, 86),
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10.0),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                        " 1 Team   |   1 Contest",
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                    ),
                                ),),
                                Container(
                                  color: Colors
                                      .white, // Color of the right container
                                  height: 30,
                                  width:
                                      MediaQuery.of(context).size.width * .025,
                                ),
                                Container(
                                  height: 30,
                                  width:
                                      MediaQuery.of(context).size.width * .25,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [Colors.green, Colors.green],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(10.0),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                        "₹ 1000",
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                  )
                                ),
                              ],
                            )
                          ],
                        ),
                      ))),
            ),
          );
        },
      ),
    );
  }
}
