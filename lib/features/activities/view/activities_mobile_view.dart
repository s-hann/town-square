import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:town_square/core/gen/assets.gen.dart';
import 'package:town_square/features/activities/activities.dart';
import 'package:town_square/features/activities/bloc/activities_bloc.dart';

class ActivitiesMobileView extends StatelessWidget {
  const ActivitiesMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 292,
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
                  child: ActivityTitle(),
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
              width: double.maxFinite,
              color: const Color(0xFFF8F9FA),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.12),
                      offset: const Offset(3, 3),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'What do you feel like doing?',
                    hintStyle: const TextStyle(
                      color: Color(0xFFADB5BD),
                      fontSize: 14,
                      height: 16.7 / 14,
                    ),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    isDense: true,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(8).copyWith(right: 16),
                      child: SvgPicture.asset(
                        Assets.icons.icSearch,
                        width: 24,
                      ),
                    ),
                  ),
                  onChanged: (value) {},
                ),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: BlocBuilder<ActivitiesBloc, ActivitiesState>(
            builder: (_, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 26.5,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 24, right: 8),
                            child: CategoryFilterChip(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (_) {
                                    return const CategoryFilterDialog();
                                  },
                                );
                              },
                              child: SvgPicture.asset(Assets.icons.icSliders),
                            ),
                          ),
                          ListView.separated(
                            padding: const EdgeInsets.only(
                              right: 24,
                            ),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: state.categories.length,
                            itemBuilder: (_, index) {
                              final category = state.categories[index];
                              return CategoryFilterChip(
                                onTap: () {
                                  context
                                      .read<ActivitiesBloc>()
                                      .add(FilterCategory(index: index));
                                },
                                isActive: index == state.activeCategoryIndex,
                                child: Text(category),
                              );
                            },
                            separatorBuilder: (_, __) =>
                                const SizedBox(width: 8),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ListView.separated(
                    padding: const EdgeInsets.all(24).copyWith(bottom: 20),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.visibleActivities.length,
                    itemBuilder: (_, index) => ActivityCard(
                      activity: state.visibleActivities[index],
                    ),
                    separatorBuilder: (_, index) => const SizedBox(height: 16),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

class CategoryFilterDialog extends StatelessWidget {
  const CategoryFilterDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Select category',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context, rootNavigator: true).pop();
                  },
                  borderRadius: BorderRadius.circular(20),
                  child: const Padding(
                    padding: EdgeInsets.all(4),
                    child: Icon(
                      Icons.close_rounded,
                      size: 16,
                      weight: .5,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ActivityTitle extends StatelessWidget {
  const ActivityTitle({
    super.key,
  });

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
