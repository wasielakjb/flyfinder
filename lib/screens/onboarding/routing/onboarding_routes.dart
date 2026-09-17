import 'package:auto_route/auto_route.dart';
import 'package:flyfinder/app/router/app_router.gr.dart';

abstract class OnBoardingRoutes {
  static List<AutoRoute> routes = [
    AutoRoute(
      path: '/onboarding',
      page: OnBoardingRoute.page,
      initial: true
    ),
  ];
}
