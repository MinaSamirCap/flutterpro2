import 'package:flutter/material.dart';

class Task1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme:
            ThemeData(brightness: Brightness.dark, primaryColor: Colors.amber),
        home: Scaffold(
            appBar: myAppBar(),
            body: Container(
              margin: EdgeInsets.all(12.0),
              child: MyBody()
            )));
  }
}



Widget myAppBar() {
  return AppBar(
    title: Text('Task1'),
    backgroundColor: Colors.amber,
    centerTitle: true,
  );
}

class MyBody extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    
    return MyBodyState();
  }

}

class MyBodyState extends State<MyBody>{

  String myText = "current text";

  @override
  Widget build(BuildContext context) {
    return Column(
                children: <Widget>[
                  MyText(text: myText),
                  RaisedButton(
                    child: Text('change text'),
                    onPressed: () {
                      setState(() {
                       myText = " I changed text ..."; 
                      });
                    },
                  )
                ],
              );
  }
}


class MyText extends StatelessWidget {

  final String text;

  MyText({this.text});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(text),
      backgroundColor: Colors.amber,
      centerTitle: true,
    );
  }
}
