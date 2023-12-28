import 'package:app/phone.dart';
import 'package:app/views/wallet.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:app/services/footbali_services.dart';
import 'package:app/views/detail_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:loader_skeleton/loader_skeleton.dart';

class SidebarXExampleApp extends StatefulWidget {
  const SidebarXExampleApp({Key? key}) : super(key: key);
  static String routeName = '/home';
  @override
  _SidebarXExampleAppState createState() => _SidebarXExampleAppState();
}

class _SidebarXExampleAppState extends State<SidebarXExampleApp> {
  final _key = GlobalKey<ScaffoldState>();
  int _currentIndex = 0;
  List competitions = [];
  final List<String> advertisements = [
    'assets/slider1.jpg',
    'assets/slider2.jpg',
    'assets/slider3.png',
  ];
  bool isLoading = true;
  late String phone;

  _isLoggedIn() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var phoneNumber = pref.getString('phoneNumber');
    setState(() {
      phone = phoneNumber!;
    });
  }

  _setLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('loggedin', true);
  }

  @override
  void initState() {
    super.initState();
    _isLoggedIn();
    _setLoggedIn();
    fetchData();
    Future.delayed(Duration(seconds: 1), () {
      register();
    });
  }

  void register() async {
    print(phone);
    var headers = {
      'Content-Type': 'application/json',
    };
    var url = Uri.parse('https://crickx.onrender.com/saveNumber');
    var response = await http.post(
      url,
      headers: headers,
      body: jsonEncode({
        "phoneNumber": phone,
      }),
    );
    if (response.statusCode == 200) {
      setState(() {
        isLoading = false;
      });
    } else if (response.statusCode == 201) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SignInNewScreen(),
        ),
      );
    } else {
      print(response.reasonPhrase);
    }
  }

  void fetchData() async {
    var url = Uri.parse(
        'https://rest.entitysport.com/v2/competitions/121143/matches/?token=ec471071441bb2ac538a0ff901abd249&per_page=50&&paged=1');
    try {
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        if (data != null) {
          setState(() {
            for (int i = 0; i < data['response']['items'].length; i++) {
              competitions.addAll(data['response']['items']);
            }
            isLoading = true;
          });
        }
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'SidebarX Example',
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (context) {
          final isSmallScreen = MediaQuery.of(context).size.width < 600;
          return Scaffold(
            key: _key,
            appBar: AppBar(
              title: Padding(
                padding: const EdgeInsets.only(right: 170),
                child: Text(
                  'FUNZY',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                      color: Colors.white),
                ),
              ),
              backgroundColor: const Color(0xFF8443BA),
              centerTitle: true,
              elevation: 10,
              toolbarHeight: 60,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.elliptical(1, 1),
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Stack(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.notifications,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          // Navigate to the notifications screen or perform any action
                        },
                      ),
                      Positioned(
                        top: 3,
                        right: 7,
                        child: Container(
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          constraints: BoxConstraints(
                            minWidth: 16,
                            minHeight: 16,
                          ),
                          child: Text(
                            '5', // Replace this with your actual notification count
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            body: isLoading
                ? CardSkeleton(
                    isCircularImage: true,
                    isBottomLinesActive: true,
                  )
                : Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            SizedBox(height: 20),
                            CarouselSlider.builder(
                              itemCount: advertisements.length,
                              options: CarouselOptions(
                                height: 80.0,
                                enlargeCenterPage: true,
                                autoPlay: true,
                                aspectRatio: 16 / 9,
                                autoPlayCurve: Curves.fastOutSlowIn,
                                enableInfiniteScroll: true,
                                autoPlayAnimationDuration:
                                    Duration(milliseconds: 800),
                                viewportFraction: 0.8,
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    _currentIndex = index;
                                  });
                                },
                              ),
                              itemBuilder: (BuildContext context, int index,
                                  int realIndex) {
                                return Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    image: DecorationImage(
                                      image: AssetImage(advertisements[index]),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              },
                            ),
                            SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                advertisements.length,
                                (index) => buildDot(index: index),
                              ),
                            ),
                            const SizedBox(height: 15),
                            Text(
                              'Upcoming Matches',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Expanded(
                              child: ListView.builder(
                                itemCount: competitions.length,
                                // itemCount: 1,
                                itemBuilder: (context, index) {
                                  var element = competitions[index];
                                  return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => MatchDetailPage(
                                            matchId: element["match_id"],
                                          ),
                                          // builder: (context) => MatchDetailPage( matchId: 12345),
                                        ),
                                      );
                                    },
                                    //  child: Padding(
                                    //   padding:
                                    //       const EdgeInsets.only(bottom: 10),
                                    //   child: Center(
                                    //     child: Container(
                                    //       color: Colors.white,
                                    //       height: 125,
                                    //       width: 375,
                                    //       child: Card(
                                    //         elevation: 5,
                                    //         // shadowColor: Colors.grey,
                                    //         shape: RoundedRectangleBorder(
                                    //           borderRadius:
                                    //               BorderRadius.circular(10.0),
                                    //         ),
                                    //         color: Colors.white,
                                    //         child: Padding(
                                    //           padding:
                                    //               const EdgeInsets.all(0.0),
                                    //           child: Column(
                                    //             crossAxisAlignment:
                                    //                 CrossAxisAlignment.start,
                                    //             children: [
                                    //               Container(
                                    //                 alignment: Alignment.center,
                                    //                 child: Container(
                                    //                   height: 31,
                                    //                   width: 190,
                                    //                   decoration: BoxDecoration(
                                    //                     gradient:
                                    //                         LinearGradient(
                                    //                       colors: [
                                    //                         Color.fromARGB(255,
                                    //                             169, 74, 228),
                                    //                         Color.fromARGB(255,
                                    //                             51, 10, 86),
                                    //                       ],
                                    //                       begin: Alignment
                                    //                           .topCenter,
                                    //                       end: Alignment
                                    //                           .bottomCenter,
                                    //                     ),
                                    //                     borderRadius:
                                    //                         BorderRadius.only(
                                    //                       bottomLeft:
                                    //                           Radius.circular(
                                    //                               10.0),
                                    //                       bottomRight:
                                    //                           Radius.circular(
                                    //                               10.0),
                                    //                     ),
                                    //                   ),
                                    //                   child: Stack(
                                    //                     alignment:
                                    //                         Alignment.center,
                                    //                     children: [
                                    //                       Align(
                                    //                         alignment: Alignment
                                    //                             .center,
                                    //                         child: Container(
                                    //                           width: 180,
                                    //                           child: Center(
                                    //                             child: Text(
                                    //                               'ICC Mens ODI World Cup 2023',
                                    //                               style:
                                    //                                   TextStyle(
                                    //                                 fontSize:
                                    //                                     10,
                                    //                                 color: Colors
                                    //                                     .white,
                                    //                               ),
                                    //                             ),
                                    //                           ),
                                    //                         ),
                                    //                       ),
                                    //                     ],
                                    //                   ),
                                    //                 ),
                                    //               ),
                                    //               Row(
                                    //                 mainAxisAlignment:
                                    //                     MainAxisAlignment
                                    //                         .spaceBetween,
                                    //                 children: [
                                    //                   Stack(
                                    //                     alignment:
                                    //                         Alignment.center,
                                    //                     children: [
                                    //                       Padding(
                                    //                         padding:
                                    //                             EdgeInsets.only(
                                    //                                 bottom:
                                    //                                     10.0), // Adjust the bottom margin as needed
                                    //                         child: Container(
                                    //                             margin: EdgeInsets
                                    //                                 .only(
                                    //                                     left:
                                    //                                         20.0),
                                    //                             child: Column(
                                    //                               mainAxisAlignment:
                                    //                                   MainAxisAlignment
                                    //                                       .start,
                                    //                               crossAxisAlignment:
                                    //                                   CrossAxisAlignment
                                    //                                       .center,
                                    //                               children: [
                                    //                                 Container(
                                    //                                   width:
                                    //                                       60, // Set your desired width
                                    //                                   height:
                                    //                                       50, // Set your desired height
                                    //                                   decoration:
                                    //                                       BoxDecoration(
                                    //                                     borderRadius:
                                    //                                         BorderRadius.circular(10), // Set border radius as needed
                                    //                                     image:
                                    //                                         DecorationImage(
                                    //                                       image:
                                    //                                           CachedNetworkImageProvider(
                                    //                                             "https://i.pravatar.cc/100?img=0",
                                    //                                       ),
                                    //                                       fit: BoxFit
                                    //                                           .cover,
                                    //                                     ),
                                    //                                   ),
                                    //                                 ),
                                    //                                 SizedBox(
                                    //                                     height:
                                    //                                         3),
                                    //                                 Text( "IND",
                                    //                                   style: TextStyle(
                                    //                                       fontSize:
                                    //                                           14),
                                    //                                 ),
                                    //                               ],
                                    //                             )),
                                    //                       ),
                                    //                     ],
                                    //                   ),
                                    //                   SizedBox(
                                    //                     width: 16,
                                    //                   ),
                                    //                   Stack(
                                    //                     alignment:
                                    //                         Alignment.center,
                                    //                     children: [
                                    //                       Container(
                                    //                         child: Column(
                                    //                           mainAxisAlignment:
                                    //                               MainAxisAlignment
                                    //                                   .start,
                                    //                           crossAxisAlignment:
                                    //                               CrossAxisAlignment
                                    //                                   .center,
                                    //                           children: [
                                    //                             Container(
                                    //                               width: 75,
                                    //                               height: 30,
                                    //                               decoration:
                                    //                                   BoxDecoration(
                                    //                                 color: Color
                                    //                                     .fromARGB(
                                    //                                         255,
                                    //                                         240,
                                    //                                         207,
                                    //                                         207),
                                    //                                 borderRadius:
                                    //                                     BorderRadius.circular(
                                    //                                         40.0),
                                    //                               ),
                                    //                               child: Center(
                                    //                                 child: Text(
                                    //                                   '1d:21m',
                                    //                                   style:
                                    //                                       TextStyle(
                                    //                                     fontSize:
                                    //                                         14,
                                    //                                     fontWeight:
                                    //                                         FontWeight.w700,
                                    //                                     color: Colors
                                    //                                         .red,
                                    //                                   ),
                                    //                                 ),
                                    //                               ),
                                    //                             ),
                                    //                             SizedBox(
                                    //                                 height: 12),
                                    //                             Text(
                                    //                               '14 Oct, 2:00 pm',
                                    //                               style: TextStyle(
                                    //                                   fontSize:
                                    //                                       14,
                                    //                                   color: const Color
                                    //                                       .fromRGBO(
                                    //                                       158,
                                    //                                       158,
                                    //                                       158,
                                    //                                       1)),
                                    //                             ),
                                    //                           ],
                                    //                         ),
                                    //                       ),
                                    //                     ],
                                    //                   ),
                                    //                   SizedBox(
                                    //                     width: 16,
                                    //                   ),
                                    //                   Stack(
                                    //                     alignment:
                                    //                         Alignment.center,
                                    //                     children: [
                                    //                       Padding(
                                    //                         padding:
                                    //                             EdgeInsets.only(
                                    //                                 bottom:
                                    //                                     10.0), // Adjust the bottom margin as needed
                                    //                         child: Container(
                                    //                             margin: EdgeInsets
                                    //                                 .only(
                                    //                                     right:
                                    //                                         20.0),
                                    //                             child: Column(
                                    //                               mainAxisAlignment:
                                    //                                   MainAxisAlignment
                                    //                                       .start,
                                    //                               crossAxisAlignment:
                                    //                                   CrossAxisAlignment
                                    //                                       .center,
                                    //                               children: [
                                    //                                 Container(
                                    //                                   width:
                                    //                                       60, // Set your desired width
                                    //                                   height:
                                    //                                       50, // Set your desired height
                                    //                                   decoration:
                                    //                                       BoxDecoration(
                                    //                                     borderRadius:
                                    //                                         BorderRadius.circular(10), // Set border radius as needed
                                    //                                     image:
                                    //                                         DecorationImage(
                                    //                                       image:
                                    //                                           CachedNetworkImageProvider(
                                    //                                         // element['teamb']['thumb_url'] ??
                                    //                                             "https://i.pravatar.cc/100?img=80",
                                    //                                       ),
                                    //                                       fit: BoxFit
                                    //                                           .cover,
                                    //                                     ),
                                    //                                   ),
                                    //                                 ),
                                    //                                 SizedBox(
                                    //                                     height:
                                    //                                         3),
                                    //                                 Text("PAK",
                                    //                                   style: TextStyle(
                                    //                                       fontSize:
                                    //                                           14),
                                    //                                 ),
                                    //                               ],
                                    //                             )),
                                    //                       ),
                                    //                     ],
                                    //                   ),
                                    //                 ],
                                    //               ),
                                    //             ],
                                    //           ),
                                    //         ),
                                    //       ),
                                    //     ),
                                    //   ),
                                    // ),

                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      child: Center(
                                        child: Container(
                                          color: Colors.white,
                                          height: 125,
                                          width: 375,
                                          child: Card(
                                            elevation: 5,
                                            // shadowColor: Colors.grey,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            color: Colors.white,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(0.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    alignment: Alignment.center,
                                                    child: Container(
                                                      height: 31,
                                                      width: 190,
                                                      decoration: BoxDecoration(
                                                        gradient:
                                                            LinearGradient(
                                                          colors: [
                                                            Color.fromARGB(255,
                                                                169, 74, 228),
                                                            Color.fromARGB(255,
                                                                51, 10, 86),
                                                          ],
                                                          begin: Alignment
                                                              .topCenter,
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
                                                      child: Stack(
                                                        alignment:
                                                            Alignment.center,
                                                        children: [
                                                          Align(
                                                            alignment: Alignment
                                                                .center,
                                                            child: Container(
                                                              width: 180,
                                                              child: Center(
                                                                child: Text(
                                                                  'ICC Mens ODI World Cup 2023',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        10,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Stack(
                                                        alignment:
                                                            Alignment.center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    bottom:
                                                                        10.0), // Adjust the bottom margin as needed
                                                            child: Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        left:
                                                                            20.0),
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Container(
                                                                      width:
                                                                          60, // Set your desired width
                                                                      height:
                                                                          50, // Set your desired height
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(10), // Set border radius as needed
                                                                        image:
                                                                            DecorationImage(
                                                                          image:
                                                                              CachedNetworkImageProvider(
                                                                            element['teama']['thumb_url'] ??
                                                                                "https://i.pravatar.cc/100?img=0",
                                                                          ),
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                        height:
                                                                            3),
                                                                    Text(
                                                                      element['teama']
                                                                              [
                                                                              'short_name'] ??
                                                                          element['home_team']
                                                                              [
                                                                              'name_en'],
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              14),
                                                                    ),
                                                                  ],
                                                                )),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        width: 16,
                                                      ),
                                                      Stack(
                                                        alignment:
                                                            Alignment.center,
                                                        children: [
                                                          Container(
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Container(
                                                                  width: 75,
                                                                  height: 30,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            240,
                                                                            207,
                                                                            207),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            40.0),
                                                                  ),
                                                                  child: Center(
                                                                    child: Text(
                                                                      '1d:21m',
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            14,
                                                                        fontWeight:
                                                                            FontWeight.w700,
                                                                        color: Colors
                                                                            .red,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                    height: 12),
                                                                Text(
                                                                  '14 Oct, 2:00 pm',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          14,
                                                                      color: const Color
                                                                          .fromRGBO(
                                                                          158,
                                                                          158,
                                                                          158,
                                                                          1)),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        width: 16,
                                                      ),
                                                      Stack(
                                                        alignment:
                                                            Alignment.center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    bottom:
                                                                        10.0), // Adjust the bottom margin as needed
                                                            child: Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        right:
                                                                            20.0),
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Container(
                                                                      width:
                                                                          60, // Set your desired width
                                                                      height:
                                                                          50, // Set your desired height
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(10), // Set border radius as needed
                                                                        image:
                                                                            DecorationImage(
                                                                          image:
                                                                              CachedNetworkImageProvider(
                                                                            element['teamb']['thumb_url'] ??
                                                                                "https://i.pravatar.cc/100?img=80",
                                                                          ),
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                        height:
                                                                            3),
                                                                    Text(
                                                                      element['teamb']
                                                                              [
                                                                              'short_name'] ??
                                                                          element['away_team']
                                                                              [
                                                                              'name_en'],
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              14),
                                                                    ),
                                                                  ],
                                                                )),
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
        },
      ),
    );
  }

  Widget buildDot({required int index}) {
    return Container(
      width: 8,
      height: 8,
      margin: EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentIndex == index ? const Color(0xFF8443BA) : Colors.grey,
      ),
    );
  }
}
