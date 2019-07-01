import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_course_2/pages/home.dart';
import 'package:flutter_course_2/product_manager.dart';
import 'package:flutter_course_2/products.dart';
import 'package:flutter_course_2/tasks/task1.dart';

void main() {
  //debugPaintSizeEnabled = true;
  //debugPaintBaselinesEnabled = true;
  //debugPaintPointersEnabled = true;
  runApp(MyApp()); // one line function only ...
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        //debugShowMaterialGrid: true,
        theme:
            ThemeData(brightness: Brightness.dark, primaryColor: Colors.amber),
        home: HomePage());
  }

  // @override
  // Widget build(BuildContext context) {
  //   // TODO: implement build
  //   return null;
  // }

  /// shift + alt + A --> multi line comment
  /// shift + alt + F --> format code

}
