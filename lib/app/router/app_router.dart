import 'package:auto_route/auto_route.dart';
import 'package:flyfinder/screens/auth/routing/auth_routes.dart';
// import 'package:flyfinder/screens/onboarding/routing/onboarding_routes.dart';
import 'package:injectable/injectable.dart';

@singleton
@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
    // ...OnBoardingRoutes.routes,
    ...AuthRoutes.routes,
  ];
}
