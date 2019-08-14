import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_course_2/updatedcourse/app3_shop/models/product.dart';
import 'package:http/http.dart' as http; // to avoid crashing with names ..

import '../dummy_data.dart';

class ProductsProvider with ChangeNotifier {
  List<Product> _items = dummyProducts;

  //var _showFavoritesOnly = false;

  /// must return a copy of list for data consistant ..
  List<Product> get items {
    // if (_showFavoritesOnly) {
    //   return _items.where((item) {
    //     return item.isFavorite;
    //   }).toList();
    // }
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((item) => item.isFavorite).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((item) {
      return item.id == id;
    });
  }

  // void showFavoritesOnly() {
  //   _showFavoritesOnly = true;
  //   notifyListeners();
  // }

  // void showAll() {
  //   _showFavoritesOnly = false;
  //   notifyListeners();
  // }

  Future<void> addProduct(Product newProduct) {
    const url = 'https://fluttersetup-88480.firebaseio.com/product.json';

    /// the post method will return a future so if I want to execute something after the api calling
    /// I need to add that in the .then() method ...
    /// also if I add something aftet the post method it will executed immediately because I did not
    /// add await and async in the function to wait for server response ....
    return http
        .post(url,
            body: json.encode({
              'title': newProduct.title,
              'description': newProduct.description,
              'imageUrl': newProduct.imageUrl,
              'price': newProduct.price,
              'isFavorite': newProduct.isFavorite
            }))
        .then((response) {
      final product = Product(
          id: json.decode(response.body)['name'],
          title: newProduct.title,
          description: newProduct.description,
          price: newProduct.price,
          imageUrl: newProduct.imageUrl);
      _items.add(product);
      notifyListeners();
    }).catchError((error){
      print(error);
      throw error;
    });
  }

  void updateProduct(Product product) {
    final proIndex = _items.indexWhere((item) => item.id == product.id);
    if (proIndex > 0) {
      _items[proIndex] = product;
      notifyListeners();
    } else {
      print('..........');
    }
  }

  void deleteProduct(String id) {
    _items.removeWhere((item) => item.id == id);
    notifyListeners();
  }
}
