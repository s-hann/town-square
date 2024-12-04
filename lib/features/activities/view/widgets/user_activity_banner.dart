import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:town_square/core/common/functions.dart';

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
                        onTap: () {
                          AppFunction.showComingSoonToast();
                        },
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
              percent: 27 / 45,
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
              backgroundColor: Colors.white,
              circularStrokeCap: CircularStrokeCap.round,
            ),
          ),
        ],
      ),
    );
  }
}
