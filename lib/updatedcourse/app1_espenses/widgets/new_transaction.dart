import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'adaptive_flat_button.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;

  NewTransaction({this.addNewTransaction}){
      printInDebut("Constructor --> NewTransaction");
  }

  @override
  _NewTransactionState createState() {
    printInDebut("Create State --> NewTransaction");
    return _NewTransactionState();
  }
}

class _NewTransactionState extends State<NewTransaction> with WidgetsBindingObserver{
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;


  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
      print("LIFECYCLE ===== $state");
  }

  _NewTransactionState(){
    printInDebut("Constructor Create State --> NewTransaction");
  }

  @override
  void initState() {
    printInDebut("Init State --> NewTransaction");
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didUpdateWidget(NewTransaction oldWidget) {
    printInDebut("Did Update Widget --> NewTransaction");
    /// widget object here will refer to the new one and the old one is bassed in the function
    /// widget 
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    printInDebut("Dispose --> NewTransaction");
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void _submitData() {
    final text = _titleController.text;
    final amount = double.parse(_amountController.text);

    if (text.isEmpty || amount <= 0 || _selectedDate == null) {
      return;
    }

    widget.addNewTransaction(text, amount, _selectedDate);
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) return;
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Container(
          padding: EdgeInsets.only(
              left: 10,
              top: 10,
              right: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: _titleController,
                onSubmitted: (_) =>
                    _submitData(), // because it is an anonemous function we must pass function --> submitData()
                // onChanged: (value) {
                //   titleInput = value;
                // },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amout'),
                controller: _amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) =>
                    _submitData(), // because it is an anonemous function we must pass --> submitData()
                //onChanged: (value) => amountInput = value,
              ),
              Container(
                height: 70,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(_selectedDate == null
                          ? 'No Date Selected'
                          : DateFormat.yMd().format(_selectedDate)),
                    ),
                    AdaptiveFlatButton('Choose Date', _presentDatePicker),
                  ],
                ),
              ),
              RaisedButton(
                  child: Text('Add Transaction'),
                  color: Theme.of(context).primaryColor,
                  textColor: Theme.of(context).textTheme.button.color,
                  onPressed:
                      _submitData) // because it is not an anonemous function we directly pass refrences
            ],
          ),
        ),
      ),
    );
  }
}



void printInDebut(String message){
  print(message);
}
