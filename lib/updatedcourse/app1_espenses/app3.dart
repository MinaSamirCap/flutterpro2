import 'package:flutter/material.dart';
import 'models/transaction.dart';

import 'widgets/new_transaction.dart';
import 'widgets/transaction_list.dart';

class MyApp3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.blue,
            fontFamily: 'Quicksand',
            textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            appBarTheme: AppBarTheme(
                textTheme: ThemeData.light().textTheme.copyWith(
                    title: TextStyle(
                        fontFamily: 'OpenSans',
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold)))),
        home: HomePageApp3());
  }
}

class HomePageApp3 extends StatefulWidget {
  @override
  _HomePageApp3State createState() => _HomePageApp3State();
}

class _HomePageApp3State extends State<HomePageApp3> {
  final List<Transaction> _userTransaction = [
    Transaction(
        id: 't1', title: 'new shose', amount: 69.99, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'Weekly grocery', amount: 129, date: DateTime.now()),
    Transaction(
        id: 't3', title: 'Weekly ciyrse===', amount: 129, date: DateTime.now()),
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

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            behavior: HitTestBehavior.opaque,
            child: NewTransaction(
              addNewTransaction: _addNewTransaction,
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Expenses App',
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewTransaction(this.context),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.blueGrey,
                child: Text('CHART'),
              ),
            ),
            TransactionList(
              userTransaction: _userTransaction,
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
