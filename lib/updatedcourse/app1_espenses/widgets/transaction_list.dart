import 'package:flutter/material.dart';
import 'package:flutter_course_2/updatedcourse/app1_espenses/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {

  final List<Transaction> userTransaction;

  TransactionList({this.userTransaction});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: userTransaction.map((item) {
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
                Text(
                  item.title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(DateFormat.yMMMMEEEEd().format(item.date))
              ],
            )
          ],
        ));
      }).toList(),
    );
  }
}
