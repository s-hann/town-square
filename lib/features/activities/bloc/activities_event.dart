part of 'activities_bloc.dart';

class ActivitiesEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetAllActivitiesData extends ActivitiesEvent {}

class FilterCategory extends ActivitiesEvent {
  FilterCategory({required this.index});

  final int index;

  @override
  List<Object> get props => [index];
}
