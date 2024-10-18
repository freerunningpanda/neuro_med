import 'dart:ui';

abstract class ButtonColors {
  const ButtonColors({
    required this.primary,
    required this.accent,
    required this.secondary,
  });

  final Color primary;

  final Color accent;

  final Color secondary;
}
