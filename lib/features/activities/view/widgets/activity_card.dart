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
                        text: '(${_activity.durationInMinute} min)',
                        style: const TextStyle(
                          color: Color(0xFFADB5BD),
                        ),
                      ),
                    ],
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  _activity.name,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      Assets.icons.icMapPin,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        _activity.location,
                        style:
                            Theme.of(context).textTheme.labelMedium?.copyWith(
                                  color: const Color(0xFFADB5BD),
                                ),
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
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(
                                  color: const Color(0xFFADB5BD),
                                ),
                          ),
                        ],
                      ),
                    ),
                    if (_activity.intensity != null)
                      IntensityLabel(
                        intensity: _activity.intensity!,
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
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              color: const Color(0xFF8AB58A),
                            ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Text(
                  '${_activity.price.toInt()}€',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        height: 16.7 / 14,
                      ),
                ),
              ),
              const SizedBox(height: 16),
              if (_activity.time.isBefore(DateTime.now())) ...[
                const ElevatedButton(
                  onPressed: null,
                  child: Text('Expired'),
                ),
              ] else if (_activity.availableSpot < 1) ...[
                const ElevatedButton(
                  onPressed: null,
                  child: Text('Sold out'),
                ),
              ] else ...[
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Join'),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

class IntensityLabel extends StatelessWidget {
  const IntensityLabel({
    required ActivityIntensity intensity,
    super.key,
  }) : _intensity = intensity;

  final ActivityIntensity _intensity;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 2,
        horizontal: 8,
      ),
      decoration: BoxDecoration(
        color: _intensity.color.backgroundColor,
        borderRadius: BorderRadius.circular(2),
      ),
      child: Text(
        _intensity.name,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: _intensity.color.textColor,
            ),
      ),
    );
  }
}
