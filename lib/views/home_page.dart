// ignore_for_file: non_constant_identifier_names

import 'package:app/services/footbali_services.dart';
import 'package:app/views/detail_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    // fetchDataFootbalis();
    fetchData();
  }

  void fetchData() async {
  var url = Uri.parse('https://rest.entitysport.com/v2/competitions/121143/matches/?token=ec471071441bb2ac538a0ff901abd249&per_page=50&&paged=1');

  try {
    http.Response response = await http.get(url);
      print("object");
    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON
      var data = json.decode(response.body);
      print("hello${data['response']['items']}");
      if (data != null) {
        setState(() {
          for (int i = 0;
              i < data['response']['items'].length;
              i++) {
            competitions
                .addAll(data['response']['items']);
          }
          isLoaded = true;
        });
      }
      print(data);
    } else {
      // If the server did not return a 200 OK response,
      // throw an exception.
      throw Exception('Failed to load data');
    }
  } catch (error) {
    print('Error: $error');
  }
}

  // fetchDataFootbalis() async {
  //   try {
  //     final response = await fetchFootbalis();
  //     print("Responce:$response");
  //     if (response != null) {
  //       setState(() {
  //         for (int i = 0;
  //             i < response['data']['competition_matches'].length;
  //             i++) {
  //           competitions
  //               .addAll(response['data']['competition_matches'][i]['matches']);
  //         }
  //         isLoaded = true;
  //       });
  //     }
  //   } catch (e) {
  //     fetchDataFootbalis();
  //   }
  // }

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

      return ListView.builder(
        itemCount: competitions.length,
        itemBuilder: (context, index) {
          var element = competitions[index];
          // var date =element['date_start'];
          // var date = DateTime.fromMillisecondsSinceEpoch(
          //     element['timestamp_start'] * 1000);

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
              margin: const EdgeInsets.all(10),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
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
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                    ),
                    const SizedBox(width: 16),
                    // element['match_started']
                    //     ? Column(
                    //         crossAxisAlignment: CrossAxisAlignment.center,
                    //         children: [
                    //           Text(
                    //             '${element['home_team_score']} - ${element['away_team_score']}',
                    //             style: TextStyle(
                    //               fontWeight: FontWeight.bold,
                    //               color: Theme.of(context)
                    //                   .textTheme
                    //                   .bodySmall
                    //                   ?.color,
                    //             ),
                    //           ),
                    //           const SizedBox(height: 8),
                    //           Text(
                    //             element['status'],
                    //             textAlign: TextAlign.center,
                    //             style: TextStyle(
                    //               color: Theme.of(context)
                    //                   .textTheme
                    //                   .bodySmall
                    //                   ?.color,
                    //             ),
                    //           ),
                    //         ],
                    //       )
                    //     : 
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
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
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
                    ),
                    const SizedBox(width: 10),
                    Container(
                      width: 40,
                      height: 40,
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
                  ],
                ),
              ),
            ),
          );
        },
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
