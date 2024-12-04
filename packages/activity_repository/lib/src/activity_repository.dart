import 'package:activity_api/activity_api.dart';
import 'package:activity_repository/src/entity/activity_list_entity.dart';
import 'package:activity_repository/src/enum/activity_intensity_enum.dart';

/// This is the "domain layer" for this app.
/// It is usually used to solve the complex logic to be shown in the page.
class ActivityRepository {
  const ActivityRepository();

  final _activityApi = const ActivityApi();

  Future<List<ActivityListEntity>> getAllActivities() async {
    final activityModels = await _activityApi.getAllActivities();
    final activities = <ActivityListEntity>[];
    for (final item in activityModels) {
      activities.add(
        ActivityListEntity(
          name: item.name,
          location: item.location,
          intensity: item.intensity == null
              ? null
              : ActivityIntensity.values.firstWhere(
                  (element) => element.name == item.intensity,
                ),
          category: item.category,
          availableSpot: item.availableSpot,
          price: item.price,
          time: item.time,
          durationInMinute: item.durationInMinute,
        ),
      );
    }
    return activities;
  }
}
