import 'package:flutter/material.dart';
import 'package:flutter_course_2/updatedcourse/app1_espenses/models/transaction.dart';

import 'new_transaction.dart';
import 'transaction_list.dart';

class UserTransations extends StatefulWidget {
  @override
  _UserTransationsState createState() => _UserTransationsState();
}

class _UserTransationsState extends State<UserTransations> {
  final List<Transaction> _userTransaction = [
    Transaction(
        id: 't1', title: 'new shose', amount: 69.99, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'Weekly grocery', amount: 129, date: DateTime.now()),
    Transaction(
        id: 't3', title: 'Weekly ciyrse===', amount: 129, date: DateTime.now())
  ];

  void _addNewTransaction(String title, double amount) {
    final newTrans = Transaction(
        title: title,
        amount: amount,
        date: DateTime.now(),
        id: DateTime.now().toString());

    setState(() {
      _userTransaction.add(newTrans);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(
          addNewTransaction: _addNewTransaction,
        ),
        TransactionList(
          userTransaction: _userTransaction,
        )
      ],
    );
  }
}
