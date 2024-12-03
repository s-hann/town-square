import 'package:flutter/material.dart';

class CategoryFilterChip extends StatelessWidget {
  const CategoryFilterChip({
    void Function()? onTap,
    required Widget child,
    bool isActive = false,
    super.key,
  })  : _onTap = onTap,
        _isActive = isActive,
        _child = child;

  final void Function()? _onTap;
  final Widget _child;
  final bool _isActive;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: _isActive ? const Color(0xFFBAA1C8) : const Color(0xFFEEE1F5),
      borderRadius: BorderRadius.circular(4),
      child: InkWell(
        onTap: _onTap,
        borderRadius: BorderRadius.circular(4),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 4,
            horizontal: 16,
          ),
          child: _child,
        ),
      ),
    );
  }
}
