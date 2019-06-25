import 'package:flutter/material.dart';
import 'package:flutter_course_2/product_manager.dart';
import 'package:flutter_course_2/products.dart';
import 'package:flutter_course_2/tasks/task1.dart';

void main() => runApp(Task1()); // one line function only ...

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme:
            ThemeData(brightness: Brightness.dark, primaryColor: Colors.amber),
        home: Scaffold(
            appBar: AppBar(
              title: Text('EasyList'),
            ),
            body: ProductManager(startingPorduct: 'MonMon',)));
  }

  // @override
  // Widget build(BuildContext context) {
  //   // TODO: implement build
  //   return null;
  // }

  /// shift + alt + A --> multi line comment
  /// shift + alt + F --> format code

}
