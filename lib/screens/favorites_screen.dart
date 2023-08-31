import 'package:flutter/material.dart';
import 'package:tour_guide/models/trip.dart';
import 'package:tour_guide/widgets/app_data.dart';
import 'package:tour_guide/widgets/trip_item.dart';

// ignore: must_be_immutable
class FavoritesScreen extends StatelessWidget {
  List<Trip> displayFavoritesTrips = [];

  FavoritesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    displayFavoritesTrips.clear();
    for (String favoriteId in favorites) {
      displayFavoritesTrips
          .add(Trips_data.firstWhere((trip) => trip.id == favoriteId));
    }
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return TripItem(
            id: displayFavoritesTrips[index].id,
            title: displayFavoritesTrips[index].title,
            imageUrl: displayFavoritesTrips[index].imageUrl,
            duration: displayFavoritesTrips[index].duration,
            tripType: displayFavoritesTrips[index].tripType,
            season: displayFavoritesTrips[index].season,
            removeItem: () {},
          );
        },
        itemCount: displayFavoritesTrips.length,
      ),
    );
  }
}
