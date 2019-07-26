import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_course_2/updatedcourse/app1_espenses/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatefulWidget {
  final List<Transaction> userTransaction;
  final Function deleteTransaction;

  TransactionList({this.userTransaction, this.deleteTransaction});

  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  Color _bgColor;
  final colors = const [Colors.black, Colors.blue, Colors.red, Colors.yellow];

  @override
  void initState() {
    
    final index = Random().nextInt(4);
    print("<=======================INDEX=====================>: $index");
    _bgColor = colors[Random().nextInt(4)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: (widget.userTransaction.length == 0)
          ? LayoutBuilder(
              builder: (_, constraints) {
                return Column(
                  children: <Widget>[
                    Container(
                      height: constraints.maxHeight * 0.6,
                      child: Image.asset(
                        'assets/images/waiting.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'NO TRASACTIONS ADDED YET!!',
                      style: Theme.of(context).textTheme.title,
                    )
                  ],
                );
              },
            )
          : ListView.builder(
              itemCount: widget.userTransaction.length,
              itemBuilder: (ctx, index) {
                final item = widget.userTransaction[index];
                return Card(
                  elevation: 8,
                  margin: EdgeInsets.all(6),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: colors[Random().nextInt(4)],
                      radius: 30,
                      child: Padding(
                          padding: EdgeInsets.all(6),
                          child: FittedBox(child: Text('\$${item.amount}'))),
                    ),
                    title: Text(
                      item.title,
                      style: Theme.of(context).textTheme.title,
                    ),
                    subtitle: Text(DateFormat.yMMMMd().format(item.date)),
                    trailing: MediaQuery.of(context).size.width > 460
                        ? FlatButton.icon(
                            icon: Icon(Icons.delete),
                            textColor: Theme.of(context).errorColor,
                            label: Text('Delete'),
                            onPressed: () => widget.deleteTransaction(index),
                          )
                        : IconButton(
                            icon: Icon(Icons.delete),
                            color: Theme.of(context).errorColor,
                            onPressed: () => widget.deleteTransaction(index),
                          ),
                  ),
                );
              },
            ),
    );
  }
}
