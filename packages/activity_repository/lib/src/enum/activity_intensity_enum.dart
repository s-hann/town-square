import 'package:flutter/material.dart';

enum ActivityIntensity {
  light,
  medium,
  high;

  LabelIntensityColor get color {
    return switch (this) {
      ActivityIntensity.light => LabelIntensityColor(
          backgroundColor: const Color(0xFFD5F1FF),
          textColor: const Color(0xFF65B5DB),
        ),
      ActivityIntensity.medium => LabelIntensityColor(
          backgroundColor: const Color(0xFFF3E8FF),
          textColor: const Color(0xFFC9A4F2),
        ),
      ActivityIntensity.high => LabelIntensityColor(
          backgroundColor: const Color(0xFFFFEAD1),
          textColor: const Color(0xFFDC974F),
        ),
    };
  }
}

class LabelIntensityColor {
  final Color backgroundColor;
  final Color textColor;

  LabelIntensityColor({
    required this.backgroundColor,
    required this.textColor,
  });
}
