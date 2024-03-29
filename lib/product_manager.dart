import 'package:flutter/material.dart';
import 'package:flutter_course_2/product_control.dart';
import 'package:flutter_course_2/products.dart';

class ProductManager extends StatefulWidget {
  final Map<String, String> startingPorduct;

  ProductManager({this.startingPorduct}) {
    print('[ProductManager] Constructor');
  }

  @override
  State<StatefulWidget> createState() {
    print('[ProductManager] createState()');
    return _ProductManagerState();
  }
}

class _ProductManagerState extends State<ProductManager> {
  List<Map<String, String>> _products = [];

  @override
  void initState() {
    print('[_ProductManagerState] initState()');

    /// we use widget property to access anything from the StatefulWidget
    /// that this state belongs to ...

    if (widget.startingPorduct != null) {
      _products.add(widget.startingPorduct);
    }

    super.initState();

    /// we did not need to call setState in initState because
    /// initState is called before the build method called so
    /// the data already got their values ..
  }

  void _addProduct(Map<String, String> product) {
    setState(() {
      /// setState will only call build method and will not reConstruct the all widget
      _products.add(product);
    });
  }

  void _deleteProduct(int index) {
    setState(() {
      /// setState will only call build method and will not reConstruct the all widget
      _products.removeAt(index);
    });
  }

  @override
  void didUpdateWidget(ProductManager oldWidget) {
    print('[_ProductManagerState] didUpdateWidget()');
    print('[_ProductManagerState] didUpdateWidget() ${_products.length}');
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    print('[_ProductManagerState] build()');
    return Column(children: <Widget>[
      Container(
        margin: EdgeInsets.all(10.0),
        child: ProductControl(addProduct: _addProduct),
      ),
      Expanded(child: Products(_products, deleteProduct: _deleteProduct,))
    ]);
  }
}
