import 'package:flutter/foundation.dart';
import 'package:flutter_course_2/updatedcourse/app3_shop/models/http_exception.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Auth with ChangeNotifier {
  String _tokan;
  DateTime _expiryDate;
  String _userId;

  Future<void> _authenticate(String email, String password, String path) async {
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:$path?key=AIzaSyBZOFU4ASUWlcVLICOldvyTg1y_GxOA4Oc';

    try {
      final response = await http.post(url,
          body: json.encode({
            'email': email,
            'password': password,
            'returnSecureToken': true
          }));

      final responseData = json.decode(response.body);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
    } catch (error) {
      throw error;
    }
  }

  Future<void> signup(String email, String password) async {
    return _authenticate(email, password, 'signUp');
  }

  Future<void> login(String email, String password) async {
    return _authenticate(email, password, 'signInWithPassword');
  }
}
