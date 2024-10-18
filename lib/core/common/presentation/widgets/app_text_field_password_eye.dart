import 'package:flutter/material.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/core/utils/constants/app_constants.dart';
import 'package:upmind_front_client/core/utils/gen/assets.gen.dart';

class TextFieldPasswordEyeWidget extends StatelessWidget {
  const TextFieldPasswordEyeWidget({
    required this.obscure,
    required this.onTap,
    super.key,
  });

  final bool obscure;
  final void Function() onTap;

  String get _assetName => obscure
      ? Assets.icons.common.eyeOff.path
      : Assets.icons.common.eyeOpen.path;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.only(right: AppConstants.commonSize16),
          child: SvgGenImage(
            _assetName,
          ).svg(
            colorFilter: ColorFilter.mode(
              context.theme.colorScheme.primary,
              BlendMode.srcIn,
            ),
          ),
        ),
      );
}
