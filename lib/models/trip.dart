enum Season {
  Winter,
  Spring,
  Summer,
  Autumn,
}

enum TripType {
  Exploration,
  Recovery,
  Activities,
  Therapy,
}



class Trip {
  final String id;
  final List<String> categories;
  final String title, imageUrl;
  final List<String> activities, program;
  final int duration;
  final Season season;
  final TripType tripType;
  final bool isInSummer, isInWinter, isForFamilies;

  Trip(
      {required this.tripType,
      required this.id,
      required this.categories,
      required this.title,
      required this.imageUrl,
      required this.activities,
      required this.program,
      required this.duration,
      required this.season,
      required this.isInSummer,
      required this.isInWinter,
      required this.isForFamilies});
}
