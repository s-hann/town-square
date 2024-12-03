part of 'activities_bloc.dart';

class ActivitiesState extends Equatable {
  const ActivitiesState({
    this.status = FetchStatus.initial,
    this.activities = const <ActivityListEntity>[],
  });

  final FetchStatus status;
  final List<ActivityListEntity> activities;

  ActivitiesState copyWith({
    FetchStatus? status,
    List<ActivityListEntity>? activities,
  }) {
    return ActivitiesState(
      status: status ?? this.status,
      activities: activities ?? this.activities,
    );
  }

  @override
  List<Object> get props => [status, activities];
}
