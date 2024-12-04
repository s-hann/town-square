import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:town_square/core/gen/assets.gen.dart';

class ActivityFilterTextField extends StatelessWidget {
  const ActivityFilterTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.12),
            offset: const Offset(3, 3),
            blurRadius: 8,
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'What do you feel like doing?',
          hintStyle: const TextStyle(
            color: Color(0xFFADB5BD),
            fontSize: 14,
            height: 16.7 / 14,
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          isDense: true,
          suffixIcon: Padding(
            padding: const EdgeInsets.all(8).copyWith(right: 16),
            child: SvgPicture.asset(
              Assets.icons.icSearch,
              width: 24,
            ),
          ),
        ),
        onChanged: (value) {},
      ),
    );
  }
}
