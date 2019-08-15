import 'package:flutter/material.dart';
import 'package:flutter_course_2/updatedcourse/app3_shop/providers/auth_provider.dart';
import 'package:flutter_course_2/updatedcourse/app3_shop/providers/cart_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_course_2/updatedcourse/app3_shop/models/product.dart';
import 'package:flutter_course_2/updatedcourse/app3_shop/screens/product_details_screen.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Product product = Provider.of<Product>(context, listen: false);
    Cart cart = Provider.of<Cart>(context, listen: false);
    Auth auth = Provider.of<Auth>(context, listen: false);

    print('ProductItem: buildbuildbuild');

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            // Navigator.of(context).push(MaterialPageRoute(builder: (cxt) {
            //   return ProductDetailsScreen(product);
            // }));
            Navigator.of(context).pushNamed(ProductDetailsScreen.ROUTE_NAME,
                arguments: product.id);
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<Product>(
            builder: (ctxt, changedProduct, _) => IconButton(
              color: Theme.of(context).accentColor,
              icon: Icon(changedProduct.isFavorite
                  ? Icons.favorite
                  : Icons.favorite_border),
              onPressed: () {
                product.toggleFavoriteState(auth.token, auth.userId);
              },
            ),
          ),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            color: Theme.of(context).accentColor,
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              cart.addItem(product.id, product.price, product.title);

              /// here flutter will return the nearest scafold to show the snackbar ...
              /// becasue we need a widget that control the page to show the snakbar ...
              /// like the problem I face to show the button sheet also in drawer ...
              /// so we will find methods leke showSnackBar for buttonSheet and drawer
              /// Scaffold.of(context).showBottomSheet() Scaffold.of(context).openDrawer()

              Scaffold.of(context).hideCurrentSnackBar();
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text('Added item to cart'),
                duration: Duration(seconds: 2),
                action: SnackBarAction(
                  label: "UNDO",
                  onPressed: () {
                    cart.removeSingleItem(product.id);
                  },
                ),
              ));
            },
          ),
        ),
      ),
    );
  }
}
