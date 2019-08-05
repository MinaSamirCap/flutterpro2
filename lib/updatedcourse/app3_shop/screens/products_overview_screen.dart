import 'package:flutter/material.dart';
import 'package:flutter_course_2/updatedcourse/app3_shop/widgets/product_grid.dart';

class ProductOverviewScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
      ),
      body: new ProductGrid(),
    );
  }
}

