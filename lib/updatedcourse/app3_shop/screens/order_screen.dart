import 'package:flutter/material.dart';
import 'package:flutter_course_2/updatedcourse/app3_shop/providers/order_provider.dart'
    show Order;
import 'package:flutter_course_2/updatedcourse/app3_shop/widgets/app_drawer.dart';
import 'package:flutter_course_2/updatedcourse/app3_shop/widgets/order_item.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatelessWidget {
  static const ROUTE_NAME = '/orders';

  /*@override
  void initState() {
    // Future.delayed(Duration.zero).then((_) async {
    //   setState(() {
    //     _isLoading = true;
    //   });
    //   await Provider.of<Order>(context, listen: false).fetchAndSetOrders();
    //   setState(() {
    //     _isLoading = false;
    //   });
    // });
    super.initState();
  }*/

  @override
  Widget build(BuildContext context) {
    ///final orderData = Provider.of<Order>(context);
    ///we commented this to avoid infinity loop with the bulider and future and
    ///replace it with consumer around the listview builder ...

    return Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(
          title: Text('Your Orders'),
        ),
        body: FutureBuilder(
            future:
                Provider.of<Order>(context, listen: false).fetchAndSetOrders(),
            builder: (_, dataSnapshot) {
              if (dataSnapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                if (dataSnapshot.error != null) {
                  //// handle error ..
                  return Center(
                    child: Text('ERROR'),
                  );
                } else {
                  return Consumer<Order>(
                    builder: (ctx, orderData, child) {
                      return ListView.builder(
                          itemCount: orderData.orders.length,
                          itemBuilder: (ctx, index) =>
                              OrderItem(orderData.orders[index]));
                    },
                  );
                }
              }
            }));
  }
}
