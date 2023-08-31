import 'package:flutter/material.dart';
import 'package:tour_guide/models/trip.dart';
import 'package:tour_guide/widgets/trip_item.dart';

class TripScreen extends StatefulWidget {
  const TripScreen({super.key, required this.availableTrips});
  final List<Trip> availableTrips;

  @override
  State<TripScreen> createState() => _TripScreenState();
}

class _TripScreenState extends State<TripScreen> {
  late String categoryTitle;
  late List<Trip> displayTrips;
  @override
  void didChangeDependencies() {
    final rout =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    // ignore: unused_local_variable
    final id = rout['id'];
    categoryTitle = rout['title']!;
    // ignore: unused_local_variable
    displayTrips = widget.availableTrips.where((Trip) {
      return Trip.categories.contains(id);
    }).toList();
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  void _removeTrip(String tripId) {
    setState(() {
      displayTrips.removeWhere((trip) => trip.id == tripId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryTitle as String,
          style: TextStyle(fontSize: 26, color: Colors.indigo[900]),
        ),
        backgroundColor: Colors.blue[200],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return TripItem(
            id: displayTrips[index].id,
            title: displayTrips[index].title,
            imageUrl: displayTrips[index].imageUrl,
            duration: displayTrips[index].duration,
            tripType: displayTrips[index].tripType,
            season: displayTrips[index].season,
            removeItem: _removeTrip,
          );
        },
        itemCount: displayTrips.length,
      ),
    );
  }
}
