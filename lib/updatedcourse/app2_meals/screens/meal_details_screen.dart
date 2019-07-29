import 'package:flutter/material.dart';
import 'package:flutter_course_2/updatedcourse/app2_meals/dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {
  static const ROUTE_NAME = '/meal-details';

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final meal = DUMMY_MEALS.singleWhere((item) {
      return item.id == mealId;
    });

    return Scaffold(
      appBar: AppBar(title: Text(meal.title),),
        body: Center(
      child: Text(meal.steps.join("****")),
    ));
  }
}
