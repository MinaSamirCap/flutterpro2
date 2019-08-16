import 'package:flutter/material.dart';
import 'package:flutter_course_2/updatedcourse/app3_shop/helpers/custom_route.dart';
import 'package:flutter_course_2/updatedcourse/app3_shop/providers/auth_provider.dart';
import 'package:flutter_course_2/updatedcourse/app3_shop/providers/cart_provider.dart';
import 'package:flutter_course_2/updatedcourse/app3_shop/providers/order_provider.dart';
import 'package:flutter_course_2/updatedcourse/app3_shop/providers/products_provider.dart';
import 'package:flutter_course_2/updatedcourse/app3_shop/screens/auth-screen.dart';
import 'package:flutter_course_2/updatedcourse/app3_shop/screens/cart_screen.dart';
import 'package:flutter_course_2/updatedcourse/app3_shop/screens/edit_product_screen.dart';
import 'package:flutter_course_2/updatedcourse/app3_shop/screens/order_screen.dart';
import 'package:flutter_course_2/updatedcourse/app3_shop/screens/splash-screen.dart';
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
          builder: (ctx) => Auth(),
        ),

        /// NOW we need to provide the ProductProvider with a token to be able to access the data from firebase.
        /// THE problem is that the Auth() is resposible for the token and how we will bath the token from one
        /// CLASS to another...
        ///
        /// THANKFULLY the provider package has an easy solution fot this ...
        /// INSTEAD of using ChangeNotifierProvider we will use ChangeNotifierProxyProvider<K, T>
        /// THIS class inforce us to using the build type instead of .value constructor because it will be
        /// REBUILD in the case of changing the data that will depend on it ...
        /// THE <K, T> --> The two pracets allow us to make a aprovider that depends on another provider that
        /// WE ALREADY DEFINE IT PREVIOUSLY ..
        /// K --> represents the class we depend on it.
        /// T --> the class we will provide by the provider.
        /// THE builder in ChangeNotifierProxyProvider provide us with 3 parameters ..
        /// ONE --> the context
        /// TWO --> the class we depend on
        /// THREE --> the previous version of data that we will provide with the provider ... to maintain our data
        /// BECAUSE every time the notifier will use the builder will create a new instance of the provided class.
        /// IF I HAVE more that dependency that I want to provide I can use ChangeNotifierProxyProvider2
        /// ChangeNotifierProxyProvider3 , 4, 5 up to 6

        ChangeNotifierProxyProvider<Auth, ProductsProvider>(
          builder: (ctx, auth, previousProducts) => ProductsProvider(
              auth.token, auth.userId,
              /*previousProducts.items == null ? [] : previousProducts.items*/ []),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
        ChangeNotifierProxyProvider<Auth, Order>(
          builder: (ctx, auth, previousOrder) => Order(auth.token, auth.userId,
              /*previousOrder.orders == null ? [] : previousOrder.orders*/ []),
        )
      ],
      child: Consumer<Auth>(
          builder: (ctx, auth, _) => MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'My Shop',
                theme: ThemeData(
                    primarySwatch: Colors.purple,
                    accentColor: Colors.deepOrange,
                    pageTransitionsTheme: PageTransitionsTheme(builders: {
                      TargetPlatform.android: CustomPageTransitionBuilder(),
                      TargetPlatform.iOS: CustomPageTransitionBuilder(),
                    }),
                    fontFamily: 'Lato'),
                home: auth.isAuth
                    ? ProductOverviewScreen()
                    : FutureBuilder(
                        future: auth.tryAutoLogin(),
                        builder: (ctx, authResultSnapshot) =>
                            authResultSnapshot.connectionState ==
                                    ConnectionState.waiting
                                ? SplashScreen()
                                : AuthScreen(),
                      ),
                routes: {
                  //'/': (ctx) => ProductOverviewScreen(),
                  ProductDetailsScreen.ROUTE_NAME: (ctx) =>
                      ProductDetailsScreen(),
                  CartScreen.ROUTE_NAME: (ctx) => CartScreen(),
                  OrderScreen.ROUTE_NAME: (ctx) => OrderScreen(),
                  UserProductScreen.ROUTE_NAME: (ctx) => UserProductScreen(),
                  EditProductScreen.ROUTE_NAME: (ctx) => EditProductScreen(),
                },
              )),
    );
  }
}
