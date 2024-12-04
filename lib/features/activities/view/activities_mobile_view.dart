import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:town_square/core/common/functions.dart';
import 'package:town_square/core/gen/assets.gen.dart';
import 'package:town_square/features/activities/activities.dart';

class ActivitiesMobileView extends StatelessWidget {
  const ActivitiesMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: _expandedHeight(),
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
        const SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 16),
              HorizontalFilter(),
              SizedBox(height: 4),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.only(left: 24, top: 20),
                  child: ActivityTimeline(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  double _expandedHeight() {
    if (kIsWeb) return 292;
    if (Platform.isIOS) return 240;
    return 280;
  }
}

class _ActivityTitle extends StatelessWidget {
  const _ActivityTitle();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
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
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: const Color(0xFFADB5BD),
                  ),
            ),
            Visibility(
              visible: screenWidth <= 768,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: () {
                      AppFunction.showComingSoonToast();
                    },
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
                  InkWell(
                    onTap: () {
                      AppFunction.showComingSoonToast();
                    },
                    borderRadius: BorderRadius.circular(40),
                    child: const CircleAvatar(
                      radius: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Text(
          'This week in Estepona',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ],
    );
  }
}
