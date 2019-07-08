import 'package:flutter/material.dart';

class Answer extends StatelessWidget {

  final Function selectHandler;
  final String title;

  Answer({this.selectHandler, this.title})

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        color: Colors.blue,
        textColor: Colors.black,
        child: Text(title),
        onPressed: selectHandler,
      ),
    );
  }
}
