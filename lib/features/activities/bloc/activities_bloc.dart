import 'dart:async';

import 'package:activity_repository/activity_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:town_square/core/enums/fetch_status_enum.dart';

part 'activities_event.dart';
part 'activities_state.dart';

class ActivitiesBloc extends Bloc<ActivitiesEvent, ActivitiesState> {
  ActivitiesBloc({required ActivityRepository activityRepository})
      : _activityRepository = activityRepository,
        super(const ActivitiesState()) {
    on<GetAllActivitiesData>(_getAllActivitiesData);
    on<FilterCategory>(_filterCategory);
    add(GetAllActivitiesData());
  }

  final ActivityRepository _activityRepository;

  Future<void> _getAllActivitiesData(
    GetAllActivitiesData event,
    Emitter<ActivitiesState> emit,
  ) async {
    emit(state.copyWith(status: FetchStatus.loading));
    try {
      final activities = await _activityRepository.getAllActivities();
      activities.sort(
        (a, b) => a.time.compareTo(b.time),
      );
      emit(
        state.copyWith(
          status: FetchStatus.success,
          activitiesCache: activities,
          visibleActivities: activities,
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: FetchStatus.failure));
    }
  }

  void _filterCategory(
    FilterCategory event,
    Emitter<ActivitiesState> emit,
  ) {
    final filtered = event.index == 0
        ? state.activitiesCache
        : state.activitiesCache.where(
            (item) =>
                item.category == state.categories[event.index].toLowerCase(),
          );
    emit(
      state.copyWith(
        activeCategoryIndex: event.index,
        visibleActivities: filtered.toList(),
      ),
    );
  }
}
