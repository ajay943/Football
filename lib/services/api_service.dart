// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:path/path.dart';
import 'package:async/async.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static Future otpApi(
    apikey,
    sender,
    phoneNumber,
    otp,
  ) async {
    var url =
        'http://www.mysmsapp.in/api/push.json?apikey=611f7ecc727d4&sender=RAMGYA&mobileno=${phoneNumber}&text=Thank  you for registering with Ramagya Mart. Your OTP is ${otp}';
    // print(url);
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // print('Here==>${response.statusCode}');
      return jsonDecode(response.body);
    } else {
      return response.statusCode;
    }
  }
  
  

  static Future autoSearch(matchId) async {
    print('VALUEggg==> $matchId');
    final response = await http.get(
        Uri.parse('http://localhost:8000/admin/getpool-contest/=$matchId'));
    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
      return responseJson;
    } else {
      return response.statusCode;
    }
  }
 }
