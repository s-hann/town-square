import 'package:flutter/material.dart';

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
      backgroundColor: const Color(0xFFF8F9FA),
      body: Row(
        children: [
          // TODO(s-hann): complete left part
          Visibility(
            visible: screenWidth > 1000,
            child: Container(
              width: 272,
              height: MediaQuery.of(context).size.height,
              color: Colors.black,
            ),
          ),
          Expanded(child: _child),
        ],
      ),
    );
  }
}
