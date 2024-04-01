import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_app/router/routes.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final _key = GlobalKey<NavigatorState>(debugLabel: 'routerKey');

final routerProvider = Provider((ref) {
  return GoRouter(
    navigatorKey: _key,
    observers: [],
    // Keep this to `true` if want to know what's going on under the hood
    debugLogDiagnostics: true,
    initialLocation: '/swipe',
    routes: $appRoutes,
    // redirect: (context, state) async {
    //   final inLoginRoute = state.uri.toString() == '/login/register' ||
    //       state.uri.toString() == '/login' ||
    //       state.uri.toString().contains('verify') ||
    //       state.uri.toString() == '/login/resetpw' ||
    //       state.uri.toString() == '/login/workspaceSelect';

    //   if (maintenanceInfo.isUnderMaintenance) {
    //     return '/maintenance';
    //   }

    //   final hasLogin = ref.read(loginStateProvider);

    //   if (!hasLogin) {
    //     // We're not logged in
    //     // So, IF we aren't in the login page, go there.
    //     return inLoginRoute ? null : '/login';
    //   }
    //   // We're logged in
    //   if (inLoginRoute) {
    //     return '/home';
    //   }

    //   // There's no need for a redirect at this point.
    //   return null;
    // },
    errorPageBuilder: (context, state) => MaterialPage(
      key: state.pageKey,
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Sorry',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: Theme.of(context).colorScheme.outline,
                      ),
                ),
                const SizedBox(height: 16),
                Text(
                  ' ページが見つかりません',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
});
