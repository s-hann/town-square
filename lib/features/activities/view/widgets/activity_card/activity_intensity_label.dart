import 'package:activity_repository/activity_repository.dart';
import 'package:flutter/material.dart';

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
