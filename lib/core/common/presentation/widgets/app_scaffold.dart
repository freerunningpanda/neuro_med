import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:upmind_front_client/core/core.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    required this.body,
    super.key,
    this.appBar,
    this.safeAreaTop = true,
    this.safeAreaBottom = true,
    this.safeAreaLeft = true,
    this.safeAreaRight = true,
    this.floatingActionButtonLocation,
    this.floatingActionButton,
    this.extendsBehindBottomBar = false,
    this.bottomNavigationBar,
    this.resizeToAvoidBottomInset = true,
  });

  final Widget body;
  final PreferredSizeWidget? appBar;
  final bool safeAreaTop;
  final bool safeAreaBottom;
  final bool safeAreaLeft;
  final bool safeAreaRight;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Widget? floatingActionButton;
  final bool extendsBehindBottomBar;
  final Widget? bottomNavigationBar;
  final bool? resizeToAvoidBottomInset;

  @override
  Widget build(BuildContext context) => GestureDetector(
        // Hide keyboard by clicking any place of screen.
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
          SystemChannels.textInput.invokeMethod<void>('TextInput.hide');
        },
        child: Scaffold(
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
          key: key,
          appBar: appBar,
          backgroundColor: context.theme.colorScheme.primary,
          bottomNavigationBar: bottomNavigationBar,
          extendBody: extendsBehindBottomBar,
          floatingActionButton: floatingActionButton,
          floatingActionButtonLocation: floatingActionButtonLocation,
          body: SafeArea(
            top: safeAreaTop,
            bottom: safeAreaBottom,
            left: safeAreaLeft,
            right: safeAreaRight,
            child: body,
          ),
        ),
      );
}
