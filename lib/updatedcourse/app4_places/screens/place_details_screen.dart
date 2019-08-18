import 'package:flutter/material.dart';
import 'package:flutter_course_2/updatedcourse/app4_places/screens/map_screen.dart';
import 'package:provider/provider.dart';
import '../providers/great_places_provider.dart';

class PlaceDetailsScreen extends StatelessWidget {

  static const PAGE_ROUTE = '/place-details';

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments;
    final selectedPlace = Provider.of<GreatPlaces>(context).findById(id);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedPlace.title),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 250,
            width: double.infinity,
            child: Image.file(
              selectedPlace.image,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            selectedPlace.location.address,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, color: Colors.green),
          ),
          SizedBox(
            height: 10,
          ),
          FlatButton(
            child: Text('View on map'),
            textColor: Theme.of(context).primaryColor,
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                fullscreenDialog: true,
                  builder: (ctx) => MapScreen(
                        initialLocation: selectedPlace.location,
                        isSelecting: false,
                      )));
            },
          )
        ],
      ),
    );
  }
}
