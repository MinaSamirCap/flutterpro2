import 'package:flutter/material.dart';
import 'package:flutter_course_2/products.dart';

class ProductManager extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProductManagerState();
  }
}

class _ProductManagerState extends State<ProductManager> {
  List<String> _products = ['Food Teaster 3'];

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
        margin: EdgeInsets.all(10.0),
        child: RaisedButton(
          onPressed: () {
            setState(() {
              _products.add('Adbanded Taster');
            });
          },
          child: Text('Add Product'),
        ),
      ),
      Products(_products)
    ]);
  }
}
