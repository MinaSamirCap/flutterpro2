import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_course_2/pages/home.dart';
import 'package:flutter_course_2/product_manager.dart';
import 'package:flutter_course_2/products.dart';
import 'package:flutter_course_2/tasks/task1.dart';

import 'updatedcourse/answer.dart';
import 'updatedcourse/question.dart';

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
  int _questionIndex = 0;

  /// List<Map<String, Object>>
  var _questions = [
    {
      'questionText': 'What is your favorite color?',
      'answers': ['black', 'white', 'blue']
    },
    {
      'questionText': 'What is your favorite animal?',
      'answers': ['dog', 'cat', 'duk']
    },
    {
      'questionText': 'What is your favorite instructor?',
      'answers': ['max', 'paulo', 'nermu']
    }
  ];

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
            Question(_questions.elementAt(_questionIndex)['questionText']),
            ...(_questions[_questionIndex]['answers'] as List<String>).map((answer) {
              return Answer(title: answer, selectHandler: _answerChosen);
            }).toList(),
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
