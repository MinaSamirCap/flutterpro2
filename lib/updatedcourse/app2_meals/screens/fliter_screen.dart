import 'package:flutter/material.dart';
import 'package:flutter_course_2/updatedcourse/app2_meals/widget/main_drawer.dart';

class FilterScreen extends StatelessWidget {
  static const ROUTE_NAME = '/filters';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Filters'),
        ),
        drawer: MainDrawer(),
        body: Center(
          child: Text('FilterScreen'),
        ));
  }
}
