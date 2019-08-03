import 'package:flutter/material.dart';
import 'package:flutter_course_2/updatedcourse/app2_meals/dummy_data.dart';
import 'package:flutter_course_2/updatedcourse/app2_meals/screens/categories_screen.dart';
import 'package:flutter_course_2/updatedcourse/app2_meals/screens/category_meal_screen.dart';
import 'package:flutter_course_2/updatedcourse/app2_meals/screens/fliter_screen.dart';
import 'package:flutter_course_2/updatedcourse/app2_meals/screens/meal_details_screen.dart';
import 'package:flutter_course_2/updatedcourse/app2_meals/screens/tabs_screen.dart';

import 'models/meal.dart';

class MealApp extends StatefulWidget {
  @override
  _MealAppState createState() => _MealAppState();
}

class _MealAppState extends State<MealApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vagan': false,
    'vegetarien': false
  };

  List<Meal> _availableMeals = DUMMY_MEALS;

  void _setFilters(Map<String, bool> filtersData) {
    setState(() {
      _filters = filtersData;

      _availableMeals = DUMMY_MEALS.where((item) {
        // ....
        if (_filters['gluten'] && !item.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !item.isLactoseFree) {
          return false;
        }
        if (_filters['vagan'] && !item.isVegan) {
          return false;
        }
        if (_filters['vegetarien'] && !item.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

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
        '/': (ctx) => TabsScreen(),
        CategoryMealScreen.ROUTE_NAME: (ctx) =>
            CategoryMealScreen(_availableMeals),
        MealDetailsScreen.ROUTE_NAME: (ctx) => MealDetailsScreen(),
        FilterScreen.ROUTE_NAME: (ctx) => FilterScreen(_filters, _setFilters),
      },
      /*  onGenerateRoute: (setting) {
        return MaterialPageRoute(
            builder: (ctx) => Center(
                  child: Text('OnGenerateRoute'),
                ));
      }, */
      onUnknownRoute: (setting) {
        return MaterialPageRoute(
            builder: (ctx) => Center(child: Text('OnUnknownRoute')));
      },
    );
  }
}
