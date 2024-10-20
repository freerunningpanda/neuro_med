import 'package:flutter/widgets.dart';

abstract class TextTypography {
  const TextTypography({
    required this.tx1Regular,
    required this.tx1SemiBold,
    required this.tx2Regular,
    required this.tx4Medium,
  });

  /// Text / Tx1  - Regular
  final TextStyle tx1Regular;

  /// Text / Tx1  - SemiBold
  final TextStyle tx1SemiBold;

  /// Text / Tx2  - Regular
  final TextStyle tx2Regular;

  /// Text / Tx4  - Medium
  final TextStyle tx4Medium;
}
