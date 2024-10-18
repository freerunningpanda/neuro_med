// ignore_for_file: avoid_positional_boolean_parameters

import 'package:flutter/material.dart';
import 'package:upmind_front_client/core/core.dart';

class AppSwitcher extends StatelessWidget {
  const AppSwitcher({
    required this.isActive,
    required this.onChanged,
    super.key,
  });

  final bool isActive;
  final void Function(bool)? onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Switch(
      value: isActive,
      thumbIcon: WidgetStateProperty.resolveWith<Icon?>(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return const Icon(
              Icons.circle,
            );
          }
          return const Icon(
            Icons.circle,
          );
        },
      ),
      onChanged: onChanged,
      thumbColor: WidgetStateProperty.all(
        theme.colorScheme.onPrimary,
      ),
      trackColor: WidgetStateProperty.all(
        isActive ? theme.colorScheme.primary : theme.colorScheme.onTertiary,
      ),
      activeColor: theme.colorScheme.secondary,
      activeTrackColor: theme.colorScheme.surface,
      inactiveThumbColor: theme.disabledColor,
      trackOutlineColor: WidgetStateProperty.all(
        theme.colorScheme.onPrimaryContainer,
      ),
    );
  }
}
