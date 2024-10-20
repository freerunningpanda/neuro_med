import 'dart:ui';

abstract class MainColors {
  const MainColors({
    required this.primary,
    required this.accent,
    required this.bg70,
    required this.white,
  });

  final Color primary;

  final Color accent;

  final Color bg70;

  final Color white;
}
