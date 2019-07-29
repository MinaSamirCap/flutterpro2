import 'package:flutter/material.dart';

class CategoryMealScreen extends StatelessWidget {

  static const ROUTE_NAME = '/cagegory-meals';
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
        body: ListView.builder(itemCount: ,itemBuilder: (ctx, index){
          
        },));
  }
}
