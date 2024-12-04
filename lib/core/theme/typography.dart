import 'package:flutter/material.dart';
import 'package:town_square/core/gen/fonts.gen.dart';

abstract class AppTypography {
  static appTypographyMobile(BuildContext context) => TextTheme(
        bodyLarge: _baseTextStyle.copyWith(),
        bodyMedium: _baseTextStyle.copyWith(),
        bodySmall: _baseTextStyle.copyWith(),
        displayLarge: _baseTextStyle.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        displayMedium: _baseTextStyle.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          height: 16.7 / 14,
        ),
        displaySmall: _baseTextStyle.copyWith(),
        headlineLarge: _baseTextStyle.copyWith(),
        headlineMedium: _baseTextStyle.copyWith(

            fontSize: 20,
            fontWeight: FontWeight.w500,
        ),
        headlineSmall: _baseTextStyle.copyWith(),
        labelLarge: _baseTextStyle.copyWith(
          fontSize: 14,
          height: 16.7 / 14,
        ),
        labelMedium: _baseTextStyle.copyWith(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          height: 14 / 12,
        ),
        labelSmall: _baseTextStyle.copyWith(
          fontSize: 10,
          fontWeight: FontWeight.w500,
          height: 12 / 10,
        ),
        titleLarge: _baseTextStyle.copyWith(),
        titleMedium: _baseTextStyle.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
        titleSmall: _baseTextStyle.copyWith(),
      );

  static appTypographyDesktop(BuildContext context) => TextTheme(
        bodyLarge: _baseTextStyle.copyWith(),
        bodyMedium: _baseTextStyle.copyWith(),
        bodySmall: _baseTextStyle.copyWith(),
        displayLarge: _baseTextStyle.copyWith(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          height: 24 / 20,
        ),
        displayMedium: _baseTextStyle.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        displaySmall: _baseTextStyle.copyWith(),
        headlineLarge: _baseTextStyle.copyWith(),
        headlineMedium: _baseTextStyle.copyWith(
          fontSize: 24,
          fontWeight: FontWeight.w500,
        ),
        headlineSmall: _baseTextStyle.copyWith(),
        labelLarge: _baseTextStyle.copyWith(
          fontSize: 14,
          height: 16.7 / 14,
        ),
        labelMedium: _baseTextStyle.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          height: 16.7 / 14,
        ),
        labelSmall: _baseTextStyle.copyWith(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          height: 14 / 12,
        ),
        titleLarge: _baseTextStyle.copyWith(),
        titleMedium: _baseTextStyle.copyWith(
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
        titleSmall: _baseTextStyle.copyWith(),
      );

  static final _baseTextStyle = TextStyle(
    fontWeight: FontWeight.w400,
    color: Colors.black,
    fontFeatures: [
      FontFeature.stylisticSet(1),
      const FontFeature.slashedZero(),
      const FontFeature.enable('ordn'),
      const FontFeature.enable('cv05'),
      const FontFeature.enable('case'),
    ],
    fontFamily: FontFamily.sFProDisplay,
  );
}
