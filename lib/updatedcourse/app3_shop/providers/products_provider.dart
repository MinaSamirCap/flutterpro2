import 'package:flutter/material.dart';
import 'package:flutter_course_2/updatedcourse/app3_shop/models/product.dart';

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

  void addProduct(Product newProduct) {
    final product = Product(
        id: DateTime.now().toString(),
        title: newProduct.title,
        description: newProduct.description,
        price: newProduct.price,
        imageUrl: newProduct.imageUrl);
    _items.add(product);
    notifyListeners();
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
