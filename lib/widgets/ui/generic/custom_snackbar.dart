import 'package:flutter/material.dart';

enum Severity { error, success }

const _severityColors = {
  Severity.error: Colors.red,
  Severity.success: Colors.green,
};

class CustomSnackbar extends SnackBar {
  CustomSnackbar({
    required BuildContext context,
    Severity severity = Severity.success,
    required String text,
    String? actionButtonText,
    void Function()? onActionButtonPress,
    super.key,
  }) : super(
          padding: const EdgeInsets.all(16),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              if (actionButtonText != null)
                TextButton(
                  onPressed: onActionButtonPress,
                  child: Text(
                    actionButtonText,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ),
            ],
          ),
          duration: const Duration(seconds: 5),
          backgroundColor: _severityColors[severity],
        );
}
