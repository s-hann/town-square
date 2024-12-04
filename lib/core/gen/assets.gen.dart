/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/ic_arrow_right_circle.svg
  String get icArrowRightCircle => 'assets/icons/ic_arrow_right_circle.svg';

  /// File path: assets/icons/ic_bell.svg
  String get icBell => 'assets/icons/ic_bell.svg';

  /// File path: assets/icons/ic_calendar.svg
  String get icCalendar => 'assets/icons/ic_calendar.svg';

  /// File path: assets/icons/ic_map.svg
  String get icMap => 'assets/icons/ic_map.svg';

  /// File path: assets/icons/ic_map_pin.svg
  String get icMapPin => 'assets/icons/ic_map_pin.svg';

  /// File path: assets/icons/ic_plus.svg
  String get icPlus => 'assets/icons/ic_plus.svg';

  /// File path: assets/icons/ic_search.svg
  String get icSearch => 'assets/icons/ic_search.svg';

  /// File path: assets/icons/ic_sliders.svg
  String get icSliders => 'assets/icons/ic_sliders.svg';

  /// File path: assets/icons/ic_star.svg
  String get icStar => 'assets/icons/ic_star.svg';

  /// File path: assets/icons/ic_user.svg
  String get icUser => 'assets/icons/ic_user.svg';

  /// File path: assets/icons/ic_users.svg
  String get icUsers => 'assets/icons/ic_users.svg';

  /// List of all assets
  List<String> get values => [
        icArrowRightCircle,
        icBell,
        icCalendar,
        icMap,
        icMapPin,
        icPlus,
        icSearch,
        icSliders,
        icStar,
        icUser,
        icUsers
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/bg_events.png
  AssetGenImage get bgEvents =>
      const AssetGenImage('assets/images/bg_events.png');

  /// File path: assets/images/profile_1.png
  AssetGenImage get profile1 =>
      const AssetGenImage('assets/images/profile_1.png');

  /// File path: assets/images/profile_3.png
  AssetGenImage get profile3 =>
      const AssetGenImage('assets/images/profile_3.png');

  /// List of all assets
  List<AssetGenImage> get values => [bgEvents, profile1, profile3];
}

class $AssetsLogoGen {
  const $AssetsLogoGen();

  /// File path: assets/logo/twnsqr.svg
  String get twnsqr => 'assets/logo/twnsqr.svg';

  /// List of all assets
  List<String> get values => [twnsqr];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLogoGen logo = $AssetsLogoGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
