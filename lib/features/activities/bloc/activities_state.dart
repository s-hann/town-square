part of 'activities_bloc.dart';

class ActivitiesState extends Equatable {
  const ActivitiesState({
    this.status = FetchStatus.initial,
    this.activitiesCache = const <ActivityListEntity>[],
    this.visibleActivities = const <ActivityListEntity>[],
    // Since this website is a static site, I hardcoded this category.
    this.categories = const <String>[
      'All',
      'Sports',
      'Food',
      'Kids',
      'Creative',
    ],
    this.activeCategoryIndex = 0,
  });

  /// To track the activity status; consists of initial, loading, success, and failure
  final FetchStatus status;

  /// To store all activities from the domain layer
  final List<ActivityListEntity> activitiesCache;

  /// For filtered search that will be shown on the UI
  final List<ActivityListEntity> visibleActivities;

  /// To store categories that are available in the platform
  final List<String> categories;

  /// To store categories that are available in the platform
  final int activeCategoryIndex;

  ActivitiesState copyWith({
    FetchStatus? status,
    List<ActivityListEntity>? activitiesCache,
    List<ActivityListEntity>? visibleActivities,
    List<String>? categories,
    int? activeCategoryIndex,
  }) {
    return ActivitiesState(
      status: status ?? this.status,
      activitiesCache: activitiesCache ?? this.activitiesCache,
      visibleActivities: visibleActivities ?? this.visibleActivities,
      categories: categories ?? this.categories,
      activeCategoryIndex: activeCategoryIndex ?? this.activeCategoryIndex,
    );
  }

  @override
  List<Object> get props => [
        status,
        activitiesCache,
        visibleActivities,
        categories,
        activeCategoryIndex,
      ];
}
