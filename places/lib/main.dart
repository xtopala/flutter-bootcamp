import 'package:flutter/material.dart';
import 'package:here_sdk/core.dart';
import 'package:places/screens/add_place_screen.dart';
import 'package:places/screens/places_details_screen.dart';
import 'package:provider/provider.dart';

import 'package:places/providers/great_places.dart';
import 'package:places/screens/places_list_screen.dart';

void main() {
  SdkContext.init(IsolateOrigin.main);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GreatPlaces(),
      child: MaterialApp(
        title: 'Great Places',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.amber,
        ),
        home: PlacesListScreen(),
        routes: {
          AddPlaceScreen.routeName: (ctx) => AddPlaceScreen(),
          PlaceDetailScreen.routeName: (ctx) => PlaceDetailScreen(),
        },
      ),
    );
  }
}
