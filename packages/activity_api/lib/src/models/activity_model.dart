class ActivityModel {
  const ActivityModel({
    required this.name,
    required this.location,
    required this.intensity,
    required this.category,
    required this.availableSpot,
    required this.price,
    required this.time,
    required this.durationInMinute,
  });

  final String name;
  final String location;
  final String? intensity;
  final String category;
  final int availableSpot;
  final double price;
  final DateTime time;
  final int durationInMinute;
}
