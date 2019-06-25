import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  final List<String> _products;

  Products(this._products) {
    print('[Product Widget] constructor');
  }

  @override
  Widget build(BuildContext context) {
    print('[Product Widget] build() ${_products.length}');
    return Column(
      children: _products.map((element) {
        print('[Product Widget] in map');
        return Card(
          child: Column(
            children: <Widget>[
              //Image.asset('assets/food.jpg'),
              Text(element)
            ],
          ),
        );
      }).toList(),
    );
  }
}
