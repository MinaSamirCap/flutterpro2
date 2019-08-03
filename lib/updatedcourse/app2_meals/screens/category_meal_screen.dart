import 'package:flutter/material.dart';
import 'package:flutter_course_2/updatedcourse/app2_meals/models/meal.dart';
import 'package:flutter_course_2/updatedcourse/app2_meals/widget/meal_item.dart';

class CategoryMealScreen extends StatefulWidget {
  static const ROUTE_NAME = '/cagegory-meals';

  final List<Meal> meals;
  CategoryMealScreen(this.meals);

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  String categoryTitle;
  String categoryId;
  List<Meal> displayedMeals;
  var _loadedInitData = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;

      categoryTitle = routeArgs['title'];
      categoryId = routeArgs['id'];
      displayedMeals = widget.meals.where((item) {
        return item.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
  }

  void _removeItem(String itemId) {
    setState(() {
      displayedMeals.removeWhere((item) {
        return item.id == itemId;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemCount: displayedMeals.length,
          itemBuilder: (ctx, index) {
            return MealItem(displayedMeals[index], _removeItem);
          },
        ));
  }
}
