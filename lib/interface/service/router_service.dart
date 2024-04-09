import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:wallet_app/components/ErrorScreen.dart';
import 'package:wallet_app/interface/view/LoginPage.dart';

class RouterService {
  static final RouterService _instance = RouterService._privateConstructor();
  static bool _isInitialize = false;
  static bool get isInitialize => _isInitialize;

  static RouterService get instance => _instance;
  late final GoRouter _goRouter;

  GoRouter get router => _goRouter;

  initializeRoute() async {
    RouterService._isInitialize = true;
  }

  RouterService._privateConstructor() {
    _goRouter = GoRouter(
      debugLogDiagnostics: kDebugMode ? true : false,
      // observers: [_logger.getObserver()],
      initialLocation: '/login',
      // (Authentication.state.isAuthentication) ? '/' : '/login',
      // refreshListenable: Authentication.state,
      errorBuilder: (context, state) {
        return const ErrorScreen();
      },
      routes: [
        GoRoute(
          path: '/login',
          builder: (context, state) => const LoginPage(),
        ),
      ],
    );
  }
}
