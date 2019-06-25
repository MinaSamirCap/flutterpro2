import 'package:flutter/material.dart';

void main() => runApp(MyApp()); // one line function only ...

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('EasyList'),
            ),
            body: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(10.0),
                  child: RaisedButton(
                    onPressed: () {},
                    child: Text('Add Product'),
                  ),
                ),
                Card(
                  child: Column(
                    children: <Widget>[
                      Image.asset('assets/food.jpg'),
                      Text('Food Paradise')
                    ],
                  ),
                ),
              ],
            )));
  }

  // @override
  // Widget build(BuildContext context) {
  //   // TODO: implement build
  //   return null;
  // }

  /// shift + alt + A --> multi line comment
  /// shift + alt + F --> format code

}
