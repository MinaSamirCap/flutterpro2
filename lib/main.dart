import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_course_2/pages/home.dart';
import 'package:flutter_course_2/updatedcourse/app4_places/placea_app_entry_point.dart';
import './updatedcourse/app5_battary/battary_app_entry_point.dart';

import 'package:flutter_course_2/updatedcourse/quiz.dart';
import 'package:flutter_course_2/updatedcourse/result.dart';

import 'updatedcourse/app1_espenses/app3.dart';
import 'updatedcourse/app2_meals/maal_app_entry_point.dart';
import 'updatedcourse/app3_shop/shop_app_entry_point.dart';

void main() {
  debugPrintEndFrameBanner = false;
  //debugPaintSizeEnabled = true;
  //debugPaintBaselinesEnabled = true;
  //debugPaintPointersEnabled = true;
  //runApp(MyApp2()); // one line function only ...

  /// to prevent app from rotation ...
  /*SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitUp]);*/
  //runApp(MyApp3()); // one line function only ...
  //runApp(MealApp()); // one line function only ...
  //runApp(ShopApp()); // one line function only ...
  //runApp(PlacesApp()); // one line function only ...
  runApp(BattaryApp()); // one line function only ...

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
  int _totalScore = 0;

  /// List<Map<String, Object>>
  var _questions = [
    {
      'questionText': 'What is your favorite color?',
      'answers': [
        {'text': 'black', 'score': 10},
        {'text': 'white', 'score': 6},
        {'text': 'blue', 'score': 1},
      ]
    },
    {
      'questionText': 'What is your favorite animal?',
      'answers': [
        {'text': 'dog', 'score': 10},
        {'text': 'cat', 'score': 10},
        {'text': 'duk', 'score': 10},
      ]
    },
    {
      'questionText': 'What is your favorite instructor?',
      'answers': [
        {'text': 'max', 'score': 8},
        {'text': 'paulo', 'score': 9},
        {'text': 'nermu', 'score': 10},
      ]
    }
  ];

  void _resetQuiz() {
    setState(() {
      _totalScore = 0;
      _questionIndex = 0;
    });
  }

  void _answerChosen(int score) {
    setState(() {
      _questionIndex++;
      _totalScore += score;
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
        body: (_questionIndex < _questions.length)
            ? Quiz(
                questions: _questions,
                questionIndex: _questionIndex,
                answerQuestion: _answerChosen,
              )
            : Result(_totalScore, _resetQuiz),
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
  //
  //   return null;
  // }

  /// shift + alt + A --> multi line comment
  /// shift + alt + F --> format code
  /// shift + alt + down arrow --> doublicate code
  /// ctrl + shift + p --> open devtools

}
