import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:town_square/core/route/app_routes.dart';
import 'package:town_square/features/activities/view/activities_view.dart';
import 'package:town_square/features/dashboard/dashboard.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorKey = GlobalKey<NavigatorState>();

  static GoRouter get router => _router;

  static final GoRouter _router = GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    initialLocation: AppRoutes.home,
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (_, __, child) => DashboardPage(child: child),
        routes: [
          GoRoute(
            path: AppRoutes.home,
            builder: (_, __) => const ActivitiesView(),
          ),
        ],
      ),
    ],
  );
}
