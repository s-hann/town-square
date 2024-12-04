import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:town_square/features/activities/activities.dart';

class ActivitiesDesktopView extends StatelessWidget {
  const ActivitiesDesktopView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32).copyWith(top: 60),
        constraints: const BoxConstraints(maxWidth: 1000),
        child: const Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _ActivityTitle(),
                  SizedBox(height: 16),
                  ActivityFilterTextField(),
                  SizedBox(height: 24),
                  HorizontalFilter(),
                  SizedBox(height: 16),
                  Expanded(
                    child: SingleChildScrollView(
                      child: ActivityTimeline(),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 30),
            SizedBox(
              width: 280,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UserGoalBanner(),
                  SizedBox(height: 28),
                  WorkshopBanner(),
                  SizedBox(height: 28),
                  PopularEventsBanner(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ActivityTitle extends StatelessWidget {
  const _ActivityTitle();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          DateFormat('EEE, MMM dd').format(DateTime.now()),
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: const Color(0xFFADB5BD),
              ),
        ),
        Text(
          'This week in Estepona',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ],
    );
  }
}
