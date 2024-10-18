import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppSvgImage extends StatelessWidget {
  const AppSvgImage({
    required this.assetName,
    super.key,
    this.color,
    this.size,
    this.fit,
  });
  final String assetName;
  final Color? color;
  final double? size;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: size,
        width: size,
        child: SvgPicture.asset(
          assetName,
          fit: fit == null ? BoxFit.contain : BoxFit.none,
          colorFilter:
              color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
        ),
      );
}
