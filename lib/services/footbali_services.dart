import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>?> fetchFootbalis({String tab = ""}) async {
  await Future.delayed(const Duration(seconds: 1));
  var client = http.Client();
  var url =
      Uri.parse('https://api.cricapi.com/v1/cricScore?apikey=b6a06336-1c23-4125-941a-46268e0f93e0');
  var response = await client.get(url);
  if (response.statusCode == 200) {
    var jsonString = response.body;
    return json.decode(jsonString);
  } else {
    return null;
  }
}
