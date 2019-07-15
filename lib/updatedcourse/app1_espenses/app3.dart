import 'package:flutter/material.dart';
import 'package:flutter_course_2/updatedcourse/app1_espenses/transaction.dart';

class MyApp3 extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        id: 't1', title: 'new shose', amount: 69.99, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'Weekly grocery', amount: 129, date: DateTime.now())
  ];

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
          Column(
            children: transactions.map((item) {
              return Card(
                  child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.brown, width: 2)),
                    child: Text(
                      '\$ ${item.amount}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.purple),
                    ),
                    padding: EdgeInsets.all(10),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(item.title, style: TextStyle(fontWeight: FontWeight.bold),),
                      Text(item.date.toString())
                    ],
                  )
                ],
              ));
            }).toList(),
          )
        ],
      ),
    ));
  }
}
