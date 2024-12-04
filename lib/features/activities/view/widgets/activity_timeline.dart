import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:timelines_plus/timelines_plus.dart';
import 'package:town_square/features/activities/activities.dart';

class ActivityTimeline extends StatelessWidget {
  const ActivityTimeline({super.key});

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
      builder: TimelineTileBuilder.connected(
        connectionDirection: ConnectionDirection.after,
        itemCount: 2,
        contentsBuilder: (_, index) {
          if (index == 1) return const SizedBox.shrink();
          return Container(
            padding: const EdgeInsets.only(left: 12, right: 24),
            child: BlocBuilder<ActivitiesBloc, ActivitiesState>(
              builder: (_, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Today',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          ' / ${DateFormat('EEEE').format(DateTime.now())}',
                          style: const TextStyle(
                            color: Color(0xFFADB5BD),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    ...List.generate(
                      state.visibleActivities.length,
                      (index) {
                        final activity = state.visibleActivities[index];
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
                );
              },
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
