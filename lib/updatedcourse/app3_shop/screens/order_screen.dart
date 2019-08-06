import 'package:flutter/material.dart';
import 'package:flutter_course_2/updatedcourse/app3_shop/providers/order_provider.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final orders = Provider.of<Order>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),

      ),
      body: Center(),
    );
  }
}
