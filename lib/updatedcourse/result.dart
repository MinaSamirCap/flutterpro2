import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;
  Result(this.totalScore);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('YOU DID IT \n $totalScore'));
  }
}
