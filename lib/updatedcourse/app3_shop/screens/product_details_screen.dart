import 'package:flutter/material.dart';
import 'package:flutter_course_2/updatedcourse/app3_shop/models/product.dart';
import 'package:flutter_course_2/updatedcourse/app3_shop/providers/products_provider.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const ROUTE_NAME = '/product-details';

  // final Product product;
  // ProductDetailsScreen(this.product);

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;

    Product product = Provider.of<ProductsProvider>(context, listen: false)
        .findById(productId);

    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '\$${product.price}',
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                product.description,
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}
