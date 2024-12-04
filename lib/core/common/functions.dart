import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

abstract class AppFunction {
  static void showComingSoonToast() {
    toastification.dismissAll();
    toastification.show(
      type: ToastificationType.info,
      style: ToastificationStyle.flatColored,
      title: const Text('Coming soon'),
      autoCloseDuration: const Duration(seconds: 2),
      description: const Text('This feature is not available yet.'),
      showProgressBar: false,
    );
  }
}
