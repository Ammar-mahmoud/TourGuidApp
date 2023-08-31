import 'package:flutter/material.dart';
import 'package:tour_guide/models/trip.dart';

class TripItem extends StatelessWidget {
  const TripItem({
    super.key,
    required this.title,
    required this.id,
    required this.imageUrl,
    required this.duration,
    required this.tripType,
    required this.season,
    required this.removeItem,
  });
  final String id, title, imageUrl;
  final int duration;
  final TripType tripType;
  final Season season;
  final Function removeItem;
  void selectTrip(BuildContext context) {
    Navigator.of(context)
        .pushNamed('/trip-detail', arguments: id)
        .then((result) {
      if (result != null) {
        removeItem(result);
      }
    });
  }

  String get seasonText {
    if (season == Season.Winter) return 'Winter';
    if (season == Season.Spring) return 'Spring';
    if (season == Season.Summer)
      return 'Summer';
    else
      return 'Autumn';
  }

  String get tripTypeText {
    if (tripType == TripType.Exploration) return 'Exploration';
    if (tripType == TripType.Recovery) return 'Recovery';
    if (tripType == TripType.Activities)
      return 'Activities';
    else
      return 'Therapy';
  }

  Icon get seasonIcon {
    if (season == Season.Winter)
      return Icon(
        Icons.ac_unit,
        color: Colors.lightBlue,
      );
    if (season == Season.Spring)
      return Icon(
        Icons.grass,
        color: Colors.green,
      );
    if (season == Season.Summer)
      return Icon(
        Icons.wb_sunny,
        color: Colors.yellow[600],
      );
    else
      return Icon(
        Icons.eco,
        color: Colors.amberAccent[700],
      );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        selectTrip(context);
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 7,
        margin: EdgeInsets.all(15),
        child: Column(children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                child: Image.network(
                  imageUrl,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                  height: 250,
                  alignment: Alignment.bottomLeft,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.transparent, Colors.black87])),
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 24, color: Colors.white),
                    overflow: TextOverflow.fade,
                  ))
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Icon(Icons.family_restroom, color: Colors.green),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      tripTypeText,
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
                Row(
                  children: [
                    seasonIcon,
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      seasonText,
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.today,
                      color: Colors.blue[400],
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      '$duration Days',
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
