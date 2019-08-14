import 'package:flutter/material.dart';
import 'package:flutter_course_2/updatedcourse/app3_shop/providers/products_provider.dart';
import 'package:flutter_course_2/updatedcourse/app3_shop/screens/cart_screen.dart';
import 'package:flutter_course_2/updatedcourse/app3_shop/widgets/app_drawer.dart';
import 'package:provider/provider.dart';
import 'package:flutter_course_2/updatedcourse/app3_shop/providers/cart_provider.dart';
import 'package:flutter_course_2/updatedcourse/app3_shop/widgets/badge.dart';
import 'package:flutter_course_2/updatedcourse/app3_shop/widgets/product_grid.dart';

enum FilterOptions {
  Favorite,
  All,
}

class ProductOverviewScreen extends StatefulWidget {
  @override
  _ProductOverviewScreenState createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _showOnlyFavorites = false;
  var _isInit = true;
  var _isLoading = false;

  @override
  void initState() {
    /// Provider.of<ProductsProvider>(context).fetchAndSetProducts(); WILL NOT WORK --> becasue
    /// the context still not ready to use
    /// Alternative way ...
    /// we can use futer with zero delay because future will execute after fully initialized .. :)
    // Future.delayed(Duration.zero).then((_) {
    //   Provider.of<ProductsProvider>(context).fetchAndSetProducts();
    // });
    /// that is work around .. another approach we will use didChangedDependency(); with a flag
    /// because this method is running more than one time ...
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      _isLoading = true;
      Provider.of<ProductsProvider>(context).fetchAndSetProducts().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text('MyShop'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favorite) {
                  //...
                  _showOnlyFavorites = true;
                } else {
                  //...
                  _showOnlyFavorites = false;
                }
              });
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Only Favorites'),
                value: FilterOptions.Favorite,
              ),
              PopupMenuItem(
                child: Text('Show All'),
                value: FilterOptions.All,
              ),
            ],
          ),
          Consumer<Cart>(
            builder: (ctxt, cart, ch) => Badge(
              child: ch,
              value: cart.itemCount.toString(),
            ),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.ROUTE_NAME);
              },
            ),
          ),
        ],
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ProductGrid(_showOnlyFavorites),
    );
  }
}
