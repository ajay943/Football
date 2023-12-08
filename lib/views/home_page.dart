// ignore_for_file: non_constant_identifier_names

import 'package:app/services/footbali_services.dart';
import 'package:app/views/detail_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class TableGamesLivePage extends StatefulWidget {
  final String tab_id;
  const TableGamesLivePage({Key? key, required this.tab_id}) : super(key: key);
  static String routeName = '/home';

  @override
  State<TableGamesLivePage> createState() => _TableGamesLivePageState();
}

class _TableGamesLivePageState extends State<TableGamesLivePage> {
  List competitions = [];
  final List<String> advertisements = [
    'assets/slider1.jpg',
    'assets/slider2.jpg',
    'assets/slider3.png',
  ];
  bool isLoaded = false;

  @override
  void initState() {
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
    if (isLoaded) {
      if (competitions.isEmpty) {
        return const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.gamepad,
                size: 100,
                color: Colors.deepOrangeAccent,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "There is no game",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        );
      }

      return 
      Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: 100.0,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
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
          const SizedBox(height: 20), // Add some spacing
          Text(
            'Upcoming Matches',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.black, // Adjust the color as needed
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
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: CachedNetworkImageProvider(
                                      element['teama']['thumb_url'] ??
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
                            margin: EdgeInsets.only(left: 22, right: 22),
                            child: Column(
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          // const SizedBox(width: 16),
                          // const SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 18.0),
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  image: DecorationImage(
                                    image: CachedNetworkImageProvider(
                                      element['teamb']['thumb_url'] ??
                                          "https://i.pravatar.cc/100?img=80",
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Text(
                                element['teamb']['short_name'] ??
                                    element['away_team']['name_en'],
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
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      );
    } else {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.deepOrangeAccent,
            strokeWidth: 7,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.deepOrangeAccent),
          ),
        ),
      );
    }
  }
}

