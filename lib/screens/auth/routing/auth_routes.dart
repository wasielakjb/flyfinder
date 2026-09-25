import 'package:auto_route/auto_route.dart';
import 'package:flyfinder/app/router/app_router.gr.dart';

abstract class AuthRoutes {
  static List<AutoRoute> routes = [
    AutoRoute(
      path: '/auth',
      page: AuthRoute.page,
      initial: true,
    ),
    AutoRoute(
      path: '/login',
      page: LoginRoute.page,
    ),
    AutoRoute(
      path: '/register',
      page: RegisterRoute.page,
    ),
  ];
}
