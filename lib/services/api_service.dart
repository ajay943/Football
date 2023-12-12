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

  static Future pinCodeApi(
    pinCode,
  ) async {
    var url = 'https://api.postalpincode.in/pincode/${pinCode}';
    // print("pinCodeURL_$url");
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // print('HerePinCode==>${response.statusCode}');
      return jsonDecode(response.body);
    } else {
      return response.statusCode;
    }
  }

  static Future brandSearchApi(brandName) async {
    var url = 'https://qa.dznify.com/totalbrandproduct?brandname=$brandName';
    // print(url);
    final response = await http.get(
      Uri.parse(url),
    );

    // print("URLresponse_$url");
    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
      // print(responseJson);

      return responseJson;
    } else {
      return response.statusCode;
    }
  }

  static Future autosearchproduct(search) async {
    // ignore: avoid_print
    print(search);
    var url = 'https://qa.dznify.com/autosearchproduct?autosearch=$search';
    // print(url);
    final response = await http.get(
      Uri.parse(url),
    );

    // print("URLresponse_$url");
    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
      print(responseJson);

      return responseJson;
    } else {
      return response.statusCode;
    }
  }

  static Future productSearchApi(catname) async {
    var url = 'https://qa.dznify.com/totalcatproduct?catname=$catname';
    // print(url);
    final response = await http.get(
      Uri.parse(url),
    );

    // print('response_$response');

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return response.statusCode;
    }
  }

  static Future selectedItems(selectedItems) async {
    // print(selectedItems);
    var url = 'https://qa.dznify.com/totalcatproduct?catname=$selectedItems';
    // print(url);
    final response = await http.get(
      Uri.parse(url),
    );

    // print('response_$response');

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return response.statusCode;
    }
  }

  static Future selectedBrandItems(brandName) async {
    var url = 'https://qa.dznify.com/totalbrandproduct?brandname=$brandName';
    // print(url);
    final response = await http.get(
      Uri.parse(url),
    );

    // print("URLresponse_$url");
    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
      // print(responseJson);

      return responseJson;
    } else {
      return response.statusCode;
    }
  }

  static Future selectedWordcat(selectedWord) async {
    // print('here==>$selectedWord');
    var url = 'https://qa.dznify.com/totalcatproduct?catname=$selectedWord';
    // print(url);
    final response = await http.get(
      Uri.parse(url),
    );

    print('response_$response');

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return response.statusCode;
    }
  }
  static Future selectedWordbrand(selectedWord) async {
    
    var url = 'https://qa.dznify.com/totalbrandproduct?brandname=$selectedWord';
    
    final response = await http.get(
      Uri.parse(url),
    );

    print('response_$response');

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return response.statusCode;
    }
  }


  static Future BestSellers() async {
    var url = 'https://qa.dznify.com/bestsellerproducts';
    final response = await http.get(
      Uri.parse(url),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return response.statusCode;
    }
  }

  static Future EditorChoice() async {
    var url = 'https://qa.dznify.com/editorchoiceproducts';
    final response = await http.get(
      Uri.parse(url),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return response.statusCode;
    }
  }

  static Future LabellingSolution() async {
    var url = 'https://qa.dznify.com/whitelabellingproducts';
    final response = await http.get(
      Uri.parse(url),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return response.statusCode;
    }
  }

  static Future CategoryLeader() async {
    var url = 'https://qa.dznify.com/categoryleaderproducts';
    final response = await http.get(
      Uri.parse(url),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return response.statusCode;
    }
  }

  static Future Trustedbrands() async {
    var url = 'https://ramagyamart.com/trustedbrand';    
    final response = await http.get(
      Uri.parse(url),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return response.statusCode;
    }
  }

  static Future productDetails(productID) async {
    print("productdetail $productID");
    final response = await http.get(Uri.parse(
        'https://ramagyamart.com/productdetailspage?productid=$productID'));
    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
      return responseJson;
    } else {
      return response.statusCode;
    }
  }

  static Future autoSearch(_name) async {
    print('VALUEggg==> $_name');
    final response = await http.get(
        Uri.parse('https://ramagyamart.com/autosearchproduct?autosearch=$_name'));
    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
      return responseJson;
    } else {
      return response.statusCode;
    }
  }

  static Future SortBy(brandname, sort_by, catname) async {

    final response = await http.get(
        Uri.parse('https://qa.dznify.com/filtersearchproduct?brandname=$brandname&sort_by=$sort_by&catname=$catname'));
    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
      return responseJson;
    } else {
      return response.statusCode;
    }
  }

  static Future filterBy(
    brandname,
    min_value,
    max_value,
    catname
  ) async {
    print('brandname$brandname');
    final response = await http.get(
        Uri.parse('https://qa.dznify.com/filtersearchproduct?brandname=$brandname&min_value=$min_value&max_value=$max_value&catname=$catname'));
    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
      print('brandname$responseJson');
      return responseJson;
    } else {
      return response.statusCode;
    }
  }
}
