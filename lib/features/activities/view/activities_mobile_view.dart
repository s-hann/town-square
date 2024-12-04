import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:town_square/core/gen/assets.gen.dart';
import 'package:town_square/features/activities/activities.dart';

class ActivitiesMobileView extends StatelessWidget {
  const ActivitiesMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    const isWeb = kIsWeb;
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: isWeb ? 292 : 240,
          flexibleSpace: const FlexibleSpaceBar(
            background: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 24,
                    top: 52,
                    right: 24,
                  ),
                  child: _ActivityTitle(),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: UserGoalBanner(),
                ),
              ],
            ),
          ),
          pinned: true,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(0),
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 4,
                horizontal: 24,
              ),
              width: double.infinity,
              color: const Color(0xFFF8F9FA),
              child: const ActivityFilterTextField(),
            ),
          ),
        ),
        const SliverFillRemaining(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 16),
                HorizontalFilter(),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(left: 24, top: 24),
                    child: ActivityTimeline(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              DateFormat('EEE, MMM dd').format(DateTime.now()),
              style: const TextStyle(
                color: Color(0xFFADB5BD),
                fontSize: 12,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(40),
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: SvgPicture.asset(
                      Assets.icons.icBell,
                      width: 24,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                const CircleAvatar(
                  radius: 14,
                ),
              ],
            ),
          ],
        ),
        const Text(
          'This week in Estepona',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
