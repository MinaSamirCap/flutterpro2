import 'package:flutter/material.dart';
import 'package:flutter_course_2/updatedcourse/app3_shop/providers/cart_provider.dart';
import 'package:flutter_course_2/updatedcourse/app3_shop/providers/order_provider.dart';
import 'package:flutter_course_2/updatedcourse/app3_shop/providers/products_provider.dart';
import 'package:flutter_course_2/updatedcourse/app3_shop/screens/cart_screen.dart';
import 'package:flutter_course_2/updatedcourse/app3_shop/screens/order_screen.dart';
import 'package:flutter_course_2/updatedcourse/app3_shop/screens/user_product_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_course_2/updatedcourse/app3_shop/screens/product_details_screen.dart';
import 'package:flutter_course_2/updatedcourse/app3_shop/screens/products_overview_screen.dart';

class ShopApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          builder: (ctx) => ProductsProvider(),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
        ChangeNotifierProvider.value(
          value: Order(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My Shop',
        theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.deepOrange,
            fontFamily: 'Lato'),
        home: ProductOverviewScreen(),
        routes: {
          //'/': (ctx) => ProductOverviewScreen(),
          ProductDetailsScreen.ROUTE_NAME: (ctx) => ProductDetailsScreen(),
          CartScreen.ROUTE_NAME: (ctx) => CartScreen(),
          OrderScreen.ROUTE_NAME: (ctx) => OrderScreen(),
          UserProductScreen.ROUTE_NAME: (ctx) => UserProductScreen(),
        },
      ),
    );
  }
}
