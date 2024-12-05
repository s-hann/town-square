import 'package:activity_repository/activity_repository.dart';
import 'package:card_loading/card_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:timelines_plus/timelines_plus.dart';

import 'package:town_square/core/enums/fetch_status_enum.dart';
import 'package:town_square/features/activities/activities.dart';

class ActivityTimeline extends StatelessWidget {
  const ActivityTimeline({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActivitiesBloc, ActivitiesState>(
      builder: (_, state) {
        final status = state.status;
        if (status == FetchStatus.success) {
          if (state.visibleActivities.isEmpty) {
            return Center(
              child: Text(
                'There are no activities in this category.',
                style: Theme.of(context).textTheme.displayMedium,
              ),
            );
          }
          return _SuccessState(
            activities: state.visibleActivities,
          );
        }
        if (status == FetchStatus.loading) {
          return const _LoadingState();
        }
        return const SizedBox.shrink();
      },
    );
  }
}

class _SuccessState extends StatelessWidget {
  const _SuccessState({
    required List<ActivityListEntity> activities,
  }) : _activities = activities;

  final List<ActivityListEntity> _activities;

  @override
  Widget build(BuildContext context) {
    return Timeline.tileBuilder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      theme: TimelineThemeData(
        nodePosition: 0,
        color: const Color(0xff989898),
        indicatorTheme: const IndicatorThemeData(
          position: 0,
          size: 20,
        ),
        connectorTheme: const ConnectorThemeData(
            thickness: 1.5, color: Color(0xFFDEE2E6), indent: 4),
      ),
      padding: EdgeInsets.zero,
      builder: TimelineTileBuilder.connected(
        connectionDirection: ConnectionDirection.after,
        itemCount: 2,
        contentsBuilder: (_, index) {
          if (index == 1) return const SizedBox.shrink();
          return Container(
            padding: const EdgeInsets.only(left: 12, right: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Today',
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    Text(
                      ' / ${DateFormat('EEEE').format(DateTime.now())}',
                      style:
                          Theme.of(context).textTheme.displayMedium?.copyWith(
                                color: const Color(0xFFADB5BD),
                              ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                ...List.generate(
                  _activities.length,
                  (index) {
                    final activity = _activities[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ActivityCard(activity: activity),
                        const SizedBox(height: 16),
                      ],
                    );
                  },
                ),
              ],
            ),
          );
        },
        indicatorBuilder: (_, index) {
          if (index == 1) return const SizedBox.shrink();
          return const DotIndicator(
            size: 12,
            color: Color(0xFFFFF09C),
          );
        },
        connectorBuilder: (_, __, ___) => const DashedLineConnector(),
      ),
    );
  }
}

class _LoadingState extends StatelessWidget {
  const _LoadingState();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const CardLoading(
          height: 14,
          width: 100,
        ),
        const SizedBox(height: 16),
        ...List.generate(
          5,
          (index) {
            return Container(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 16,
              ),
              margin: const EdgeInsets.symmetric(
                horizontal: 24,
              ).copyWith(bottom: index < 5 ? 16 : 0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.12),
                    offset: const Offset(3, 3),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CardLoading(
                    height: 16,
                    width: 60,
                  ),
                  SizedBox(height: 4),
                  CardLoading(
                    height: 18,
                    width: double.infinity,
                  ),
                  SizedBox(height: 4),
                  CardLoading(
                    height: 16,
                    width: 120,
                  ),
                  SizedBox(height: 12),
                  CardLoading(
                    height: 16,
                    width: 80,
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
