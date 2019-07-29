import 'package:flutter/material.dart';

class CategoryMealScreen extends StatelessWidget {
  /* final String id;
  final String title;

  CategoryMealScreen(this.id, this.title); */

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];

    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: Center(child: Text('The recipes for category!!')));
  }
}
