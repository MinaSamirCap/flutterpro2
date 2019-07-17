import 'package:flutter/material.dart';
import 'package:flutter_course_2/updatedcourse/app1_espenses/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransaction;

  TransactionList({this.userTransaction});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      child: (userTransaction.length == 0)
          ? Column(children: <Widget>[
            Container(child: Image.asset('assets/images/waiting.png', fit: BoxFit.cover,), height: 200,),
            SizedBox(height: 10,),
            Text('NO TRASACTIONS ADDED YET!!')
          ],)
          : ListView.builder(
              itemCount: userTransaction.length,
              itemBuilder: (ctx, index) {
                final item = userTransaction[index];
                return Card(
                    child: Row(
                  children: <Widget>[
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).primaryColor, width: 2)),
                      child: Text(
                        '\$ ${item.amount.toStringAsFixed(2)}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Theme.of(context).primaryColor),
                      ),
                      padding: EdgeInsets.all(10),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          item.title,
                          style: Theme.of(context).textTheme.title,
                        ),
                        Text(DateFormat.yMMMMEEEEd().format(item.date))
                      ],
                    )
                  ],
                ));
              },
            ),
    );
  }
}
