import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;
  final Function reset;
  Result(this.totalScore, this.reset);

  String get resultPhase {
    String resultText;
    if (totalScore <= 8) {
      resultText = "YOU ARE BAD";
    } else if (totalScore <= 12) {
      resultText = "Pretty likable";
    } else if (totalScore <= 16) {
      resultText = "Your are ... Strange .. !!";
    } else {
      resultText = "You are awesome and innocent!!";
    }
    return resultText + " Your score: $totalScore";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(
            child: Text(
          resultPhase,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent),
        )),
        FlatButton(
          child: Text('Reset Quiz'),
          onPressed: reset,
        )
      ],
    );
  }
}
