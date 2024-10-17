
import 'package:architecture_template/feature/home/view/home_view.dart';
import 'package:auto_route/auto_route.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: AppRouter._replaceRouteName)

/// Project router information class
final class AppRouter extends RootStackRouter  {
  static const _replaceRouteName = 'View,Route';
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: HomeRoute.page, initial: true),
  ];
}