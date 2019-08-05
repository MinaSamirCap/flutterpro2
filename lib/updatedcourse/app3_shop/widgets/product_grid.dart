import 'package:flutter/material.dart';
import 'package:flutter_course_2/updatedcourse/app3_shop/providers/products_provider.dart';
import 'package:provider/provider.dart';

import 'product_item.dart';

class ProductGrid extends StatelessWidget {
  final bool showFav;

  ProductGrid(this.showFav);

  @override
  Widget build(BuildContext context) {
    ProductsProvider productsProvider = Provider.of<ProductsProvider>(context);
    final productList =
        showFav ? productsProvider.favoriteItems : productsProvider.items;

    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: productList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      itemBuilder: (ctx, index) {
        /// we use ChangeNotifierProvider.value() with value attribute
        /// instead of ChangeNotifierProvider() with builder attribute
        /// .value approche is working perfectrly with the list rather than builder style.
        /// because flutter will recycle the items so we may find mismatch with the data if we used the builder style
        /// so we recommend to use .value with any type of list or grid
        return ChangeNotifierProvider.value(
          value: productList[index],
          //builder: (ctxt) => productList[index], -->
          child: ProductItem(),
        );
      },
    );
  }
}
