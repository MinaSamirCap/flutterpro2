import 'package:flutter/material.dart';

import 'add_place_screen.dart';
import 'package:provider/provider.dart';
import '../providers/great_places_provider.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.ROUTE_NAME);
            },
          )
        ],
      ),
      body: Consumer<GreatPlaces>(
        child: Center(
          child: const Text('Got no places yet, start adding some!'),
        ),
        builder: (ctx, places, ch) => places.items.length <= 0
            ? ch
            : ListView.builder(
                itemCount: places.items.length,
                itemBuilder: (ctx, index) => ListTile(
                  leading: CircleAvatar(
                    backgroundImage: FileImage(places.items[index].image),
                  ),
                  title: Text(places.items[index].title),
                  onTap: (){
                    /// show details screen ... :)
                  },
                ),
              ),
      ),
    );
  }
}
