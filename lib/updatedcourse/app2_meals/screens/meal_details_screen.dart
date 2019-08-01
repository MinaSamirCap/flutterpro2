import 'package:flutter/material.dart';
import 'package:flutter_course_2/updatedcourse/app2_meals/dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {
  static const ROUTE_NAME = '/meal-details';

  Widget buildSectionTitle(BuildContext cxt, String tex) {
    return Container(
      child: Text(
        'Ingradients',
        style: Theme.of(cxt).textTheme.title,
      ),
      margin: EdgeInsets.symmetric(vertical: 10),
    );
  }

  Widget buildContainer(Widget widget) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        height: 200,
        width: 300,
        child: widget);
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final meal = DUMMY_MEALS.singleWhere((item) {
      return item.id == mealId;
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
                width: double.infinity,
                height: 300,
                child: Image.network(
                  meal.imageUrl,
                  fit: BoxFit.cover,
                )),
            buildSectionTitle(context, 'Ingradients'),
            buildContainer(
              ListView.builder(
                itemCount: meal.ingredients.length,
                itemBuilder: (ctx, indext) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Text(meal.ingredients[indext]),
                    ),
                    color: Theme.of(context).accentColor,
                  );
                },
              ),
            ),
            buildSectionTitle(context, 'Steps'),
            buildContainer(ListView.builder(
                itemCount: meal.steps.length,
                itemBuilder: (ctx, index) => Column(
                      children: <Widget>[
                        ListTile(
                          leading: CircleAvatar(
                            child: Text('#${index + 1}'),
                          ),
                          title: Text(meal.steps[index]),
                        ),
                        Divider()
                      ],
                    )))
          ],
        ),
      ),
    );
  }
}
