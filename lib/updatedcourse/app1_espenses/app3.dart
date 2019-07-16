import 'package:flutter/material.dart';
import 'package:flutter_course_2/updatedcourse/app1_espenses/models/transaction.dart';
import 'package:flutter_course_2/updatedcourse/app1_espenses/widgets/user_transactions.dart';

class MyApp3 extends StatelessWidget {
  final List<Transaction> transactions = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('ExpensesApp'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blueGrey,
              child: Text('CHART'),
            ),
          ),
          UserTransations()
        ],
      ),
    ));
  }
}
