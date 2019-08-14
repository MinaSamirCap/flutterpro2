import 'package:flutter/material.dart';
import 'package:flutter_course_2/updatedcourse/app3_shop/models/http_exception.dart';
import 'dart:convert';
import 'package:flutter_course_2/updatedcourse/app3_shop/models/product.dart';
import 'package:http/http.dart' as http; // to avoid crashing with names ..

import '../dummy_data.dart';

class ProductsProvider with ChangeNotifier {
  List<Product> _items; // = dummyProducts;

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

  Future<void> fetchAndSetProducts() async {
    const url = 'https://fluttersetup-88480.firebaseio.com/product.json';

    try {
      final response = await http.get(url);
      final List<Product> loadedProduct = [];
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      extractedData.forEach((prodId, prodData) {
        loadedProduct.add(Product(
            id: prodId,
            title: prodData['title'],
            description: prodData['description'],
            imageUrl: prodData['imageUrl'],
            price: prodData['price'],
            isFavorite: prodData['isFavorite']));
      });
      _items = loadedProduct;
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> addProduct(Product newProduct) async {
    const url = 'https://fluttersetup-88480.firebaseio.com/product.json';

    /// the post method will return a future so if I want to execute something after the api calling
    /// I need to add that in the .then() method ...
    /// also if I add something aftet the post method it will executed immediately because I did not
    /// add await and async in the function to wait for server response ....
    try {
      final response = await http.post(url,
          body: json.encode({
            'title': newProduct.title,
            'description': newProduct.description,
            'imageUrl': newProduct.imageUrl,
            'price': newProduct.price,
            'isFavorite': newProduct.isFavorite
          }));

      final product = Product(
          id: json.decode(response.body)['name'],
          title: newProduct.title,
          description: newProduct.description,
          price: newProduct.price,
          imageUrl: newProduct.imageUrl);
      _items.add(product);
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }

  Future<void> updateProduct(Product product) async {
    final proIndex = _items.indexWhere((item) => item.id == product.id);

    if (proIndex >= 0) {
      final url =
          'https://fluttersetup-88480.firebaseio.com/product/${product.id}.json';
      await http.patch(url,
          body: json.encode({
            'title': product.title,
            'description': product.description,
            'imageUrl': product.imageUrl,
            'price': product.price
          }));

      _items[proIndex] = product;
      notifyListeners();
    } else {
      print('..........');
    }
  }

  Future<void> deleteProduct(String id) async {
    final url = 'https://fluttersetup-88480.firebaseio.com/product/$id.json';
    final existingProductIndex = _items.indexWhere((item) => item.id == id);
    var exsitingProduct = _items[existingProductIndex];
    _items.removeWhere((item) => item.id == id);
    notifyListeners();

    final response = await http.delete(url);
    if (response.statusCode >= 400) {
      _items.insert(existingProductIndex, exsitingProduct);
      notifyListeners();
      throw HttpException('Could not delete product');
    }
    exsitingProduct = null;
  }
}
