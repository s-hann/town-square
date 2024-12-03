import 'package:equatable/equatable.dart';

class ActivityListEntity extends Equatable {
  const ActivityListEntity({
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

  ActivityListEntity copyWith({
    String? name,
    String? location,
    String? intensity,
    String? category,
    int? availableSpot,
    double? price,
    DateTime? time,
    int? durationInMinute,
  }) {
    return ActivityListEntity(
      name: name ?? this.name,
      location: location ?? this.location,
      intensity: intensity ?? this.intensity,
      category: category ?? this.category,
      availableSpot: availableSpot ?? this.availableSpot,
      price: price ?? this.price,
      time: time ?? this.time,
      durationInMinute: durationInMinute ?? this.durationInMinute,
    );
  }

  @override
  List<Object?> get props {
    return [
      name,
      location,
      intensity,
      category,
      availableSpot,
      price,
      time,
      durationInMinute,
    ];
  }
}
