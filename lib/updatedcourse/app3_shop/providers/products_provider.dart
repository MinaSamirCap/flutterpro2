import 'package:flutter/material.dart';
import 'package:flutter_course_2/updatedcourse/app3_shop/models/product.dart';

import '../dummy_data.dart';

class ProductsProvider with ChangeNotifier {

  List<Product> _items = dummyProducts;

  List<Product> get items{
    return [..._items];
  }

  void addProduct(){
    //_items.add()
    notifyListeners();
  }
}
