import 'dart:ui';

abstract class OtherColors {
  const OtherColors({
    required this.separator,
    required this.transparent,
    required this.gray,
    required this.gray2,
  });

  final Color separator;
  final Color transparent;
  final Color gray;
  final Color gray2;
}
