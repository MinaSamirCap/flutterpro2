import 'package:flutter/material.dart';
import 'package:flutter_course_2/pages/product.dart';

class Products extends StatelessWidget {
  final List<String> _products;

  Products(this._products) {
    print('[Product Widget] constructor');
  }

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset('assets/food.jpg'),
          Text(_products[index]),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text('Details'),
                onPressed: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => ProductPage()))
                    },
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildProductCard() {
    Widget productCard;
    if (_products.length > 0) {
      productCard = ListView.builder(
        itemBuilder: _buildProductItem,
        itemCount: _products.length,
      );
    } else {
      productCard = Center(child: Text("No added Product"));
    }
    return productCard;
  }

  @override
  Widget build(BuildContext context) {
    print('[Product Widget] build() ${_products.length}');
    return _buildProductCard();
  }
}
