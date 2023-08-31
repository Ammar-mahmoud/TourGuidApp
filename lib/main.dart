import 'package:flutter/material.dart';
import 'package:tour_guide/models/trip.dart';
import 'package:tour_guide/screens/filter_screen.dart';
import 'package:tour_guide/screens/tabs_screen.dart';
import 'package:tour_guide/screens/trip_details.dart';
import 'package:tour_guide/screens/trips.dart';
import 'package:tour_guide/widgets/app_data.dart';

void main() {
  runApp(first());
}

class first extends StatefulWidget {
  const first({super.key});

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {
  Map<String, bool> _filters = {
    'summer': false,
    'winter': false,
    'family': false,
  };
  List<Trip> _availableTrips = Trips_data;
  List<Trip> favorites = [];

  void _changeFilter(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableTrips = Trips_data.where((trip) {
        if (_filters['summer'] == true && trip.isInSummer != true) return false;

        if (_filters['winter'] == true && trip.isInSummer != true) return false;

        if (_filters['family'] == true && trip.isInSummer != true) return false;
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TOUR GUID',
      routes: {
        '/': (context) => TabsScreen(favoritesTrips: favorites),
        '/trips': (context) => TripScreen(availableTrips: _availableTrips),
        '/trip-detail': (context) => TripDetail(),
        FilterScreen.filterRoute: (context) =>
            FilterScreen(saveFilter: _changeFilter, currentFilter: _filters),
      },
    );
  }
}
