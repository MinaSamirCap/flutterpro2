import 'package:flutter/material.dart';
import 'models/transaction.dart';

import 'widgets/chart.dart';
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
                    fontWeight: FontWeight.bold),
                button: TextStyle(color: Colors.white)),
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
  final List<Transaction> _userTransaction = [];

  List<Transaction> get _recentTransaction {
    return _userTransaction.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _addNewTransaction(String title, double amount, DateTime date) {
    final newTrans = Transaction(
        title: title,
        amount: amount,
        date: date,
        id: DateTime.now().toString());

    setState(() {
      _userTransaction.add(newTrans);
    });
  }

  void _deleteTransaction(int index) {
    setState(() {
      //_userTransaction.removeAt(index);
      _userTransaction.removeWhere((item) => item.id == index);
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
    var appBar = AppBar(
      title: Text(
        'Expenses App',
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () => _startAddNewTransaction(this.context),
        )
      ],
    );

    final listHeight = (MediaQuery.of(context).size.height -
            appBar.preferredSize.height -
            MediaQuery.of(context).padding.top) *
        0.7;
    final chartHeight = (MediaQuery.of(context).size.height -
            appBar.preferredSize.height -
            MediaQuery.of(context).padding.top) *
        0.3;

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(height: chartHeight, child: Chart(_recentTransaction)),
            Container(
              height: listHeight,
              child: TransactionList(
                  userTransaction: _userTransaction,
                  deleteTransaction: _deleteTransaction),
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
