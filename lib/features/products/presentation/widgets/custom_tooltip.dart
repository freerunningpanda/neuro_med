import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upmind_front_client/core/common/presentation/router/app_router.gr.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/core/utils/constants/app_constants.dart';
import 'package:upmind_front_client/features/products/domain/entities/user_video.dart';
import 'package:upmind_front_client/features/products/presentation/cubit/landscape_session_list/landscape_session_list_cubit.dart';
import 'package:upmind_front_client/features/products/presentation/cubit/session_item/session_item_cubit.dart';
import 'package:upmind_front_client/features/products/presentation/utils/status.dart';

class CustomTooltip extends StatefulWidget {
  const CustomTooltip({
    required this.index,
    required this.userVideo,
    required this.isPortrait,
    required this.child,
    this.duration =
        const Duration(seconds: 2), // Время, через которое тултип исчезнет
    super.key,
  });
  final int index;
  final UserVideo userVideo;
  final Duration duration;
  final bool isPortrait;
  final Widget child;

  @override
  State<CustomTooltip> createState() => _CustomTooltipState();
}

class _CustomTooltipState extends State<CustomTooltip> {
  OverlayEntry? _overlayEntry;
  Timer? _timer;
  late SessionItemCubit _sessionItemCubit; // Сохраняем кубит

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _sessionItemCubit = context.read<SessionItemCubit>();
  }

  void _showTooltip() {
    final overlay = Overlay.of(context);
    final renderBox = context.findRenderObject()! as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);
    final theme = context.theme;

    _sessionItemCubit.setIndex(widget.index);

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        left: offset.dx * 5,
        top: offset.dy - size.height,
        child: Material(
          color: theme.hoverColor,
          child: Container(
            padding: const EdgeInsets.all(AppConstants.commonSize16),
            decoration: BoxDecoration(
              color: theme.colorScheme.onPrimary,
              borderRadius: BorderRadius.circular(AppConstants.commonRadius4),
              boxShadow: [
                BoxShadow(
                  color: theme.colorScheme.onSecondary.withOpacity(0.1),
                  blurRadius: AppConstants.commonSize14,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: SizedBox(
              width: renderBox.size.width / 1.7,
              child: Text(
                widget.userVideo.status.getTooltipText(context),
                style: theme.textTheme.labelMedium,
              ),
            ),
          ),
        ),
      ),
    );

    overlay.insert(_overlayEntry!);
    _timer = Timer(widget.duration, _hideTooltip);
  }

  void _hideTooltip() {
    _timer?.cancel();
    _overlayEntry?.remove();
    _overlayEntry?.dispose();
    _overlayEntry = null;
    _sessionItemCubit.setIndex(-1); // Безопасно работаем с кубитом
  }

  @override
  void dispose() {
    _hideTooltip();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => switch (widget.userVideo.status) {
        Status.inProgress => widget.isPortrait
            ? context.pop<UserProductDetailRoute>()
            : context.read<LandscapeSessionListCubit>().toggleVisibility(),
        _ => _showTooltip(),
      },
      child: widget.child,
    );
  }
}
