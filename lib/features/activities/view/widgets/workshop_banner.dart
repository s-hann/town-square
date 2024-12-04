import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:town_square/core/common/functions.dart';
import 'package:town_square/core/gen/assets.gen.dart';

class WorkshopBanner extends StatelessWidget {
  const WorkshopBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 16,
      ).copyWith(right: 24),
      height: 210,
      decoration: BoxDecoration(
        color: const Color(0xFFFBF2C0),
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.bottomCenter,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Weekly workshops for kids',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              height: 24 / 20,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Sign up for early access to weekly activities for your kids full of learning and fun!',
            style: TextStyle(
              fontSize: 12,
              height: 14 / 12,
            ),
          ),
          const SizedBox(height: 8),
          Material(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
            child: InkWell(
              onTap: () {
                AppFunction.showComingSoonToast();
              },
              borderRadius: BorderRadius.circular(6),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Learn more',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        height: 16.7 / 14,
                      ),
                    ),
                    SvgPicture.asset(
                      Assets.icons.icArrowRightCircle,
                      width: 24,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
