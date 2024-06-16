import 'package:flutter/material.dart';
import 'package:gallopgate/config/extensions/context.dart';
import 'package:gallopgate/config/theme/utils/colors.dart';

abstract class GSnackbar {
  static void success({
    required BuildContext context,
    required String message,
    IconData? icon,
  }) {
    final textTheme = context.textTheme;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green[400],
        content: Row(
          children: [
            if (icon != null)
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(icon),
              ),
            Flexible(
              child: Text(
                message,
                style: textTheme.bodyMedium?.copyWith(
                  color: GColor.surfaceDark,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  static void error({
    required BuildContext context,
    required String message,
    IconData? icon,
  }) {
    final textTheme = context.textTheme;
    final colorScheme = context.colorScheme;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: colorScheme.error,
        content: Row(
          children: [
            if (icon != null)
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(icon),
              ),
            Flexible(
              child: Text(
                message,
                style: textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onError,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
