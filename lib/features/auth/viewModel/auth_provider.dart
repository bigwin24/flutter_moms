import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AuthState extends ChangeNotifier {
  /// state  of user information

  //ENV get URL
  String baseUrl = dotenv.get('URL');

// Create storage
  final storage = const FlutterSecureStorage();

  bool get isAuthorized {
    // return storage.read(key: "access_token") != null ? true :false;

    // return _user.apiToken.isNotEmpty;
    return false;
  }

  bool displayedOnboard = false;

  Future<bool> checkToken() async {
    var token = await storage.read(key: "ACCESS_TOKEN");
    if(token != null){
      print('토근있음 $token');
      return true;
    }else {
      print('토근없음');
      return false;
    }
  }

  Future<bool> tryLogin() async {
    print('token1');
    // fetch user info
    final data = await fetchData();
    print('data $data');
    if (data != null) {
      print('data44 $data');
      storage.write(key: 'ACCESS_TOKEN', value: data['access_token']);
      storage.write(key: 'REFRESH_TOKEN', value: data['refresh_token']);
      return true; // has a login record.
    }
    return false;
  }

  Future<dynamic> fetchData() async {
    print('token2');
    try {
      var response = await http.post(
          Uri.parse('$baseUrl/users/login'),
          body: {'username': 'kimtestp', 'password': '!23456789'});

      print('token3 $response');

      if (response.statusCode == 200) {
        var jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;
        return jsonResponse;
      }
      return false;
    } catch (e) {
      print('error: $e');
    }
  }
}
