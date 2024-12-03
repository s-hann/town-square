import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:town_square/core/gen/assets.gen.dart';
import 'package:town_square/features/activities/bloc/activities_bloc.dart';
import 'package:town_square/features/activities/view/widgets/activity_card.dart';

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
              width: double.maxFinite,
              color: const Color(0xFFF8F9FA),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                ).copyWith(bottom: 4),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'What do you feel like doing?',
                    hintStyle: TextStyle(
                      color: Color(0xFFADB5BD),
                      fontSize: 14,
                      height: 16.7 / 14,
                    ),
                    border: OutlineInputBorder(),
                    isDense: true,
                  ),
                ),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          // child: Column(
          //   children: [
          //     Padding(
          //       padding: EdgeInsets.symmetric(horizontal: 24),
          //       child: ActivityCard(),
          //     ),
          //   ],
          // ),
          child: BlocBuilder<ActivitiesBloc, ActivitiesState>(
            builder: (_, state) {
              return ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 24).copyWith(bottom: 20),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.activities.length,
                itemBuilder: (_, index) => ActivityCard(
                  activity: state.activities[index],
                ),
                separatorBuilder: (_, index) => const SizedBox(height: 16),
              );
            },
          ),
        ),
      ],
    );
  }
}

// class ActivitiesMobileView extends StatelessWidget {
//   const ActivitiesMobileView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Padding(
//           padding: EdgeInsets.only(
//             left: 24,
//             top: 52,
//             right: 24,
//           ),
//           child: ActivityTitle(),
//         ),
//         SizedBox(height: 20),
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: 24),
//           child: UserGoalBanner(),
//         ),
//         // TODO(s-hann): Text field
//         // ListView.separated(
//         //   shrinkWrap: true,
//         //   scrollDirection: Axis.horizontal,
//         //   itemCount: 5,
//         //   itemBuilder: (context, index) {},
//         //   separatorBuilder: (context, index) => const SizedBox(width: 8),
//         // ),
//       ],
//     );
//   }
// }

class UserGoalBanner extends StatelessWidget {
  const UserGoalBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
      decoration: BoxDecoration(
        color: const Color(0xFFC1EBFF),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.12),
            offset: const Offset(3, 3),
            blurRadius: 8,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'You’re close to your goal!',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: screenWidth > 390 ? 16 : 14,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Join more sport activities to collect more points',
                  style: TextStyle(
                    fontSize: screenWidth > 390 ? 12 : 10,
                    height: 14 / 12,
                  ),
                  maxLines: 3,
                ),
                const SizedBox(height: 10),
                Wrap(
                  runSpacing: 10,
                  spacing: 10,
                  children: ['Join now', 'My points'].map<Widget>(
                    (text) {
                      return InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(4),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 8,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            text,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              height: 14 / 12,
                            ),
                          ),
                        ),
                      );
                    },
                  ).toList(),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(2),
            child: CircularPercentIndicator(
              radius: 32,
              lineWidth: 6.5,
              percent: 27 / 40,
              center: const Text(
                '27',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  height: 30 / 25,
                ),
              ),
              progressColor: const Color(0xFF35BAF8),
              backgroundWidth: 5,
              circularStrokeCap: CircularStrokeCap.round,
            ),
          ),
        ],
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
            const Text(
              'Tues, Nov 12',
              style: TextStyle(
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
