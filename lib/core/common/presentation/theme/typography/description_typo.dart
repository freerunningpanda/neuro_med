import 'package:flutter/widgets.dart';

abstract class DescriptionTypography {
  const DescriptionTypography({
    required this.des1,
    required this.des2,
  });

  /// Description / Des1
  final TextStyle des1;

  /// Description / Des2
  final TextStyle des2;
}
