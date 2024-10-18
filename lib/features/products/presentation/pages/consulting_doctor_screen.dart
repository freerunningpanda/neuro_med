import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:upmind_front_client/core/common/presentation/router/app_router.gr.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_all_buttons.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_bar/active_app_bar.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_button.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_scaffold.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/default_app_canvas.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/core/utils/constants/app_constants.dart';

part 'content/content.dart';

@RoutePage()
class ConsultingDoctorScreen extends StatelessWidget {
  const ConsultingDoctorScreen({
    required this.previousScreenTitle,
    required this.productTitle,
    super.key,
  });

  final String previousScreenTitle;
  final String productTitle;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: ActiveAppBar(
        screenTitle: previousScreenTitle,
        trailing: AppAllButtons(
          previousScreenTitle: productTitle,
        ),
      ),
      body: DefaultAppCanvas(
        title: productTitle,
        showBottomDivider: false,
        child: Column(
          children: [
            const _Body(),
            _Footer(
              productTitle: productTitle,
            ),
          ],
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Expanded(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: context.theme.colorScheme.primary.withOpacity(0.15),
        ),
        child: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.commonSize24,
            vertical: AppConstants.commonSize20,
          ),
          children: [
            Text(
              _Content.topDescription,
              style: theme.primaryTextTheme.bodyMedium,
            ),
            for (var i = 1; i <= _Content.descriptionItems.length; i++)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('$i. ', style: theme.primaryTextTheme.bodyMedium),
                  Flexible(
                    child: Text(
                      _Content.descriptionItems[i - 1],
                      style: theme.primaryTextTheme.bodyLarge?.copyWith(
                        color: theme.colorScheme.onSecondary,
                      ),
                    ),
                  ),
                ],
              ),
            Text(
              _Content.bottomDescription,
              style: theme.primaryTextTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer({
    required this.productTitle,
  });

  final String productTitle;

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            stops: const [0.0, 0.1, 0.3],
            begin: Alignment.topCenter,
            end: Alignment.center,
            colors: [
              context.theme.dividerTheme.color!,
              context.theme.dividerTheme.color!.withOpacity(0.9),
              context.theme.dividerTheme.color!.withOpacity(0.1),
            ],
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: AppConstants.commonSize8,
              ),
              child: AppButton(
                title: context.tr.consultDoctor,
                onPressed: () => context.push(
                  ConsultingDoctorFormRoute(
                    previousScreenTitle: productTitle,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
