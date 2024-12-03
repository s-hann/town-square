import 'package:activity_repository/activity_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:town_square/core/gen/assets.gen.dart';

class ActivityCard extends StatelessWidget {
  const ActivityCard({
    required ActivityListEntity activity,
    super.key,
  }) : _activity = activity;

  final ActivityListEntity _activity;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.12),
            offset: const Offset(3, 3),
            blurRadius: 8,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text.rich(
                  TextSpan(
                    text: DateFormat('HH:mm ').format(_activity.time),
                    children: [
                      TextSpan(
                        text: '(${_activity.durationInMinute}) min)',
                        style: const TextStyle(
                          color: Color(0xFFADB5BD),
                        ),
                      ),
                    ],
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  _activity.name,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      Assets.icons.icMapPin,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      _activity.location,
                      style: const TextStyle(
                        color: Color(0xFFADB5BD),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Wrap(
                  runSpacing: 4,
                  spacing: 4,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 2,
                        horizontal: 4,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE9ECEF),
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            Assets.icons.icUser,
                            width: 10,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '${_activity.availableSpot} spots left',
                            style: const TextStyle(
                              color: Color(0xFFADB5BD),
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              height: 12 / 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (_activity.intensity != null)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 2,
                          horizontal: 8,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFD5F1FF),
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: Text(
                          '${_activity.intensity}',
                          style: const TextStyle(
                            color: Color(0xFF65B5DB),
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            height: 12 / 10,
                          ),
                        ),
                      ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 2,
                        horizontal: 8,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFD8F7DF),
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: Text(
                        _activity.category,
                        style: const TextStyle(
                          color: Color(0xFF8AB58A),
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          height: 12 / 10,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: [
              Text(
                '${_activity.price.toInt()}€',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  height: 16.7 / 14,
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Join'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
