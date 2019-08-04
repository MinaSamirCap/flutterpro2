import 'package:flutter/material.dart';

class ShopApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Shop App'),
        ),
        body: Center(child: Text('MinaSamir'),),
      ),
    );
  }
}
