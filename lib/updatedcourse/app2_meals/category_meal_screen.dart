import 'package:flutter/material.dart';

class CategoryMealScreen extends StatelessWidget {
  final String id;
  final String title;

  CategoryMealScreen(this.id, this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(child: Text('The recipes for category!!')));
  }
}
