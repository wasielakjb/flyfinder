import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flyfinder/app/router/app_router.dart';
import 'package:flyfinder/app/theme/app_theme.dart';
import 'package:flyfinder/di.dart';

class App extends StatelessWidget {
  App({super.key});

  final AppRouter _router = inject<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      routerConfig: _router.config(
        navigatorObservers: () => [AutoRouteObserver()],
      ),
    );
  }
}
