import 'package:flutter/material.dart';
import 'package:flutter_course_2/updatedcourse/app3_shop/providers/products_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_course_2/updatedcourse/app3_shop/models/product.dart';

import 'product_item.dart';

class ProductGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ProductsProvider productsProvider = Provider.of<ProductsProvider>(context);

    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: productsProvider.items.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      itemBuilder: (ctx, index) {
        return ChangeNotifierProvider(
          builder: (ctxt) => productsProvider.items[index],
          child: ProductItem(),
        );
      },
    );
  }
}
