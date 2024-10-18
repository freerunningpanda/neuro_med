part of '../../core.dart';

extension BuildContextExt on BuildContext {
  ThemeData get theme => Theme.of(this);

  S get tr => S.of(this);

  Size get screenSize => MediaQuery.of(this).size;

  void popUntil(
    bool Function(Route<dynamic>) predicate,
  ) =>
      router.popUntil(predicate);

  void unfocus() => FocusScope.of(this).unfocus();

  void requestFocus([FocusNode? node]) =>
      FocusScope.of(this).requestFocus(node);

  void nextFocus() => FocusScope.of(this).nextFocus();

  void pushNamedAndRemoveUntil(String path) =>
      Navigator.of(this).pushNamedAndRemoveUntil(
        path,
        (_) => false,
      );

  void push(PageRouteInfo route) => router.push(route);

  void replace(PageRouteInfo route) => router.replace(route);

  void replaceAll(List<PageRouteInfo> routes) => router.replaceAll(routes);

  void popAndPush(PageRouteInfo route) => router.popAndPush(route);

  void pop<T>([T? result]) => router.maybePop(result);

  bool canPop() => router.canPop();

  void forcePop<T>([T? result]) => router.popForced(result);

  void navigate(PageRouteInfo route) => router.navigate(route);
}
