import 'package:flutter/material.dart';
import 'package:town_square/core/common/functions.dart';
import 'package:town_square/core/gen/assets.gen.dart';

class PopularEventsBanner extends StatelessWidget {
  const PopularEventsBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 312,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            Assets.images.bgEvents.path,
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 18,
            ).copyWith(top: 28),
            child: const Text(
              'Popular events near you!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.only(
                  left: 18,
                  right: 28,
                ),
                child: Text(
                  'Unleash the fun! Explore the world of exciting events happening near you.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    height: 16.7 / 14,
                  ),
                ),
              ),
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 24,
                      horizontal: 40,
                    ).copyWith(top: 28),
                    child: Material(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      child: InkWell(
                        onTap: () {
                          AppFunction.showComingSoonToast();
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          width: double.infinity,
                          alignment: Alignment.center,
                          child: const Text(
                            'See more',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 16,
                    top: 28,
                    child: Assets.images.profile3.image(height: 42),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}