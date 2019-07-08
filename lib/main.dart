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
  runApp(MyApp2()); // one line function only ...

  //////////////// the new updated course start from lesson 2
}

class MyApp2 extends StatelessWidget {
  void answerChosen() {
    print("answer chosen");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: Column(
          children: <Widget>[
            Text("this is my quiestion"),
            RaisedButton(
              child: Text('Answer 1'),
              onPressed: answerChosen,
            ),
             RaisedButton(
              child: Text('Answer 2'),
              onPressed: () => print("Answer Chosen 2"),
            ),
             RaisedButton(
              child: Text('Answer 3'),
              onPressed: (){
                print("Answer chosen 3");
              },
            )
          ],
        ),
      ),
    );
  }
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
