import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:town_square/core/common/functions.dart';

import 'package:town_square/core/gen/assets.gen.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({
    required Widget child,
    super.key,
  }) : _child = child;

  final Widget _child;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Row(
        children: [
          Visibility(
            visible: screenWidth > 768,
            child: Material(
              color: Colors.black,
              child: Container(
                padding: const EdgeInsets.only(
                  left: 42,
                  right: 32,
                ),
                width: 272,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 34,
                        top: 54,
                        bottom: 56,
                      ),
                      child: SvgPicture.asset(Assets.logo.twnsqr),
                    ),
                    _LeftPanelButton(
                      title: 'Activities',
                      svgAsset: Assets.icons.icCalendar,
                    ),
                    _LeftPanelButton(
                      title: 'Locations',
                      svgAsset: Assets.icons.icMap,
                    ),
                    _LeftPanelButton(
                      title: 'Services',
                      svgAsset: Assets.icons.icStar,
                    ),
                    _LeftPanelButton(
                      title: 'Communities',
                      svgAsset: Assets.icons.icUsers,
                    ),
                    _LeftPanelButton(
                      title: 'Notifications',
                      svgAsset: Assets.icons.icBell,
                    ),
                    const SizedBox(height: 16),
                    const _CreateButton(),
                    const SizedBox(height: 32),
                    Row(
                      children: [
                        CircleAvatar(
                          foregroundImage: AssetImage(
                            Assets.images.profile1.path,
                          ),
                          radius: 15,
                        ),
                        const SizedBox(width: 20),
                        const Expanded(
                          child: Text(
                            'Profile',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              height: 24 / 20,
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        IconButton(
                          onPressed: () {
                            AppFunction.showComingSoonToast();
                          },
                          splashColor: Colors.grey.shade700,
                          hoverColor: Colors.grey.shade900,
                          icon: const Icon(
                            Icons.more_vert,
                            color: Colors.white,
                            size: 22,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(child: _child),
        ],
      ),
      bottomNavigationBar: screenWidth > 768
          ? null
          : Material(
              color: Colors.white,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _BnbButton(
                      svgAsset: Assets.icons.icCalendar,
                    ),
                    _BnbButton(
                      svgAsset: Assets.icons.icMap,
                    ),
                    _BnbButton(
                      widget: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFC1EBFF),
                        ),
                        child: SvgPicture.asset(
                          Assets.icons.icPlus,
                          width: 24,
                        ),
                      ),
                    ),
                    _BnbButton(
                      svgAsset: Assets.icons.icUsers,
                    ),
                    _BnbButton(
                      svgAsset: Assets.icons.icStar,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

class _BnbButton extends StatelessWidget {
  const _BnbButton({
    String? svgAsset,
    Widget? widget,
  })  : _widget = widget,
        _svgAsset = svgAsset;

  final String? _svgAsset;
  final Widget? _widget;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AppFunction.showComingSoonToast();
      },
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 16,
        ),
        child: _svgAsset != null
            ? SvgPicture.asset(
                _svgAsset,
                width: 24,
              )
            : _widget,
      ),
    );
  }
}

class _CreateButton extends StatelessWidget {
  const _CreateButton();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AppFunction.showComingSoonToast();
      },
      splashColor: Colors.grey.shade700,
      hoverColor: Colors.grey.shade900,
      borderRadius: BorderRadius.circular(25),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 16,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: const Color(0xFF35BAF8),
        ),
        child: Row(
          children: [
            SvgPicture.asset(Assets.icons.icPlus),
            const SizedBox(width: 30),
            const Text(
              'Create',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                height: 24 / 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LeftPanelButton extends StatelessWidget {
  const _LeftPanelButton({
    required String title,
    required String svgAsset,
  })  : _svgAsset = svgAsset,
        _title = title;

  final String _title;
  final String _svgAsset;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AppFunction.showComingSoonToast();
      },
      hoverColor: Colors.grey.shade900,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 8,
        ),
        width: double.infinity,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              _svgAsset,
              width: 22,
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(width: 32),
            Text(
              _title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
