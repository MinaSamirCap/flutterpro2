import 'package:flutter/material.dart';
import '../app4_places/screens/add_place_screen.dart';
import '../app4_places/screens/places_list_screen.dart';
import '../app4_places/screens/place_details_screen.dart';
import '../app4_places/providers/great_places_provider.dart';
import 'package:provider/provider.dart';

class PlacesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GreatPlaces(),
      child: MaterialApp(
        title: 'Great Places',
        theme:
            ThemeData(accentColor: Colors.amber, primaryColor: Colors.indigo),
        home: PlacesListScreen(),
        routes: {
          AddPlaceScreen.ROUTE_NAME: (ctx) => AddPlaceScreen(),
          PlaceDetailsScreen.PAGE_ROUTE: (ctx) => PlaceDetailsScreen()
        },
      ),
    );
  }
}
