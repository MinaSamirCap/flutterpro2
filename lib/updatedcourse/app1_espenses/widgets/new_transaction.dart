import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addNewTransaction;

  NewTransaction({this.addNewTransaction});

  void submitData() {

    final text = titleController.text;
    final amount = double.parse(amountController.text);

    if(text.isEmpty || amount <=0){
      return;
    }

    addNewTransaction(text, amount);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => submitData(), // because it is an anonemous function we must pass function --> submitData()
              // onChanged: (value) {
              //   titleInput = value;
              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amout'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(), // because it is an anonemous function we must pass --> submitData()
              //onChanged: (value) => amountInput = value,
            ),
            FlatButton(
                child: Text('Add Transaction'),
                textColor: Colors.purple,
                onPressed: submitData) // because it is not an anonemous function we directly pass refrences
          ],
        ),
      ),
    );
  }
}
