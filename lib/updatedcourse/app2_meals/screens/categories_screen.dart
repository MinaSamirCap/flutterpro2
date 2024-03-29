import 'package:flutter/material.dart';
import 'package:flutter_course_2/updatedcourse/app2_meals/dummy_data.dart';
import 'package:flutter_course_2/updatedcourse/app2_meals/widget/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25),
      children: DUMMY_CATEGORIES.map((item) {
        return CategoryItem(item.id, item.title, item.color);
      }).toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
    );
  }
}
