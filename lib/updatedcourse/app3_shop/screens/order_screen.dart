import 'package:flutter/material.dart';
import 'package:flutter_course_2/updatedcourse/app3_shop/providers/order_provider.dart'
    show Order;
import 'package:flutter_course_2/updatedcourse/app3_shop/widgets/app_drawer.dart';
import 'package:flutter_course_2/updatedcourse/app3_shop/widgets/order_item.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatelessWidget {
  static const ROUTE_NAME = '/orders';

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Order>(context);

    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      body: ListView.builder(
        itemCount: orderData.orders.length,
        itemBuilder: (ctx, index) {
          return OrderItem(orderData.orders[index]);
        },
      ),
    );
  }
}
