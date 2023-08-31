import 'package:flutter/material.dart';
import 'package:tour_guide/widgets/app_data.dart';

class TripDetail extends StatelessWidget {
  const TripDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final tripId = ModalRoute.of(context)?.settings.arguments as String;
    final selectesTrip = Trips_data.firstWhere((trip) => trip.id == tripId);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectesTrip.title,
          style: TextStyle(fontSize: 26, color: Colors.indigo[900]),
        ),
      ),
      body: ListView(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(
              selectesTrip.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          subtitle(title: 'Activities'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: contList(
              widget: ListView.builder(
                itemCount: selectesTrip.activities.length,
                itemBuilder: (context, index) => Card(
                  elevation: 0.5,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text(
                      selectesTrip.activities[index],
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          subtitle(title: 'Daily programme'),
          SizedBox(
            height: 10,
          ),
          contList(
              widget: ListView.builder(
            itemCount: selectesTrip.program.length,
            itemBuilder: (context, index) => Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.amber[700],
                    ),
                    child: Center(
                        child: Text(
                      'Day ${index + 1}',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.indigo[700]),
                    )),
                  ),
                ),
                SizedBox(width: 15),
                Text(
                  selectesTrip.program[index],
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
          )),
          SizedBox(
            height: 20,
          )
        ],
      ),
      floatingActionButton: favoriteButton(tripId: tripId),
    );
  }
}

class favoriteButton extends StatefulWidget {
  const favoriteButton({
    super.key,
    required this.tripId,
  });

  final String tripId;

  @override
  State<favoriteButton> createState() => _favoriteButtonState();
}

class _favoriteButtonState extends State<favoriteButton> {
  late bool isFavorited;
  @override
  Widget build(BuildContext context) {
    if (favorites.contains(widget.tripId)) {
      isFavorited = true;
    } else {
      isFavorited = false;
    }
    return FloatingActionButton(
      child: (isFavorited ? Icon(Icons.star) : Icon(Icons.star_border)),
      onPressed: () {
        setState(() {
          if (!isFavorited) {
            isFavorited = true;
            favorites.add(widget.tripId);
          } else {
            isFavorited = false;
            favorites.remove(widget.tripId);
            
          }
        });
      },
    );
  }
}

class contList extends StatelessWidget {
  const contList({
    super.key,
    required this.widget,
  });

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.black)),
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: widget);
  }
}

class subtitle extends StatelessWidget {
  const subtitle({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      alignment: Alignment.topLeft,
      child: Text(
        title,
        style: TextStyle(
            fontWeight: FontWeight.w600, fontSize: 24, color: Colors.blue),
      ),
    );
  }
}
