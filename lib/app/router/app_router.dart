import 'package:auto_route/auto_route.dart';
import 'package:flyfinder/app/router/app_router.gr.dart';
import 'package:injectable/injectable.dart';

@singleton
@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
    CustomRoute<void>(
      path: '/home',
      page: HomeRoute.page,
      initial: true,
      transitionsBuilder: TransitionsBuilders.noTransition,
    ),
  ];
}
