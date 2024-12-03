import 'package:activity_repository/activity_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:town_square/features/activities/bloc/activities_bloc.dart';
import 'package:town_square/features/activities/view/view.dart';

class ActivitiesView extends StatelessWidget {
  const ActivitiesView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (_) => ActivitiesBloc(
        activityRepository: context.read<ActivityRepository>(),
      ),
      child: screenWidth > 1000
          ? const ActivitiesDesktopView()
          : const ActivitiesMobileView(),
    );
  }
}
