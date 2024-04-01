import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_app/page/splash_page.dart';
import 'package:quiz_app/page/swipe_quiz_page.dart';

part 'routes.g.dart';

@TypedGoRoute<SplashRoute>(path: '/', routes: <TypedGoRoute<GoRouteData>>[
  TypedGoRoute<SwipeQuizRoute>(path: 'swipe'),
  // TypedGoRoute<LoginRoute>(
  //   path: 'login',
  //   routes: [
  //     TypedGoRoute<RegisterRoute>(
  //       path: 'register',
  //       routes: [
  //         TypedGoRoute<VerifyRoute>(path: 'verify/:email'),
  //       ],
  //     ),
  //     TypedGoRoute<ResetPwRoute>(path: 'resetpw'),
  //     TypedGoRoute<WorkSpaceSelectRoute>(path: 'workspaceSelect'),
  //   ],ぶい
  // ),
])
class SplashRoute extends GoRouteData {
  const SplashRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const SplashPage();
}

class SwipeQuizRoute extends GoRouteData {
  const SwipeQuizRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => SwipeQuizPage();
}
