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
      emit(
        state.copyWith(
          status: FetchStatus.success,
          activities: activities,
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: FetchStatus.failure));
    }
  }
}
