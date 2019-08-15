import 'package:flutter/foundation.dart';
import 'package:flutter_course_2/updatedcourse/app3_shop/models/http_exception.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
    this.isFavorite = false,
  });

  void _setFavValue(bool newVal) {
    isFavorite = newVal;
    notifyListeners();
  }

  void toggleFavoriteState(String authToken, String userId) async {
    final oldState = isFavorite;
    isFavorite = !isFavorite;
    notifyListeners();

    /// FYI --> http only throw exceptions with get and post
    /// not with delete and patch so .. in requests with delete and patch
    /// you have to extract the response status code by your self ...
    /// as the following

    final url =
        'https://fluttersetup-88480.firebaseio.com/userFavorites/$userId/$id.json?auth=$authToken';
    try {
      final response = await http.put(url,
          body: json.encode(
            isFavorite,
          ));
      if (response.statusCode >= 400) {
        throw HttpException('Can not mark as facorite now .. !!');
      }
    } catch (error) {
      _setFavValue(oldState);
    }
  }
}
