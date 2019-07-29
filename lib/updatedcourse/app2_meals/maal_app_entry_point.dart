import 'package:flutter/material.dart';
import 'package:flutter_course_2/updatedcourse/app2_meals/screens/categories_screen.dart';
import 'package:flutter_course_2/updatedcourse/app2_meals/screens/category_meal_screen.dart';
import 'package:flutter_course_2/updatedcourse/app2_meals/screens/meal_details_screen.dart';

class MealApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              title: TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold))),
      // home: CategoriesScreen(),
      //initialRoute: '/',
      routes: {
        '/': (ctx) => CategoriesScreen(),
        CategoryMealScreen.ROUTE_NAME: (ctx) => CategoryMealScreen(),
        MealDetailsScreen.ROUTE_NAME: (ctx) => MealDetailsScreen(),
      },
    );
  }
}
