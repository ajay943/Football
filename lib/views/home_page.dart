import 'package:app/phone.dart';
import 'package:app/views/chat.dart';
import 'package:app/views/pointsystem.dart';
import 'package:app/views/profile.dart';
import 'package:app/views/responsibleplay.dart';
import 'package:app/views/termsandconditions.dart';
import 'package:app/views/wallet.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:app/services/footbali_services.dart';
import 'package:app/views/detail_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SidebarXExampleApp extends StatefulWidget {
  const SidebarXExampleApp({Key? key}) : super(key: key);
  static String routeName = '/home';

  @override
  _SidebarXExampleAppState createState() => _SidebarXExampleAppState();
}

class _SidebarXExampleAppState extends State<SidebarXExampleApp> {
  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  final _key = GlobalKey<ScaffoldState>();
  List competitions = [];
  final List<String> advertisements = [
    'assets/slider1.jpg',
    'assets/slider2.jpg',
    'assets/slider3.png',
  ];
  bool isLoaded = false;

  // _isLoggedIn() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.getBool('loggedin');
  //   print('loggedinVALUE==>${prefs.getBool('loggedin')}');
  // }

  _setLoggedIn() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('loggedin', true);
  print('loggedinVALUE==>${prefs.getBool('loggedin')}');
}

  @override
  void initState() {
    // _isLoggedIn();
     _setLoggedIn();
    super.initState();
    fetchData();
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
            isLoaded = true;
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
      title: 'SidebarX Example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // Your theme data
          ),
      home: Builder(
        builder: (context) {
          final isSmallScreen = MediaQuery.of(context).size.width < 600;
          return Scaffold(
            key: _key,
            appBar: isSmallScreen
                ? AppBar(
                    title: const Text(
                      'Cricket Khelo',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    backgroundColor: Colors.red,
                    centerTitle: true,
                    elevation: 10,
                    toolbarHeight: 60,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.elliptical(1, 1),
                      ),
                    ),
                    actions: [
                      IconButton(
                        icon: Icon(Icons.account_balance_wallet),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WalletScreen(),
                            ),
                          );
                        },
                      ),
                    ],
                    flexibleSpace: Column(
                      children: [
                        SizedBox(height: 20), // Add space here
                      ],
                    ),
                  )
                : null,
            drawer: ExampleSidebarX(controller: _controller),
            body: Row(
              children: [
                if (!isSmallScreen) ExampleSidebarX(controller: _controller),
                Expanded(
                  child: Column(
                    children: [
                      CarouselSlider(
                        options: CarouselOptions(
                          height: 150.0,
                          enlargeCenterPage: true,
                          autoPlay: true,
                          aspectRatio: 16 / 9,
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enableInfiniteScroll: true,
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 800),
                          viewportFraction: 0.8,
                        ),
                        items: advertisements.map((ad) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  image: DecorationImage(
                                    image: AssetImage(ad),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Upcoming Matches',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: competitions.length,
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
                                  ),
                                );
                              },
                              child: Card(
                                margin: const EdgeInsets.all(5),
                                elevation: 25,
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  side: BorderSide(color: Colors.black),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Row(
                                    children: [
                                      Column(
                                        children: [
                                          Container(
                                            width: 60,
                                            height: 60,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              image: DecorationImage(
                                                image:
                                                    CachedNetworkImageProvider(
                                                  element['teama']
                                                          ['thumb_url'] ??
                                                      "https://i.pravatar.cc/100?img=0",
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            element['teama']['short_name'] ??
                                                element['home_team']['name_en'],
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall
                                                  ?.color,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 22, right: 22),
                                        child: Column(
                                          children: [
                                            Text(
                                              "T-20",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall
                                                    ?.color,
                                              ),
                                            ),
                                            const SizedBox(height: 16),
                                            Text(
                                              '${element['date_start']}',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall
                                                    ?.color,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Container(
                                              margin:
                                                  EdgeInsets.only(left: 1.0),
                                              width: 60,
                                              height: 60,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                image: DecorationImage(
                                                  image:
                                                      CachedNetworkImageProvider(
                                                    element['teamb']
                                                            ['thumb_url'] ??
                                                        "https://i.pravatar.cc/100?img=80",
                                                  ),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              element['teamb']['short_name'] ??
                                                  element['away_team']
                                                      ['name_en'],
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall
                                                    ?.color,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
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
}

class ExampleSidebarX extends StatelessWidget {
  const ExampleSidebarX({
    Key? key,
    required SidebarXController controller,
  })  : _controller = controller,
        super(key: key);

  final SidebarXController _controller;

  @override
  Widget build(BuildContext context) {
    return SidebarX(
      controller: _controller,
      theme: SidebarXTheme(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: canvasColor,
          borderRadius: BorderRadius.circular(20),
        ),
        hoverColor: scaffoldBackgroundColor,
        textStyle: TextStyle(color: Colors.black.withOpacity(0.7)),
        selectedTextStyle: const TextStyle(color: Colors.white),
        itemTextPadding: const EdgeInsets.only(left: 30),
        selectedItemTextPadding: const EdgeInsets.only(left: 30),
        itemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: canvasColor),
        ),
        selectedItemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: actionColor.withOpacity(0.37),
          ),
          gradient: const LinearGradient(
            colors: [accentCanvasColor, canvasColor],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.28),
              blurRadius: 30,
            ),
          ],
        ),
        iconTheme: IconThemeData(
          color: Colors.black.withOpacity(0.7),
          size: 20,
        ),
        selectedIconTheme: const IconThemeData(
          color: Colors.white,
          size: 20,
        ),
      ),
      extendedTheme: const SidebarXTheme(
        width: 200,
        decoration: BoxDecoration(
          color: canvasColor,
        ),
      ),
      footerDivider: divider,
      headerBuilder: (context, extended) {
        return Column(
          children: [
            SizedBox(height: 20),
            SizedBox(
              height: 100,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset('assets/slider3.png'),
              ),
            ),
          ],
        );
      },
      items: [
        SidebarXItem(
          icon: Icons.people,
          label: 'Profile',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfilePage(),
              ),
            );
          },
        ),
        SidebarXItem(
          icon: Icons.description,
          label: 'T&C',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TermsAndConditionsPage(),
              ),
            );
          },
        ),
        SidebarXItem(
          icon: Icons.point_of_sale,
          label: 'Point System',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PointsSystemPage(),
              ),
            );
          },
        ),
        SidebarXItem(
          icon: Icons.policy,
          label: 'Responsible Play',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ResponsiblePlayPage(),
              ),
            );
          },
        ),
        SidebarXItem(
          icon: Icons.contact_emergency,
          label: 'Contact Us',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LiveChat(),
              ),
            );
          },
        ),
        SidebarXItem(
          icon: Icons.logout,
          label: 'Logout',
          onTap: () async {
            SharedPreferences pref = await SharedPreferences.getInstance();
            pref.clear();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SignInNewScreen(),
              ),
            );
            // await _logout();
          },
        ),
      ],
    );
  }
}

String _getTitleByIndex(int index) {
  switch (index) {
    case 0:
      return 'Profile';
    case 1:
      return 'T&C';
    case 2:
      return 'Point System';
    case 3:
      return 'Responsible Play';
    case 4:
      return 'Contact Us';
    case 5:
      return 'Logout';
    default:
      return 'Not found page';
  }
}

// Your existing constants
const primaryColor = Color.fromARGB(255, 242, 242, 246);
const canvasColor = Color.fromARGB(255, 224, 224, 230);
const scaffoldBackgroundColor = Color(0xFF464667);
const accentCanvasColor = Color(0xFF3E3E61);
const white = Colors.black;
final actionColor = const Color(0xFF5F5FA7).withOpacity(0.6);
final divider = Divider(color: white.withOpacity(0.3), height: 1);
