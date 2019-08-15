import 'package:flutter/material.dart';
import 'package:flutter_course_2/updatedcourse/app3_shop/widgets/app_drawer.dart';
import 'package:flutter_course_2/updatedcourse/app3_shop/widgets/user_product_item.dart';
import 'package:provider/provider.dart';
import '../providers/products_provider.dart';
import 'edit_product_screen.dart';

class UserProductScreen extends StatelessWidget {
  static const ROUTE_NAME = '/user-products';

  Future<void> _refreshProducts(BuildContext context) async {
    await Provider.of<ProductsProvider>(context, listen: false)
        .fetchAndSetProducts(true);
  }

  @override
  Widget build(BuildContext context) {
    //final productsProvider = Provider.of<ProductsProvider>(context);
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text('Your Products'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed(EditProductScreen.ROUTE_NAME);
            },
          )
        ],
      ),
      body: FutureBuilder(
        future: _refreshProducts(context),
        builder: (ctx, dataSnapshot) =>
            dataSnapshot.connectionState == ConnectionState.waiting
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : RefreshIndicator(
                    onRefresh: () => _refreshProducts(context),
                    child:  Consumer<ProductsProvider>(builder: (ctx, productsProvider, _) => Padding(
                      padding: const EdgeInsets.all(8),
                      child: ListView.builder(
                        itemCount: productsProvider.items.length,
                        itemBuilder: (_, index) => Column(
                          children: <Widget>[
                            UserProductItem(
                                productsProvider.items[index].id,
                                productsProvider.items[index].title,
                                productsProvider.items[index].imageUrl),
                            Divider()
                          ],
                        ),
                      ),
                    ),) 
                  ),
      ),
    );
  }
}
