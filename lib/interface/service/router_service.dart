import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:wallet_app/components/ErrorScreen.dart';
import 'package:wallet_app/interface/view/linking_account_screen.dart';
import 'package:wallet_app/interface/view/point_conversion_screen.dart';
import 'package:wallet_app/interface/view/recover_words.dart';
import 'package:wallet_app/interface/view/exchange_point_screen.dart';
import 'package:wallet_app/interface/view/select_language_screen.dart';
import 'package:wallet_app/interface/view/sign_in.dart';
import 'package:wallet_app/interface/view/sign_up.dart';
import 'package:wallet_app/interface/view/verify_email_screen.dart';
import 'package:wallet_app/interface/view/welcome_screen.dart';

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
      // initialLocation: '/select-language',
      // initialLocation: '/welcome',
      // initialLocation: '/sign-up',
      // initialLocation: '/sign-in',
      // initialLocation: '/recover-words',
      // initialLocation: '/verify-email',
      // initialLocation: '/point-conversion',
      // initialLocation: '/linking-account',
      initialLocation: '/exchange-point',
      // (Authentication.state.isAuthentication) ? '/' : '/login',
      // refreshListenable: Authentication.state,
      errorBuilder: (context, state) {
        return const ErrorScreen();
      },
      routes: [
        GoRoute(
          path: '/select-language',
          builder: (context, state) => const SelectLanguageScreen(),
        ),
        GoRoute(
          path: '/welcome',
          builder: (context, state) => const WelcomeScreen(),
        ),
        GoRoute(
          path: '/sign-up',
          builder: (context, state) => const SignUp(),
        ),
        GoRoute(
          path: '/sign-in',
          builder: (context, state) => const SignIn(),
        ),
        GoRoute(
          path: '/recover-words',
          builder: (context, state) => const RecoverWords(),
        ),
        GoRoute(
          path: '/verify-email',
          builder: (context, state) => const VerifyEmailScreen(),
        ),
        GoRoute(
          path: '/point-conversion',
          builder: (context, state) => const PointConversionScreen(),
        ),
        GoRoute(
          path: '/linking-account',
          builder: (context, state) => const LinkingAccountScreen(),
        ),
        GoRoute(
          path: '/exchange-point',
          builder: (context, state) => const RedeemingPointScreen(),
        ),
      ],
    );
  }
}
