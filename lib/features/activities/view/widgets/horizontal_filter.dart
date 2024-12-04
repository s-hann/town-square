import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:town_square/core/common/functions.dart';
import 'package:town_square/core/gen/assets.gen.dart';
import 'package:town_square/features/activities/activities.dart';

class HorizontalFilter extends StatelessWidget {
  const HorizontalFilter({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 26.5,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: screenWidth > 1000 ? 0 : 24,
                right: 8,
              ),
              child: CategoryFilterChip(
                onTap: () {
                  AppFunction.showComingSoonToast();
                },
                child: SvgPicture.asset(Assets.icons.icSliders),
              ),
            ),
            BlocBuilder<ActivitiesBloc, ActivitiesState>(
              builder: (_, state) {
                return ListView.separated(
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
                  separatorBuilder: (_, __) => const SizedBox(width: 8),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
