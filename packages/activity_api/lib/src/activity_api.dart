import 'package:activity_api/src/models/activity_model.dart';

/// This is the "data layer" for this app, specifically for data related to "activity".
/// It is usually used to get data from the server.
/// Since there are currently no API, I am just going to fetch dummy data in this layer.
class ActivityApi {
  const ActivityApi();

  Future<List<ActivityModel>> getAllActivities() async {
    // To get a realistic feel when the user loads the data from the server, I put this Future.delayed function
    await Future.delayed(
      const Duration(milliseconds: 2000),
    );
    return _dummy();
  }

  List<ActivityModel> _dummy() {
    return <ActivityModel>[
      ActivityModel(
        name: 'Beach Yoga',
        location: 'La Playa de la Rada',
        intensity: 'light',
        category: 'sports',
        availableSpot: 8,
        price: 9,
        time: DateTime.now().copyWith(hour: 8, minute: 0),
        durationInMinute: 60,
      ),
      ActivityModel(
        name: 'Standing Tapas Lunch',
        location: 'Casa Marina',
        intensity: null,
        category: 'food',
        availableSpot: 8,
        price: 15,
        time: DateTime.now().copyWith(hour: 13, minute: 15),
        durationInMinute: 60,
      ),
      ActivityModel(
        name: 'Reformer Pilates',
        location: 'Wellness Studio',
        intensity: 'medium',
        category: 'sports',
        availableSpot: 3,
        price: 15,
        time: DateTime.now().copyWith(hour: 9, minute: 0),
        durationInMinute: 60,
      ),
      ActivityModel(
        name: '5-a-side Football',
        location: 'Municipal Sports Center',
        intensity: 'high',
        category: 'sports',
        availableSpot: 0,
        price: 19,
        time: DateTime.now().copyWith(hour: 14, minute: 30),
        durationInMinute: 45,
      ),
      ActivityModel(
        name: 'Lego Building Workshop',
        location: 'La Bloqueria',
        intensity: null,
        category: 'kids',
        availableSpot: 5,
        price: 15,
        time: DateTime.now().copyWith(hour: 15, minute: 0),
        durationInMinute: 90,
      ),
      ActivityModel(
        name: 'Basketball Game',
        location: 'Municipal Sports Center',
        intensity: 'high',
        category: 'sports',
        availableSpot: 4,
        price: 8,
        time: DateTime.now().copyWith(hour: 13, minute: 15),
        durationInMinute: 60,
      ),
    ];
  }
}
