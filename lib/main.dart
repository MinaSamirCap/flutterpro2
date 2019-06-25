import 'package:flutter/material.dart';

void main() => runApp(MyApp()); // one line function only ...

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  List<String> _products = ['Food Teaster'];

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
                    onPressed: () {
                      setState(() {
                       _products.add('Adbanded Taster'); 
                      });
                    },
                    child: Text('Add Product'),
                  ),
                ),
                Column(
                  children: _products
                      .map(
                        (element) => Card(
                              child: Column(
                                children: <Widget>[
                                  Image.asset('assets/food.jpg'),
                                  Text(element)
                                ],
                              ),
                            ),
                      )
                      .toList(),
                )
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
