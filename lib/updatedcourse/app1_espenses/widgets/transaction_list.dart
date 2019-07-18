import 'package:flutter/material.dart';
import 'package:flutter_course_2/updatedcourse/app1_espenses/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransaction;
  final Function deleteTransaction;

  TransactionList({this.userTransaction, this.deleteTransaction});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: (userTransaction.length == 0)
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
                    Text('NO TRASACTIONS ADDED YET!!')
                  ],
                );
              },
            )
          : ListView.builder(
              itemCount: userTransaction.length,
              itemBuilder: (ctx, index) {
                final item = userTransaction[index];
                return Card(
                  elevation: 8,
                  margin: EdgeInsets.all(6),
                  child: ListTile(
                    leading: CircleAvatar(
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
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                      onPressed: () => deleteTransaction(index),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
