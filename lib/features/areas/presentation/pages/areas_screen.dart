import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upmind_front_client/core/common/presentation/router/app_router.gr.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_all_buttons.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_bar/active_app_bar.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_divider.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_error.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_ripple_button.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/app_scaffold.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/custom_progress_indicator.dart';
import 'package:upmind_front_client/core/common/presentation/widgets/default_app_canvas.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/core/utils/constants/app_constants.dart';
import 'package:upmind_front_client/features/areas/presentation/bloc/areas_bloc.dart';
import 'package:upmind_front_client/features/areas/presentation/widgets/area_item.dart';

@RoutePage()
class AreasScreen extends StatelessWidget implements AutoRouteWrapper {
  const AreasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return AppScaffold(
      appBar: ActiveAppBar(
        // ignore: lines_longer_than_80_chars
        // TODO(freerunningpanda): на данный экран переход только с главного экрана.
        // если будут добавлены другие экраны.
        // то вынести в параметр previousScreenTitle.
        screenTitle: context.tr.upmind_products,
        trailing: AppAllButtons(
          previousScreenTitle: context.tr.areas,
        ),
      ),
      body: DefaultAppCanvas(
        hasCross: true,
        showBottomDivider: false,
        title: context.tr.areas,
        child: BlocBuilder<AreasBloc, AreasState>(
          builder: (_, state) => switch (state) {
            AreasLoading _ =>
              CustomProgressIndicator.instance.progressIndicator,
            AreasLoaded(areaList: final areaList) => ListView.builder(
                itemCount: areaList.length,
                itemBuilder: (_, index) {
                  final area = areaList[index];

                  return AppRippleButton(
                    onTap: () => context.push(
                      ConsultingDoctorRoute(
                        previousScreenTitle: context.tr.areas,
                        productTitle: area.name,
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: AppConstants.commonSize6,
                            horizontal: AppConstants.commonSize24,
                          ),
                          child: AreaItem(area: area),
                        ),
                        if (index != areaList.length - 1)
                          Container(
                            height: AppConstants.commonSize6,
                            color: theme.dividerTheme.color,
                          ),
                        if (index == areaList.length - 1) const AppDivider(),
                      ],
                    ),
                  );
                },
              ),
            AreasError() => AppError(
                onPressed: () => context
                  ..read<AreasBloc>().add(
                    const LoadAreas(),
                  ),
              ),
          },
        ),
      ),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider(
        create: (_) => sl<AreasBloc>()..add(const LoadAreas()),
        child: this,
      );
}
