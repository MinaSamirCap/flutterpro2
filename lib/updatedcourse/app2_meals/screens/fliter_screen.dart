import 'package:flutter/material.dart';
import 'package:flutter_course_2/updatedcourse/app2_meals/widget/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const ROUTE_NAME = '/filters';

  Function saveFilters;
  final Map<String, bool> filters;

  FilterScreen(this.filters, this.saveFilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  void initState() {
    super.initState();
    _glutenFree = widget.filters['gluten'];
    _vegetarian = widget.filters['vegetarien'];
    _vegan = widget.filters['vagan'];
    _lactoseFree = widget.filters['lactose'];
  }

  Widget _buildSwitchTile(
      String title, String desc, bool currentVal, Function handler) {
    return SwitchListTile(
        title: Text(title),
        value: currentVal,
        subtitle: Text(desc),
        onChanged: handler);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Filters'),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.save),
                onPressed: () {
                  final selectFilters = {
                    'gluten': _glutenFree,
                    'lactose': _lactoseFree,
                    'vagan': _vegan,
                    'vegetarien': _vegetarian
                  };
                  widget.saveFilters(selectFilters);
                }),
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection',
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  _buildSwitchTile(
                      'Gluten-Free',
                      'Only include Gluten-Free meals',
                      _glutenFree, (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  }),
                  _buildSwitchTile(
                      'Lactos-Free',
                      'Only include Lactos-Free meals',
                      _lactoseFree, (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  }),
                  _buildSwitchTile('Vegeterian',
                      'Only include Vegeterian meals', _vegetarian, (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  }),
                  _buildSwitchTile('VeganVeganVegan',
                      'Only include Vegan mealsmealsmeals', _vegan, (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  }),
                ],
              ),
            )
          ],
        ));
  }
}
