import 'package:flutter/material.dart';

class MyTeam extends StatefulWidget {
  const MyTeam({super.key});

  @override
  State<MyTeam> createState() => _MyTeamState();
}

class _MyTeamState extends State<MyTeam> {
  bool _acceptTerms = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'IND VS ENG',
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
        // elevation: 10,
        toolbarHeight: 60,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.elliptical(1, 1),
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Row(
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
                  child: ListView.builder(
                    // itemCount: competitions.length,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      // var element = competitions[index];
                      return InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Center(
                            child: Container(
                              color: Colors.white,
                              height: 140,
                              width: 375,
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
                                        Container(
                                          color: Colors.black,
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 20),
                                            child: Row(
                                              children: [
                                                Text(
                                                  'SQUAD 7895  (T1)',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18.0,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 145),
                                                  child: Checkbox(
                                                    value: _acceptTerms,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        _acceptTerms = value ?? false;
                                                      });
                                                    },
                                                    checkColor: Colors.black,
                                                    fillColor: MaterialStateColor
                                                        .resolveWith(
                                                            (states) => Colors.white),
                                                  ),
                                                ),
                                              ],
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
                                                  padding: const EdgeInsets.only(left: 50),
                                                  child: CircleAvatar(
                                                    backgroundColor: Colors.white,
                                                    backgroundImage:
                                                        AssetImage('assets/sq3.png'),
                                                  ),
                                                ),
                                                SizedBox(height: 5,),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 40),
                                                  child: Text("data",                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14.0,
                                                  ),),
                                                )
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(right: 50),
                                                  child: CircleAvatar(
                                                    backgroundColor: Colors.white,
                                                    backgroundImage:
                                                        AssetImage('assets/sq4.png'),
                                                  ),
                                                ),
                                                SizedBox(height: 5,),
                                                Padding(
                                                  padding: const EdgeInsets.only(right:40),
                                                  child: Text("data",                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14.0,
                                                  ),),
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
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
