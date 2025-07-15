import 'package:flutter/material.dart';

enum AppSnackBarType { success, error, info }

class AppSnackBar {
  static void show(
    BuildContext context,
    String message, {
    AppSnackBarType type = AppSnackBarType.info,
    Duration duration = const Duration(milliseconds: 1000),
  }) {
    Color backgroundColor;

    switch (type) {
      case AppSnackBarType.success:
        backgroundColor = Colors.green[600]!;
        break;
      case AppSnackBarType.error:
        backgroundColor = Colors.red[600]!;
        break;
      case AppSnackBarType.info:
        backgroundColor = Colors.blueGrey[700]!;
        break;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor,
        duration: duration,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        margin: const EdgeInsets.all(16),
      ),
    );
  }
}
