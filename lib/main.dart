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

/** in stateful widget we split the responsibility into 2 classes because
 * everytime the widget will be recreated 
 * the state no need to recreated also to keep track of the state .. :) logically
 */

class MyApp2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyApp2State();
  }
}

// this line State<MyApp2> says that this state belongs to MyApp2 Class
class _MyApp2State extends State<MyApp2> {
  var _questions = [
    "What is your favorite color?",
    "What is your favorite animal?"
  ];
  int _questionIndex = 0;
  void _answerChosen() {
    setState(() {
      _questionIndex++;
    });
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
            Text(_questions.elementAt(_questionIndex)),
            RaisedButton(
              child: Text('Answer 1'),
              onPressed: _answerChosen,
            ),
            RaisedButton(
              child: Text('Answer 2'),
              onPressed: () => print("Answer Chosen 2"),
            ),
            RaisedButton(
              child: Text('Answer 3'),
              onPressed: () {
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
