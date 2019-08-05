import 'package:flutter/material.dart';
import 'package:flutter_course_2/updatedcourse/app3_shop/providers/products_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_course_2/updatedcourse/app3_shop/screens/product_details_screen.dart';
import 'package:flutter_course_2/updatedcourse/app3_shop/screens/products_overview_screen.dart';

class ShopApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (ctx) => ProductsProvider(),
      child: MaterialApp(
        title: 'My Shop',
        theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.deepOrange,
            fontFamily: 'Lato'),
        home: ProductOverviewScreen(),
        routes: {
          //'/': (ctx) => ProductOverviewScreen(),
          ProductDetailsScreen.ROUTE_NAME: (ctx) => ProductDetailsScreen(),
        },
      ),
    );
  }
}
